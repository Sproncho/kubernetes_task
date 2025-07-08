You said:
variable "bucket_name" {
  description = "The name of the S3 bucket (must be globally unique)"
  type        = string
  default     = "my-unique-bucket-aviram-12345"
}

variable "expiration_days" {
  description = "Number of days before objects expire"
  type        = number
  default     = 30
}

variable "enable_versioning" {
  description = "Whether to enable versioning"
  type        = bool
  default     = true
}

variable "bucket_tag_name" {
  description = "Tag for identifying the bucket"
  type        = string
  default     = "Aviram Bucket"
}

variable "environment" {
  description = "Environment tag (e.g. dev/stage/prod)"
  type        = string
  default     = "dev"
}