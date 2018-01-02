#!/usr/bin/env python3

import sys

import boto3
from tabulate import tabulate

if len(sys.argv) < 3:
    print("Please specify aws profile and ebt app name")
    print("Usage: ./vars.py my-app-dev A-App-01")
    exit(1)

profile_name = sys.argv[1]
app_name = sys.argv[2]


def list_envs(aws_profile):
    aws_region = 'us-west-2' if aws_profile.endswith("-dev") else 'us-east-1'
    session = boto3.session.Session(profile_name=aws_profile, region_name=aws_region)

    ebt_client = session.client('elasticbeanstalk')

    config_settings = ebt_client.describe_configuration_settings(ApplicationName=app_name, EnvironmentName=app_name)

    result = []
    for config in config_settings['ConfigurationSettings']:
        for settings in config['OptionSettings']:
            if settings['Namespace'] == 'aws:elasticbeanstalk:application:environment':
                result.append([settings['OptionName'], settings['Value']])

    result = sorted(result, key=lambda k: k[0])

    print(tabulate(result))


if __name__ == '__main__':
    list_envs(profile_name)
