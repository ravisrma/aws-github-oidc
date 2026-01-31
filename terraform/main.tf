data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = "github-oidc-${var.environment}"
}
