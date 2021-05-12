provider "aws" {
    region = "ap-south-1"
}   
module "vpc" {
  source = "./vpc"
}

module "security_groups" {
  source = "./sg"

  vpc_id             = "${module.vpc.id}"
}
resource "aws_instance" "terra-ec2" {
  ami                    = "ami-010aff33ed5991201"
  instance_type          = "t2.micro"
  subnet_id              = "${module.vpc.subnetid}"
  vpc_security_group_ids = [module.security_groups.public_id]
    }
