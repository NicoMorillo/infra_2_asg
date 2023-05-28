resource "aws_autoscaling_group" "autoscaling_group" {
  name              = "asg"
  min_size          = var.asg_min_size
  max_size          = var.asg_max_size
  desired_capacity  = var.asg_desired_size
  target_group_arns = [aws_lb_target_group.alb_target_group.arn]

  launch_template {
    id = aws_launch_template.launch_template.id
  }
  vpc_zone_identifier = module.vpc.private_subnets

}