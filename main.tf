module "ec2" {
  source = "./modules/ec2"
  for_each = var.instances
  component = each.key
  instance_type = each.value["instance_type"]
  security_group_id = [aws_security_group.main.id]
}