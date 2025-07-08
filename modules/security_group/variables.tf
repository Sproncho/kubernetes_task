variable "ssh_allowed_ips" {
  description = "List of allowed SSH IPs per workspace"
  type = map(string)
  default = {
    dev  = "192.168.1.10/32"
    prod = "203.0.113.5/32"
  }
}

variable "vpc_id" {
  description = "VPC ID where to deploy the security group"
  type        = string
}
