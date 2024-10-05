provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_1"
  region = "us-west-1"
}


resource "aws_security_group" "nginx_sg_us_east_1" {
  provider    = aws.us_east_1
  name        = "nginx-sg-us-east-1"
  description = "Allow HTTP traffic on port 80"

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

  tags = {
    Name = "nginx-sg-us-east-1"
  }
}


resource "aws_security_group" "nginx_sg_us_west_1" {
  provider    = aws.us_west_1
  name        = "nginx-sg-us-west-1"
  description = "Allow HTTP traffic on port 80"

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

  tags = {
    Name = "nginx-sg-us-west-1"
  }
}


resource "aws_instance" "ec2_us_east_1" {
  provider      = aws.us_east_1
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  key_name      = "firstuseastone"

  vpc_security_group_ids = [aws_security_group.nginx_sg_us_east_1.id]

  tags = {
    Name = "EC2-US-East-1-Nginx"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
			  echo '<h1>This is us-east-1 instance</h1>' | sudo tee /usr/share/nginx/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}


resource "aws_instance" "ec2_us_west_1" {
  provider      = aws.us_west_1
  ami           = "ami-09b2477d43bc5d0ac"
  instance_type = "t2.micro"
  key_name      = "firstuswestone"

  vpc_security_group_ids = [aws_security_group.nginx_sg_us_west_1.id]

  tags = {
    Name = "EC2-US-West-1-Nginx"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nginx
			  echo '<h1>This is us-west-1 instance</h1>' | sudo tee /usr/share/nginx/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

# Outputs
output "us_east_instance_public_ip" {
  value = aws_instance.ec2_us_east_1.public_ip
}

output "us_west_instance_public_ip" {
  value = aws_instance.ec2_us_west_1.public_ip
}
