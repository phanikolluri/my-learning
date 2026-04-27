resource "aws_security_group" "main" {
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my_instance" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl enable nginx
systemctl start nginx
EOF

  tags = {
    Name = "my_workstation"
  }
}



