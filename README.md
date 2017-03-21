# ansible-infra
This repository contains Ansible playbooks and it will create 
VPC and launch an EC2 vm in public subnet.
It will create two security group i.e Prod-NAT-SG and prod-rds-security-group. once the croup created it will
lauch an RDS in private subnet with single az and 5 GB of storage database size.

#New roles added
create an ELB in public subnet(s) 
create an Auto Scaling Launch Configuration 

 
