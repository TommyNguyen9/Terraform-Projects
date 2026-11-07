terraform {
  backend "s3" {
    bucket = "smoke-terraform-2026"
    key    = "lessons/day15/terraform.tfstate"
    region = "eu-west-2"
  }
}
