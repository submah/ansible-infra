#Command to gather all public subnet id
#It will stor the ouptut in /tmp directory with file name called public-subnet-id.txt
/usr/bin/aws ec2 describe-subnets --filter "Name=tag:Name,Values=*private*" --query 'Subnets[*].[SubnetId]' --output text > /tmp/get-private-subnet-id.txt

#Now filtering the list of Public subnets and store only one subnet in a text file called public-subnet-id.txt.out

/bin/cat /tmp/get-private-subnet-id.txt | head -n 1 > /tmp/get-private-subnet-id.txt.out


#findig the zone with respect to the subnet id

#/usr/bin/aws ec2 describe-subnets --filter "Name=subnet-id,Values=`cat /tmp/get-private-subnet-id.txt.out`" --query 'Subnets[*].[AvailabilityZone]' --output text > /tmp/get-private-subnet-zone.txt.out

