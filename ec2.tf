data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "my-ec2" {
  ami                         = data.aws_ami.amzlinux.id
  instance_type               = "t2.micro"
 associate_public_ip_address = true
 subnet_id       = aws_subnet.my-pub-sub.id
  security_groups = [aws_security_group.my-sg.id]

  key_name = "maven-project"
  tags = {
    name = "terraform"
  }
user_data = file("https.sh")

}