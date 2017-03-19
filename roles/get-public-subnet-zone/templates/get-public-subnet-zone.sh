#Command to gather all private subnet(s) zone informations
#It will stor the ouptut in /tmp directory with file name called get-private-subnet-zone.txt and get-private-subnet-zone.txt.out

#findig the zone with respect to the subnet id

/usr/bin/aws ec2 describe-subnets --filter "Name=subnet-id,Values=`cat /tmp/get-public-subnet-id.txt.out`" --query 'Subnets[*].[AvailabilityZone]' --output text > /tmp/get-public-subnet-zone.txt

/bin/cat /tmp/get-public-subnet-zone.txt | sed -n 1p > /tmp/get-public-subnet-zone-1.txt.out
/bin/cat /tmp/get-public-subnet-zone.txt | sed -n 2p > /tmp/get-public-subnet-zone-2.txt.out
