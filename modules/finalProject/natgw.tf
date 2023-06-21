# Create a NAT gateway
resource "aws_nat_gateway" "nat_gateway" {

  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnets[1].id
  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

# Create a route for the private route table to the NAT gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.first_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}