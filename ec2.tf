resource "aws_instance" "Web" {
  ami           = "ami-0ec10929233384c7f" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.nano"
  key_name      = "Ram1"    
  subnet_id = "subnet-0fc1dc484b58297be"
  associate_public_ip_address = true
  security_groups = [aws_security_group.Ramesh_SG.id]
  count = 5
  tags = {
    Name = "Ramesh_Web${count.index + 1}"
  }

}

resource "aws_instance" "Private_Web" {
  ami           = "ami-0ec10929233384c7f" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.nano"
  key_name      = "Ram1"    
  subnet_id = "subnet-02226b85c02616e3e"
  associate_public_ip_address = true
  security_groups = [aws_security_group.Ramesh_SG.id]
   tags = {
    Name = "Ramesh_Private_Web"
  }
}

resource "aws_security_group" "Ramesh_SG" {
  name        = "Ramesh_SG"
  description = "Allow inbound SSH/HTTP/HTTPS and all outbound traffic"
  vpc_id      = "vpc-01d4e02fab0fba7ff" # Update with your VPC ID

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ramesh_SG"
  }
}
