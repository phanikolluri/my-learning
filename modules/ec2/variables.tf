variable "instance_type" {
  type = string
  description = "Ec2 instance type"
}
variable "security_group_id" {
  type = list(string)
  description = "security group id"
}
variable "ami" {
  type = string
  description = "ami id"
}

variable "component" {}

