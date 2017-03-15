#!/bin/bash
/usr/bin/aws ec2 allocate-address --region '{{ region }}' --domain vpc  > /tmp/tmp-address
/bin/cat /tmp/tmp-address | grep AllocationId | awk {'print $2'} | sed 's/"//g' > /tmp/allocate-address
/usr/bin/aws ec2 describe-subnets  --region '{{ region }}' --filter Name=tag:Name,Values=prod_public_subnet_* --query 'Subnets[*].[SubnetId]' --output text | awk {'print $1'} > /tmp/public-subnet
/usr/bin/aws ec2 describe-subnets  --region '{{ region }}' --filter Name=tag:Name,Values=prod_private_subnet_* --query 'Subnets[*].[SubnetId]' --output text | awk {'print $1'} > /tmp/private-subnet
/usr/bin/aws ec2 create-nat-gateway  --region '{{ region }}' --subnet-id `/bin/cat /tmp/public-subnet | sed -n 1p` --allocation-id `/bin/cat /tmp/allocate-address | sed -n 1p` > /tmp/tmp-nat
/bin/cat /tmp/tmp-nat | grep NatGatewayId | awk {'print $2'} | sed 's/"//g' | sed 's/,//g' > /tmp/nat-gateway
sleep 30

while [ `/usr/bin/aws ec2 describe-nat-gateways --region ap-northeast-1 --nat-gateway-ids  `cat /tmp/nat-gateway` --filter "Name=state,Values=available"  | grep -i state | awk '{print $2}' | tr -d '"' | tr -d ','` != "available" ]
do
  /usr/bin/aws ec2 describe-nat-gateways --region ap-northeast-1 --nat-gateway-ids  `cat /tmp/nat-gateway` --filter "Name=state,Values=available"  | grep -i state | awk '{print $2}' | tr -d '"' | tr -d ','
done
