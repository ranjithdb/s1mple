provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_1"
  region = "us-west-1"
}

resource "aws_instance" "ec2_us_east_1" {
  provider      = aws.us_east_1
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  key_name      = "firstuseastone"

  tags = {
    Name = "Linux-EC2-US-East-1"
  }
}

resource "aws_instance" "ec2_us_west_1" {
  provider      = aws.us_west_1
  ami           = "ami-09b2477d43bc5d0ac"
  instance_type = "t2.micro"
  key_name      = "firstuswestone"

  tags = {
    Name = "Linux-EC2-US-West-1"
  }
}

output "us_east_instance_public_ip" {
  value = aws_instance.ec2_us_east_1.public_ip
}

output "us_west_instance_public_ip" {
  value = aws_instance.ec2_us_west_1.public_ip
}
