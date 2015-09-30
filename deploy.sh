#!/bin/sh
# Little script to deploy resource agents on cluster nodes
git pull
SRCDIR=~/AWS-VPC-move-IP
CERT=~/AWS/SUSEHA2014.pem
HOSTS="suse-node21 suse-node22"
for host in $HOSTS; do
	scp -i $CERT $SRCDIR/aws-vpc-move-ip ec2-user@$host:/tmp
	ssh -i $CERT ec2-user@$host "sudo mv /tmp/aws-vpc-move-ip /usr/lib/ocf/resource.d/suse"
	ssh -i $CERT ec2-user@$host "sudo chmod 755 /usr/lib/ocf/resource.d/suse/aws-vpc-move-ip"
	ssh -i $CERT ec2-user@$host "sudo chown root:root /usr/lib/ocf/resource.d/suse/aws-vpc-move-ip"
done
