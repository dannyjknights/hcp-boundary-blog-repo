# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "eu-west-2"
}


