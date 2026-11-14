terraform {

    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }

    backend "s3" {
      bucket = "sanjana-remote-backend-s3-terraform"
      key = "dev/terraform.tfstate"
      region = "us-east-1"
      encrypt = true
      use_lockfile = true
    }

}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "second-demo-bucket" {
  bucket = "sanjana-demo-bucket-terraform-2"

  tags = {
    "Environment": "Dev"
    "Name": "My Bucket 2.0"
  }
}

