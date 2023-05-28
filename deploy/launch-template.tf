resource "aws_launch_template" "launch_template" {
  name = "launch-temp"
  iam_instance_profile {
    arn = aws_iam_instance_profile.instance_profile.arn

  }
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  image_id               = var.ami
  user_data              = filebase64("${path.module}/script.sh")

  tags = {
    Name = "launch_template"
  }

}




