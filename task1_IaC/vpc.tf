##### THIS FILE MANAGES ALL VPC-RELATED RESOURCES #####

######################## VPCs #########################
resource "aws_vpc" "main" {
  cidr_block           = var.AWS_CIDRS.vpc-main
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "hw-main"
  }
}

####################### Subnets #######################
### public subnets ###
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.AWS_CIDRS.vpc-main, 8, 1)
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "hw-main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.AWS_CIDRS.vpc-main, 8, 2)
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "hw-main-public-2"
  }
}

### private subnets ###
resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.AWS_CIDRS.vpc-main, 8, 3)
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "hw-main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.AWS_CIDRS.vpc-main, 8, 4)
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "hw-main-private-2"
  }
}

######################### GWs #########################
### Internet GWs ###
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "hw-main"
  }
}

### NAT GWs ###
# elastic ip 
resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = "hw-main-nat"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]

  tags = {
    Name = "hw-main"
  }
}

#################### route tables ####################
### public ###
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "hw-main-public"
  }
}

### private ###
resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "hw-main-private"
  }
}

################# route associations #################
### public ###
resource "aws_route_table_association" "main-public-1" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}

### private ###
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.main-private.id
}
