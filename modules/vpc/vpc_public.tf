resource "aws_subnet" "public" {
  for_each = var.public_subnets

  availability_zone_id = each.value["az"]
  cidr_block           = each.value["cidr"]
  vpc_id               = aws_vpc.vpc.id

  tags = {
    Name = "public-${each.value["az"]}"
  }
}

resource "aws_route_table" "public" {
  for_each = var.public_subnets

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nat_gateway.id
  }

  tags = {
    Name = "public-${each.value["az"]}"
  }
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnets

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public[each.key].id
}

resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}

resource "aws_nat_gateway" "public" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public["primary"].id
}

output "nat_gateway_ip" {
  value = aws_eip.nat_gateway.public_ip
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}
