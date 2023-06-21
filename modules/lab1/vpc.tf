resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Project VPC (Through terraform)"
  }
}