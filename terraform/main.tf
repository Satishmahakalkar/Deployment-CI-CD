provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_instance" "strapi_app" {
  ami           = "ami-084568db4383264d4"  # This is a sample Ubuntu AMI, use the appropriate AMI for your region
  instance_type = "t2.small"
  key_name      = var.key_name

  tags = {
    Name = "Strapi-EC2"
  }

  # Provisioning Docker
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl enable docker
              systemctl start docker
              docker pull ${var.image_tag}
              docker run -d -p 80:1337 ${var.image_tag}
              EOF

  # SSH Access
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.subnet.id
}

resource "aws_security_group" "sg" {
  name        = "strapi_sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

output "ec2_public_ip" {
  value = aws_instance.strapi_app.public_ip
}
