resource "aws_launch_template" "launch-config" {
  name_prefix   = "Project-launch-config-"
  image_id      = data.aws_ami.linux.id
  instance_type = var.instance_type
    block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 9
      delete_on_termination = true
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ASG ec2 Instance"
    }
  }
  vpc_security_group_ids = [aws_security_group.private_ec2_sg.id]
  user_data = filebase64("${path.module}/script.sh")

}

# resource "aws_placement_group" "final" {
#   name     = "test"
#   strategy = "cluster"
# }

resource "aws_autoscaling_group" "autoscallinggroup" {
  name                      = "Auto Scalling Group"
  # availability_zones = ["us-east-2a", "us-east-2b"]
  min_size                  = var.min_size
  max_size                  = var.max_size
  # placement_group           = aws_placement_group.final.id
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = aws_subnet.private_subnets[*].id
  health_check_type         = "EC2"
  health_check_grace_period = 300
  target_group_arns         = [aws_lb_target_group.target-group.arn]
  launch_template {
    id      = aws_launch_template.launch-config.id
    version = "$Latest"
  }
  # Instance Refresh
  instance_refresh {
    strategy = "Rolling"
    preferences {
      #instance_warmup = 300 # Default behavior is to use the Auto Scaling Group's health check grace period.
      min_healthy_percentage = 50
    }
    triggers = [ /*"launch_template",*/ "desired_capacity" ] # You can add any argument from ASG here, if those has changes, ASG Instance Refresh will trigger
  }  

}