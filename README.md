# CalTech DevOps Project 4 - Deployment of WordPress Environment

## Project Description:

This sample project delineates the standard installation procedure of WordPress and its components which include PHP, Apache Web Server, and WordPress on the cloud platform such as AWS.
Two AWS EC2 instances will be used to serve the control_node and the client_node. The control node uses Terraform for client node provisioning and Ansible for configuration management on the 
client node. A more detail objectives are listed below.

    1. Establish configuration management master connectivity with WordPress server
    2. Validate connectivity from master to slave machine
	3. Prepare IaaC scripts to install WordPress and its dependent components
	4. Execute scripts to perform installation of complete WordPress environment
	5. Validate installation using the public IP of VM by accessing WordPress application

This project will accomplish the following tasks:

Prerequisite: An AWS EC2 instance (control_node) with Ansible installed. A free-tier (t2.micro) EC2 instance is sufficient to serve as the control node.

 - Install Terraform on the control node using the Ansible.
 - Install AWS CLI on the control node using Ansible.
 - Provision the client node using Terrafrom.
 - Install WordPress and its components (PHP, Apache, and MySQL) using Ansible roles.
 