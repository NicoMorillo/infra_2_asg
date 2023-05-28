variable "ami" {
  description = "AMI Ubuntu 20"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "Instace type"
  type        = string
  default     = "t2.micro"
}

variable "asg_min_size" {
  description = "ASG minimum size"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "ASG maximum size"
  type        = number
  default     = 4
}

variable "asg_desired_size" {
  description = "ASG desired size"
  type        = number
  default     = 2
}