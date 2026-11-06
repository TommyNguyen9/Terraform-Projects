resource "aws_vpc" "primary_vpc" {
  cidr_block       = var.primary_vpc_cidr
  provider = aws.Primary
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "Primary-VPC-${var.Primary}"
  }
}

resource "aws_vpc" "secondary_vpc" {
  cidr_block       = var.secondary_vpc_cidr
  provider = aws.Secondary
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "Secondary-VPC-${var.Secondary}"
  }
}

# Subnet in Primary VPC
resource "aws_subnet" "primary_subnet" {
  provider                = aws.primary
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_vpc_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Primary-Subnet-${var.primary_region}"
    Environment = "Demo"
  }
}

# Subnet in Secondary VPC
resource "aws_subnet" "secondary_subnet" {
  provider                = aws.secondary
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_subnet_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Secondary-Subnet-${var.secondary_region}"
    Environment = "Demo"
  }
}