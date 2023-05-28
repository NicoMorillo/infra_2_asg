resource "aws_iam_instance_profile" "instance_profile" {

  name = "instance-pf"
  role = aws_iam_role.iam_role.name

}

resource "aws_iam_role" "iam_role" {

  name = "iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "policy_attach" {
  count      = local.n_ec2
  name       = "ssm-core-attachment"
  roles      = [aws_iam_role.iam_role.id]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
