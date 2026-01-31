data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "main" {
  bucket = "github-oidc-${data.aws_caller_identity.current.account_id}-${var.environment}"
}
