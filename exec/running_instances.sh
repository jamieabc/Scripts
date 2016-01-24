#!/bin/bash
regions=( us-east-1 us-west-1 us-west-2 eu-west-1 eu-central-1 ap-southeast-1 ap-southeast-2 ap-northeast-1 ap-northeast-2 sa-east-1 )
for region in ${regions[@]}
do
	echo "Region: ${region}"
	aws ec2 describe-instances --output table --query "Reservations[*].Instances[*].[State.Name|'running', InstanceId, KeyName, Tags[?Key=='Name'].Value|[0]]" --region $region
done
