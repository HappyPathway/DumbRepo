//--------------------------------------------------------------------
// Variables
variable "ec2_instance_instance_name" {}
variable "ec2_instance_instance_type" {}
variable "ec2_instance_key_name" {}
variable "ec2_instance_subnet_id" {}
variable "vpc_network_name" {}
variable "vpc_resource_tags" {}
variable "vpc_vpc_cidr" {}

//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/AWSDemoDarnoldTFE/ec2-instance/aws"
  version = "4.0.0"

  instance_name = "${var.ec2_instance_instance_name}"
  instance_type = "${var.ec2_instance_instance_type}"
  key_name = "${var.ec2_instance_key_name}"
  subnet_id = "${var.ec2_instance_subnet_id}"
}

module "vpc" {
  source  = "app.terraform.io/AWSDemoDarnoldTFE/vpc/aws"
  version = "2.0.0"

  network_name = "${var.vpc_network_name}"
  resource_tags = "${var.vpc_resource_tags}"
  vpc_cidr = "${var.vpc_vpc_cidr}"
}
