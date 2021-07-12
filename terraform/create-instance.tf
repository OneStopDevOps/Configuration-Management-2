# Terraform used for provisioning AWS EC2 instance
####################################################

terraform {
  required_providers {
    aws = {
	  source  = "hashicorp/aws"
	  version = "~> 3.26"
	}
  }
}

# Terraform provider
provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# AMI Filter for Ubuntu Server 18.04
data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name = "name"
	values = [var.instance_ami_name]
  }
  
  filter {
    name = "virtualization-type"
	values = [var.aws_virtualization_type]
  }
  
  owners = [var.owner_id] 
}

# AWS Instance
resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu.id
  #availability_zone           = var.aws_region
  instance_type               = var.aws_instance_type
  security_groups             = [aws_security_group.sg.name]
  key_name                    = var.key_pair
  
  root_block_device {
    delete_on_termination = true
	encrypted             = false
	volume_type           = var.root_device_type
	volume_size           = var.root_device_size
  }
  
  # ignore ami changes when ami updates
  lifecycle {
    ignore_changes = [ami]
  }
}

# Security Group
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Web Security Group"
  
  ingress = [
  {
    description = "Ingress rule for SSH" 
  	protocol    = var.sg_ingress_protocol
    from_port   = var.sg_ingress_ssh
	to_port     = var.sg_ingress_ssh
	cidr_blocks = [var.sg_cidr_block]
	ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
	self        = false
  },
  {
    description = "Ingress rule for HTTP"
	protocol    = var.sg_ingress_protocol
    from_port   = var.sg_ingress_http
	to_port     = var.sg_ingress_http
    cidr_blocks = [var.sg_cidr_block]
	ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
	self        = false	
   },
   {
    description = "Ingress rule for HTTPS"
	protocol    = var.sg_ingress_protocol
    from_port   = var.sg_ingress_https
	to_port     = var.sg_ingress_https
	cidr_blocks = [var.sg_cidr_block]
	ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
	self        = false
   }]
  
  
  egress = [{
    description = "All traffic"
    protocol         = var.sg_egress_protocol
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_cidr_block]
	ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
	self             = false
  }]
}
