terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.58.0"
    }

  }
  backend "s3" {
    bucket         = "icc-terraform-tfstate"
    region         = "us-east-2"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-tfstate"
    role_arn = "arn:aws:iam::349739699720:role/service-role/terraform-infra"
  }
  
}


module "finalProject" {
  region                     = var.region
  source                     = "./modules/finalProject"
  ports                      = var.ports
  image_id                   = var.image_id
  instance_type              = var.instance_type
  vpc_cidr                   = var.vpc_cidr
  public_subnet_cidrs        = var.public_subnet_cidrs
  private_subnet_cidrs       = var.private_subnet_cidrs
  public_subnet_cidrs_zones  = var.public_subnet_cidrs_zones
  private_subnet_cidrs_zones = var.private_subnet_cidrs_zones
  image_name                 = var.image_name
  min_size                   = var.min_size
  max_size                   = var.max_size
  max_cpu_usage              = var.max_cpu_usage
  max_requests               = var.max_requests
  desired_capacity           = var.desired_capacity
}
output "public_ip" {
  value = module.finalProject.publicInstanceIp
}

output "alb_dns" {
  value = module.finalProject.albDns
}

output "rds_endpoint"{
  value = module.finalProject.db_instance_endpoint
}

output "rds_address"{
  value = module.finalProject.rds_ip
}