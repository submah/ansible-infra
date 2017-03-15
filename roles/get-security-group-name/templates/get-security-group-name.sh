#Command to get all security-groups name with respect to their VPC-ID
aws ec2 describe-security-groups --filters "Name=vpc-id,Values=vpc-25da5a41" --query 'SecurityGroups[*].[GroupName]' --output text | grep -i webserver-sg > /tmp/get-security-group-name.out
