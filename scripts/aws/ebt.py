#!/usr/bin/env python3

import re
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
    ebt_client = session.client('elasticbeanstalk')
    ec2_client = session.client('ec2')
    ebt_envs = ebt_client.describe_environments()['Environments']

    result = []

    for ebt_env in ebt_envs:
        try:
            ebt_instances = \
                ebt_client.describe_environment_resources(EnvironmentId=ebt_env['EnvironmentId'])[
                    'EnvironmentResources'][
                    'Instances']

            env_name = ebt_env['EnvironmentName']

            cname = "" if 'CNAME' not in ebt_env else re.sub('.' + aws_region + '.elasticbeanstalk.com', '',
                                                             ebt_env['CNAME'])
            health = ebt_env['Health']
            health_status = ebt_env['HealthStatus'] if 'HealthStatus' in ebt_env else "N/A"
            status = ebt_env['Status']
            version_label = ebt_env['VersionLabel']
            ip_addresses = []

            for env_instance in ebt_instances:
                ip_address = \
                    ec2_client.describe_instances(InstanceIds=[env_instance['Id']])['Reservations'][0]['Instances'][0][
                        'PrivateIpAddress']

                ip_addresses.append(ip_address)

            env = [", ".join(ip_addresses), env_name, cname, version_label,
                   "%s|%s|%s" % (health, health_status, status)]
            result.append(env)
        except Exception as ex:
            print(ex)

    result = sorted(result, key=lambda k: k[2])

    print(tabulate(result))


if __name__ == '__main__':
    list_envs(profile_name)
