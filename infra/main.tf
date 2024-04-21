terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.57.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

locals {
  myip = "39.115.82.127/32"
}

resource "aws_instance" "flask" {
  ami = "ami-04c596dcf23eb98d8"
  instance_type = "t3.micro"

  associate_public_ip_address = true
  key_name = "cicd"

  security_groups = ["default_sg"]

  tags = {
    Name = "flask"
  }
}

resource "aws_instance" "cicd" {
  ami = "ami-04c596dcf23eb98d8"
  instance_type = "m5.large"

  associate_public_ip_address = true
  key_name = "cicd"

  security_groups = ["cicd_sg"]

  tags = {
    Name = "cicd"
  }
}


resource "aws_security_group" "allow_tls" {
  name        = "default_sg"
  ingress {
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = [local.myip]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [local.myip, "${aws_instance.cicd.public_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "cicd_sg" {
  name        = "cicd_sg"
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [local.myip, "192.30.252.0/22", "185.199.108.0/22", "140.82.112.0/20", "143.55.64.0/20"]
    ipv6_cidr_blocks = ["2a0a:a440::/29", "2606:50c0::/32"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [local.myip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}