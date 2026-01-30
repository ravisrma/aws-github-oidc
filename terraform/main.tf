data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "demo" {
  bucket = "github-oidc-demo-${data.aws_caller_identity.current.account_id}-${var.environment}"
}
