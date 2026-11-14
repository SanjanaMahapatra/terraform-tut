terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

# Configure the AWS provider 
provider "aws" {
    region = "us-east-1"
}

# Create a S3 bucket 

resource "aws_s3_bucket" "first-demo-bucket" {
    bucket = "sanjana-demo-bucket-terraform"

    tags = {
        Name = "My Demo Bucket"
        Environment = "Dev"
    }

    region = "us-east-1"
}
