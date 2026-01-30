output "bucket_name" {
  description = "The name of the demo S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "The ARN of the demo S3 bucket"
  value       = aws_s3_bucket.demo.arn
}
