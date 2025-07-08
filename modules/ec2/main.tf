resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "MyEC2Instance"
    Environment = "Dev"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  vpc = true
}

output "public_url" {
  value = "http://${aws_eip.this.public_ip}"
  description = "The public URL of the EC2 instance"
}