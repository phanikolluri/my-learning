output "instance" {
  value = aws_instance.my_instance.public_ip
}

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "public_dns" {
  value = aws_instance.my_instance.public_dns
}

