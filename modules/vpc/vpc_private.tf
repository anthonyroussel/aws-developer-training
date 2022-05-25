resource "aws_subnet" "private" {
  for_each = var.private_subnets

  availability_zone_id = each.value["az"]
  cidr_block           = each.value["cidr"]
  vpc_id               = aws_vpc.vpc.id

  tags = {
    Name = "private-${each.value["az"]}"
  }
}

resource "aws_route_table" "private" {
  for_each = var.private_subnets

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public.id
  }

  tags = {
    Name = "private-${each.value["az"]}"
  }
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnets

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]
}
