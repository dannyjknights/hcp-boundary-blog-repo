resource "aws_security_group" "boundary-ssh" {
  name        = "boundary_allow_ssh_dhc"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "boundary-instance" {
  count                  = length(var.instances)
  ami                    = "ami-09ee0944866c73f62"
  instance_type          = "t2.micro"
  availability_zone      = "eu-west-2c"
  security_groups        = ["boundary_allow_ssh_dhc"]
  key_name               = "boundary"
  vpc_security_group_ids = ["${aws_security_group.boundary-ssh.id}"]
  tags                   = var.vm_tags[count.index]
}
