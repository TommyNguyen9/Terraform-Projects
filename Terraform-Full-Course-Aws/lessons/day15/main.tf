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
  provider                = aws.Primary
  vpc_id                  = aws_vpc.primary_vpc.id
  cidr_block              = var.primary_vpc_cidr
  availability_zone       = data.aws_availability_zones.primary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Primary-Subnet-${var.Primary}"
    Environment = "Demo"
  }
}

# Subnet in Secondary VPC
resource "aws_subnet" "secondary_subnet" {
  provider                = aws.Secondary
  vpc_id                  = aws_vpc.secondary_vpc.id
  cidr_block              = var.secondary_subnet_cidr
  availability_zone       = data.aws_availability_zones.secondary.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name        = "Secondary-Subnet-${var.Secondary}"
    Environment = "Demo"
  }
}

resource "aws_internet_gateway" "primary_igw" {
  provider = aws.Primary
  vpc_id = aws_vpc.primary_vpc.id

  tags = {
    Name        = "Primary-IGW-${var.Primary}"
    Environment = "Demo"
  }
}

resource "aws_internet_gateway" "secondary_igw" {
  provider = aws.Secondary
  vpc_id = aws_vpc.secondary_vpc.id

  tags = {
    Name        = "Secondary-IGW-${var.Secondary}"
    Environment = "Demo"
  }
}

# Route table for Primary VPC
resource "aws_route_table" "primary_rt" {
  provider = aws.Primary
  vpc_id   = aws_vpc.primary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary_igw.id
  }

  tags = {
    Name        = "Primary-Route-Table"
    Environment = "Demo"
  }
}

# Route table for Secondary VPC
resource "aws_route_table" "secondary_rt" {
  provider = aws.Secondary
  vpc_id   = aws_vpc.secondary_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.secondary_igw.id
  }

  tags = {
    Name        = "Secondary-Route-Table"
    Environment = "Demo"
  }
}

resource "aws_route_table_association" "primary_rta" {
  provider = aws.Primary
  subnet_id = aws_subnet.primary_subnet.id
  route_table_id = aws_route_table.primary_rt.id
}

resource "aws_route_table_association" "secondary_rta" {
  provider = aws.Secondary
  subnet_id = aws_subnet.secondary_subnet.id
  route_table_id = aws_route_table.secondary_rt.id
}
