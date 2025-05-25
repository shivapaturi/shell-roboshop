#!/bin/bash

AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-010eb25d82d15b248"
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch")
ZONE_id="Z0002010ZLBCRXD0A652"
DOMAIN_NAME="daws84ss.site"

for INSTANCES in "${INSTANCES[@]}"
do 
   INSTANCE_ID=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro --security-group-ids sg-010eb25d82d15b248 --tag-specifications "ResourceType=instance,Tags=[{Key=Name, Value=test}]" --query '.Instances[0].InstanceID' --output text)
   if [ $instance != "frontend" ]
   then
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].[InstanceId, PrivateIpAddress]" --output text)
            else
        IP=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].[InstanceId, PublicIpAddress]" --output text)
    fi
    echo "$instance IP address: $IP"
done