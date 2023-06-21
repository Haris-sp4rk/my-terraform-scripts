resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/test_rsa.pub")
}