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

variable "primary_subnet_cidr" {
  type         = string
  description  = "CIDR block for secondary subnet"
  default      = "10.0.1.0/24"

}

variable "secondary_subnet_cidr" {
  type         = string
  description  = "CIDR block for secondary subnet"
  default      = "10.1.1.0/24"

}

variable "primary_key_name" {
  description = "Name of the SSH key pair for Primary VPC instance (eu-west-1)"
  type        = string
  default     = ""
}

variable "secondary_key_name" {
  description = "Name of the SSH key pair for Secondary VPC instance (eu-west-3)"
  type        = string
  default     = ""
}

