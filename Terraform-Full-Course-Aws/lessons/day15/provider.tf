terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  alias = var.Primary
}

provider "aws" {
  region = "eu-west-3"
  alias = var.Secondary
}
