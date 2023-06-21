data "aws_ami" "linux" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {

  ami                    = data.aws_ami.linux.id
  vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.terraform_key.key_name
  subnet_id              = aws_subnet.public_subnets[0].id
  availability_zone      = var.public_subnet_cidrs_zones[0]
  tags = {
    Name = "Learning terraform"
  }
  user_data = file("${path.module}/script.sh")
}