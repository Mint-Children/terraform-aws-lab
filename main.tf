terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-2"
  profile = "terraform-lab"
}

resource "aws_vpc" "lab" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-lab-vpc"
  }
}