#Command to gather all public subnet id
#It will stor the ouptut in /tmp directory with file name called public-subnet-id.txt
/usr/bin/aws ec2 describe-subnets --filter "Name=tag:Name,Values=*public*" --query 'Subnets[*].[SubnetId]' --output text > /tmp/get-public-subnet-id.txt

#Now filtering the list of Public subnets and store only one subnet in a text file called public-subnet-id.txt.out

/bin/cat /tmp/get-public-subnet-id.txt | sed -n 1p > /tmp/get-public-subnet-id-1.txt.out
/bin/cat /tmp/get-public-subnet-id.txt | sed -n 2p > /tmp/get-public-subnet-id-2.txt.out




