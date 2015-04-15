#!/bin/sh
# Little script to deploy resource agents on cluster nodes
git pull
SRCDIR=~/AWS-VPC-move-IP
CERT=~/AWS/SUSEHA2014.pem
HOSTS="node1 node2"
for host in $HOSTS; do
	scp -i $CERT $SRCDIR/aws-vpc-move-ip ec2-user@$host:/tmp
	ssh -i $CERT ec2-user@$host "sudo mv /tmp/aws-vpc-move-ip /usr/lib/ocf/resource.d/suse"
done
