#!/usr/bin/env python3

import sys

import boto3
from tabulate import tabulate

if len(sys.argv) < 2:
    print("Please specify aws profile name")
    exit(1)

profile_name = sys.argv[1]


def list_envs(aws_profile):
    aws_region = 'us-west-2' if aws_profile.endswith("-dev") else 'us-east-1'
    session = boto3.session.Session(profile_name=aws_profile, region_name=aws_region)
    ec2_client = session.client('ec2')
    ec2_envs = ec2_client.describe_instances()['Reservations']

    result = []

    for ec2_env in ec2_envs:
        if len(ec2_env['Instances']) == 0:
            continue

        instance = ec2_env['Instances'][0]
        id = instance['InstanceId']
        private_ip = instance['PrivateIpAddress'] if 'PrivateIpAddress' in instance else '-'
        public_ip = instance['PublicIpAddress'] if 'PublicIpAddress' in instance else '-'
        
        if 'Tags' in instance:
            for tag in instance['Tags']:
                if tag['Key'] == 'Name':
                    result.append([tag['Value'], id, private_ip, public_ip])
                    break

    result = sorted(result, key=lambda k: k[0])

    print(tabulate(result))


if __name__ == '__main__':
    list_envs(profile_name)
