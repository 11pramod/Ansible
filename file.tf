resource "local_file" "ansible_inventory" {
  content = templatefile("publicservers.tpl",
    {
      testserver01 = aws_instance.ec2.0.public_ip
      testserver02 = aws_instance.ec2.1.public_ip
      testserver03 = aws_instance.ec2.2.public_ip
      pvtserver01  = aws_instance.ec2.0.private_ip
      pvtserver02  = aws_instance.ec2.0.private_ip
      pvtserver03  = aws_instance.ec2.0.private_ip
    }

  )
  filename = "${path.module}/invfile"
}
