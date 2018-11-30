#!/usr/bin/env python3

import sys

import boto3
from tabulate import tabulate

if len(sys.argv) < 2:
    print("Please specify aws profile name")
    exit(1)

profile_name = sys.argv[1]


def list(aws_profile):
    aws_region = 'us-west-2' if aws_profile.endswith("-dev") else 'us-east-1'
    session = boto3.session.Session(profile_name=aws_profile, region_name=aws_region)
    elb_client = session.client('elb')

    elbs = elb_client.describe_load_balancers(PageSize=100)['LoadBalancerDescriptions']

    result = []

    for elb in elbs:
        try:
            name = elb['LoadBalancerName']

            properties = []
            properties.append(['DNSName', elb['DNSName']])
            properties.append(['Scheme', elb['Scheme']])
            properties.append(['HealthCheck', elb['HealthCheck']['Target']])
            properties.append(['SecurityGroups', ', '.join(elb['SecurityGroups'])])
            properties.append(['Instances', tabulate([[v['InstanceId']] for v in elb['Instances']], tablefmt='plain')])
            properties.append(['Policies', ', '.join(elb['Policies']['OtherPolicies'])])
            properties.append(['Listeners', tabulate([
                ['%s:%d' % (listener['Listener']['Protocol'], listener['Listener']['LoadBalancerPort']),
                 '%s:%d' % (listener['Listener']['InstanceProtocol'], listener['Listener']['InstancePort']),
                 '' if not 'SSLCertificateId' in listener['Listener'] else listener['Listener']['SSLCertificateId']] for listener in elb['ListenerDescriptions']], tablefmt='plain')])

            elb_attributes = elb_client.describe_load_balancer_attributes(LoadBalancerName=name)['LoadBalancerAttributes']
            properties.append(['Attributes', ', '.join(['{0}: {1}'.format(k, v) for k, v in elb_attributes['AccessLog'].items()])])

            row = [elb['LoadBalancerName'], tabulate(properties, tablefmt='plain')]

            result.append(row)
        except Exception as ex:
            print(ex)

    print(tabulate(result))


if __name__ == '__main__':
    list(profile_name)
