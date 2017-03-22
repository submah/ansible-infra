#Command to gather all security groups informations
#It will stor the ouptut in /tmp directory with file name called get-rds-security-group-id.txt.out

#findig security group id with security group name prod-rds-security-group

/usr/bin/aws ec2 describe-security-groups --filter "Name=group-name,Values=prod_elb-SG" --query 'SecurityGroups[*].[GroupId]' --output text > /tmp/get-elb-security-group-id.txt.out




