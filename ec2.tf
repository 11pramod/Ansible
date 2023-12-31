resource "aws_instance" "ec2" {
  count                  = local.environment == "production" ? 3 : 1
  instance_type          = lookup(var.instance, local.environment)
  ami                    = "ami-0261755bbcb8c4a84"
  key_name               = "ansible"
  subnet_id              = element(aws_subnet.public.*.id, count.index)
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  tags = {
    name              = "${var.vpc}-PublicServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    environment       = local.environment
  }

}
