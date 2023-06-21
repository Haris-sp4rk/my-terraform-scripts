# Jump server IP
output "publicInstanceIp" {
  value = aws_instance.web.public_ip
}

# ALB DNS
output "albDns"{
    value = aws_lb.load_balancer.dns_name
}

# Launch Template Outputs
output "launch_template_id" {
  description = "Launch Template ID"
  value = aws_launch_template.launch-config.id
}

output "launch_template_latest_version" {
  description = "Launch Template Latest Version"
  value = aws_launch_template.launch-config.latest_version
}

# Autoscaling Outputs
output "autoscaling_group_id" {
  description = "Autoscaling Group ID"
  value = aws_autoscaling_group.autoscallinggroup.id 
}

output "autoscaling_group_name" {
  description = "Autoscaling Group Name"
  value = aws_autoscaling_group.autoscallinggroup.name 
}

output "autoscaling_group_arn" {
  description = "Autoscaling Group ARN"
  value = aws_autoscaling_group.autoscallinggroup.arn 
}

# RDS Outputs

output "rds_ip" {
  description = "Autoscaling Group ARN"
  value = aws_db_instance.rds_instance.address
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.rds_instance.endpoint
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.rds_instance.address
}

output "db_instance_password" {
  description = "The master password"
  value       = aws_db_instance.rds_instance.password
  sensitive   = true
}