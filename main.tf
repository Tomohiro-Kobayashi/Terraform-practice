variable "access_key" {}
variable "secret_key" {}
variable "region" {
  type    = string
  default = "ap-northeast-1"
}
variable "envirnment" {
  type = string
}


terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  /* profile = "default" */
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_instance" "hello-world" {
  ami           = "ami-02c3627b04781eada"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }

  user_data = <<EOF
#!/bin/bash
amazon-linux-extras install -y nginx1.12
systemctl start nginx
EOF
}

