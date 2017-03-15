/usr/bin/aws ec2 describe-vpcs --filter Name=tag:Name,Values=prod_vpc --query 'Vpcs[*].[VpcId]' --output text > /tmp/get-vpc-id.out
