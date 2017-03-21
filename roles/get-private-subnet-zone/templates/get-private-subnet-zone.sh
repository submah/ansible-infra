#Command to gather all private subnet(s) zone informations
#It will stor the ouptut in /tmp directory with file name called get-private-subnet-zone.txt and get-private-subnet-zone.txt.out

#findig the zone with respect to the subnet id

/usr/bin/aws ec2 describe-subnets --filter "Name=subnet-id,Values=`cat /tmp/get-private-subnet-id.txt | sed -n 1p`" --query 'Subnets[*].[AvailabilityZone]' --output text > /tmp/get-private-subnet-zone-1.txt.out


/usr/bin/aws ec2 describe-subnets --filter "Name=subnet-id,Values=`cat /tmp/get-private-subnet-id.txt | sed -n 2p`" --query 'Subnets[*].[AvailabilityZone]' --output text > /tmp/get-private-subnet-zone-2.txt.out

#bin/cat /tmp/get-private-subnet-zone.txt | sed -n 1p > /tmp/get-private-subnet-zone-1.txt.out
#bin/cat /tmp/get-private-subnet-zone.txt | sed -n 2p > /tmp/get-private-subnet-zone-2.txt.out
