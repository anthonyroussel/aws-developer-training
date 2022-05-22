resource "aws_s3_bucket" "cloudfront" {
  bucket = "demo-cloudfront-aroussel"

  tags = {
    Name = "Udemy Cloudfront"
  }
}

resource "aws_s3_bucket_public_access_block" "cloudfront" {
  bucket = aws_s3_bucket.cloudfront.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "html" {
  for_each = fileset("./files/", "*.html")

  bucket = aws_s3_bucket.cloudfront.id
  key    = each.value
  source = "./files/${each.value}"

  # Default content type is application/octet-stream :/
  content_type = "text/html"
}


resource "aws_s3_object" "images" {
  for_each = fileset("./files/", "*.jpg")

  bucket = aws_s3_bucket.cloudfront.id
  key    = each.value
  source = "./files/${each.value}"

  # Default content type is application/octet-stream :/
  content_type = "image/jpeg"
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.cloudfront.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.example.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudfront" {
  bucket = aws_s3_bucket.cloudfront.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
