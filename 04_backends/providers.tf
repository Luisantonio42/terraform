terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-remote-backend-02072026"
    region = "us-west-2"
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "terraform"
}
