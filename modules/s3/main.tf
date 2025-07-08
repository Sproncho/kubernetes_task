provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  lifecycle_rule {
    id      = "delete-after-30-days"
    enabled = true

    expiration {
      days = var.expiration_days
    }
  }

  versioning {
    enabled = var.enable_versioning
  }

  tags = {
    Name        = var.bucket_tag_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}