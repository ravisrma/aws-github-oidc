provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      environment = var.environment,
      project     = "github-oidc-setup"
    }
  }
}

terraform {
  backend "s3" {
  }
}
