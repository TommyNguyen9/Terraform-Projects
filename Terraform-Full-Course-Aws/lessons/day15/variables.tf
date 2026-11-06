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

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     =  "t3.micro"
}

variable "primary_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "secondary_vpc_cidr" {
  default = "10.0.0.0/16"
}


