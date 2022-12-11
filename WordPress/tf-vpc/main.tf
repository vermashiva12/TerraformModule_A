resource "aws_vpc" "VPC-lab4" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = { Name = var.vpc_name }

}
resource "aws_internet_gateway" "igw-lab4" {
  vpc_id = aws_vpc.VPC-lab4.id
  tags   = { Name = "igw-final" }

}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.VPC-lab4.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-lab4.id
  }
  tags = {
    "Name" = "${var.vpc_name}'s public Route Table"
  }

}
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.VPC-lab4.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-lab4.id
  }
  tags = {
    "Name" = "${var.vpc_name}'s private Route Table"
  }
}
resource "aws_subnet" "sn-pb" {
  vpc_id                  = aws_vpc.VPC-lab4.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az
  tags = {
    "Name" = "Public Subnet"
  }

}
resource "aws_subnet" "sn-private" {
  vpc_id            = aws_vpc.VPC-lab4.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
  tags = {
    "Name" = "Private Subnet"

  }

}
# resource "aws_eip" "nateip" {
#   vpc                       = true
#   associate_with_private_ip = aws_subnet.sn-private.id

# }
# resource "aws_nat_gateway" "publicNAT" {
#   allocation_id = aws_eip.nateip.id
#   subnet_id     = aws_subnet.sn-pb.id

#}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.sn-pb.id
  route_table_id = aws_route_table.public-rt.id

}
