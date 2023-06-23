provider "aws" {
  region     = "us-east-2"
  assume_role {
      role_arn = "arn:aws:iam::349739699720:role/service-role/terraform-infra"
  }

}