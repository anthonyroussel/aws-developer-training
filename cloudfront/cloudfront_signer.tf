resource "aws_cloudfront_public_key" "signer" {
  name        = "udemy"
  comment     = "udemy"
  encoded_key = file("tls/public.pem")
}

resource "aws_cloudfront_key_group" "signer" {
  name    = "udemy"
  comment = "udemy"
  items   = [aws_cloudfront_public_key.signer.id]
}
