terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "envrionment" {
  default = "Dev"
  type = string
}

# creating s3 in dev env
resource "aws_s3_bucket" "name" {
  bucket = "local-bucket-variable-demo"

  tags = {
    "Environment": var.envrionment
    "Name": "Local Demo Bucket for variables"
  }
}


# creating vpc in dev env
resource "aws_vpc" "sampleVPC" {
    cidr_block = "10.0.1.0/24"

    tags = {
      "Environment" : var.envrionment
      "Name" : "sample vpc for understanding variables"
    }

}

