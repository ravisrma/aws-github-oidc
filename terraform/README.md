# Terraform: GitHub OIDC S3 Demo

This module creates a minimal S3 bucket per environment (dev/test/prod) to demonstrate deploying via GitHub Actions using AWS OIDC.

State backend uses the existing bucket `tf-backend-183103430916` with a per-environment key under `state/github-oidc/<env>/terraform.tfstate`.

## Files
- `backend.tf`: Declares the S3 backend (values supplied at init)
- `providers.tf`: AWS provider (region passed as var)
- `variables.tf`: All configurable inputs
- `main.tf`: Single S3 bucket resource
- `outputs.tf`: Useful outputs
- `env/*.tfvars`: Pre-baked values per environment

## Pre-requisites
- The backend bucket `tf-backend-183103430916` exists and is accessible to your role.
- Provide an AWS region when running (`-var aws_region=...`).

## Local usage
Example for dev:

```bash
terraform -chdir=terraform init \
  -backend-config="bucket=tf-backend-183103430916" \
  -backend-config="key=state/github-oidc/dev/terraform.tfstate" \
  -backend-config="region=<your-region>"

terraform -chdir=terraform plan \
  -var-file="env/dev.tfvars" \
  -var "aws_region=<your-region>"

terraform -chdir=terraform apply -auto-approve \
  -var-file="env/dev.tfvars" \
  -var "aws_region=<your-region>"
```

Bucket name pattern: `<bucket_name_prefix>-<environment>-<account_id>` (e.g., `github-oidc-demo-dev-123456789012`).

## Notes
- Adjust `bucket_name_prefix` and `tags` as needed.
