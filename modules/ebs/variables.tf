variable "aws_region" {
  description = "AWS region (used to calculate AZ)"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "ec2_instance_id" {
  description = "ID of the EC2 instance to attach the volume to"
  type        = string
}
