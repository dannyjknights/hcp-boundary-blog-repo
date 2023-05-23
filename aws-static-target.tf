/* This block of code creates an EC2 instance in AWS. 
The instance will use the specified Amazon Machine Image (AMI) and instance type. 
It will be located in the specified availability zone.
*/
resource "aws_instance" "boundary_target" {
  #count                  = 1
  ami               = "ami-09ee0944866c73f62"
  instance_type     = "t2.micro"
  availability_zone = "eu-west-2b"
  key_name          = aws_key_pair.ec2_key.key_name
  depends_on        = [aws_key_pair.ec2_key]


  /* This block of code attaches a network interface to the EC2 instance. 
  It specifies the ID of the network interface created in a separate resource block. 
  It also sets the device index to 0.
  */
  network_interface {
    network_interface_id = aws_network_interface.boundary_target_ni.id
    device_index         = 0

  }
  tags = {
    Name = "Static Boundary Target"
  }
}

/* This block of code creates a network interface in AWS. 
The network interface is associated with the subnet specified by its ID. 
It is also associated with a security group specified by its ID.
*/
resource "aws_network_interface" "boundary_target_ni" {
  subnet_id               = aws_subnet.private_subnet.id
  security_groups         = [aws_security_group.static_target_sg.id]
  private_ips             = ["192.168.0.8"]
  private_ip_list_enabled = false

}
