vpc                 = "project-vpc"
vpc_cidr            = "10.36.0.0/16"
subnet_public_cidr  = ["10.36.1.0/24", "10.36.2.0/24", "10.36.3.0/24"]
subnet_private_cidr = ["10.36.10.0/24", "10.36.20.0/24", "10.36.30.0/24"]
environment         = "production"
azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_region          = "us-east-1"
instance = {
  production = "t2.micro"
  testing    = "t2.small"
  developmet = "t2.micro"
}
