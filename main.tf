terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "cloudify-prod-terraform-state" # заменить на имя бакета
    key            = "main/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloudify-prod-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

module "security_group" {
  source       = "../modules/security_group"
  project_name = var.project_name
  ssh_cidrs    = var.ssh_allowed_cidrs
}

module "ec2" {
  source         = "../modules/ec2"
  project_name   = var.project_name
  aws_region     = var.aws_region
  instance_type  = var.instance_type
  security_group = module.security_group.security_group_id
}

module "ebs" {
  source          = "../modules/ebs"
  project_name    = var.project_name
  aws_region      = var.aws_region
  ec2_instance_id = module.ec2.instance_id
}

module "s3" {
  source       = "../modules/s3"
  project_name = var.project_name
}
