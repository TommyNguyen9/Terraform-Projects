variable "Primary" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "eu-west-1"
}

variable "Secondary" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "eu-west-3"
}

variable "bucket_name" {
  default = "terraformprojects"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name."
  type        = string
  default     = "my-static-website-"
}

