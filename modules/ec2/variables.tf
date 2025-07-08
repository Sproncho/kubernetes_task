variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the existing Key Pair"
  type        = string
}

variable "security_group_id" {
  description = "ID of the existing Security Group"
  type        = string
}