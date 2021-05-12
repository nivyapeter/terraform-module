resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
}
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = "true"
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
