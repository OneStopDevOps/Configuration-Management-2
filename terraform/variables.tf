# Variables for AWS General Information
####################################################

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "owner_id" {
  description = "instance owner id"
  type        = string   
  default     = "099720109477"
}

variable "key_pair" {
  description = "SSH key pair used to connect to AWS EC2"
  type        = string
  default     = "aws_terraform"
}

# Variables for Security Group
####################################################
variable "sg_ingress_protocol" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}

variable "sg_ingress_ssh" {
  description = "Port used for the ingress rule for ssh"
  type        = string
  default     = "22"
}

variable "sg_ingress_http" {
  description = "Port used for the ingress rule for http"
  type        = string
  default     = "80"
}

variable "sg_ingress_https" {
  description = "Port used for the ingress rule for https"
  type        = string
  default     = "443"
}

variable "sg_egress_protocol" {
  description = "Protocol used for egress rule"
  type        = string
  default     = "-1"
}

variable "sg_egress_all" {
  description = "Port used for egress rule"
  type        = string
  default     = "0"
}

variable "sg_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}

# Variables for AWS Instance
####################################################

variable "instance_ami_name" {
  description = "AWS Ami name"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20210415"
}

variable "aws_virtualization_type" {
  description = "Virtualization type of the instance"
  type        = string
  default     = "hvm"
}

variable "aws_instance_type" {
  description = "AWS instance type"
  type        = string
  default     = "t2.micro"
}

variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}

variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "8"
}