
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project name used in tags and naming"
  type        = string
  default     = "cloudify"
}

variable "ssh_allowed_cidrs" {
  description = "CIDRs that are allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]

}
