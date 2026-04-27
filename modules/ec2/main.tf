resource "aws_instance" "my_instance" {
  ami           =  var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group_id
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl enable nginx
systemctl start nginx
EOF

  tags = {
    Name = "${var.component}"
  }
}



