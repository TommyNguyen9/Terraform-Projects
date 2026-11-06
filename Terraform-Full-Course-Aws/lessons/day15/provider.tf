terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.Primary
  alias = "Primary"
}

provider "aws" {
  region = var.Secondary
  alias = "Secondary"
}
