
output "ec2_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2.public_ip
}

output "volume_id" {
  description = "EBS volume ID"
  value       = module.ebs.volume_id
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.bucket_name
}

output "elastic_ip_dns" {
  description = "Elastic IP DNS (if applicable)"
  value       = module.ec2.elastic_ip

}
