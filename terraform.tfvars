ports                      = [80, 22, 3306]
region                     = "us-east-2"
image_id                   = "ami-02238ac43d6385ab3"
instance_type              = "t2.micro"
vpc_cidr                   = "10.0.0.0/16"
public_subnet_cidrs        = ["10.0.1.0/24", "10.0.3.0/24"]
private_subnet_cidrs       = ["10.0.2.0/24", "10.0.4.0/24", "10.0.5.0/24"]
public_subnet_cidrs_zones  = ["us-east-2a", "us-east-2b"]
private_subnet_cidrs_zones = ["us-east-2a", "us-east-2b", "us-east-2b"]
image_name                 = "amzn2-ami-kernel-5.10-hvm-2.0.20230307.0-x86_64-gp2"
max_size                   = 2
min_size                   = 2
desired_capacity           = 2
max_cpu_usage              = 50
max_requests               = 10
whitelist_ip               = ["10.0.1.0/24"]