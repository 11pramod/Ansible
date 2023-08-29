locals {
  subnet_private_cidr = distinct(var.subnet_private_cidr)
  subnet_public_cidr  = distinct(var.subnet_public_cidr)
  environment         = lower(var.environment)
}
