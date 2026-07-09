terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
	} 
  }
}
provider "aws" {
  region = "ap-south-1"
  }
resource "aws_instance" "MyWk20Project" {
  ami = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  # Automatically installs Apache and copies your HTML on boot
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "${file("index.html")}" > /var/www/html/index.html
              EOF
}
