variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

provider "aws" {
  /* profile = "default" */
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "hello-world" {
  ami = "ami-02c3627b04781eada"
  instance_type = "t2.micro"
}

