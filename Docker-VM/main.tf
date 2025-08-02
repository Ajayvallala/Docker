resource "aws_instance" "docker" {
  ami                         = "ami-09c813fb71547fc4f"
  instance_type               = "t3.medium"
  vpc_security_group_ids      = [aws_security_group.docker.id]
  subnet_id                   = "subnet-07d9ef0ea659b9697"
  associate_public_ip_address = true
  user_data                   = file("bootstrap.sh")
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  tags = {
    Name = "Docker-VM"
  }
}

resource "aws_security_group" "docker" {
  name        = "Allow-All"
  description = "SG for docker VM"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Docker-VM"
  }

}