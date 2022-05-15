variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "region" {
  type    = string
  default = "ap-northeast-1"
}
variable "envirnment" {
  type = string
}
variable "project" {
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


