variable "ports" {
  type    = list(number)
  default = [80, 22, 443]
}
variable "image_id" {
  type = string
}
variable "region" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "access_key" {
  type = string
}

variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "public_subnet_cidrs_zones" {
  type        = list(string)
  description = "Public Subnet AZ"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs_zones" {
  type        = list(string)
  description = "Private Subnet AZ"
}
variable "image_name" {
  type = string
}