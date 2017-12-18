#!/usr/bin/env python3

import sys

import boto3
from tabulate import tabulate

if len(sys.argv) < 2:
    print("Please specify aws profile name")
    exit(1)

profile_name = sys.argv[1]

def list_routes(aws_profile):
    aws_region = 'us-west-2' if aws_profile.endswith("-dev") else 'us-east-1'
    session = boto3.session.Session(profile_name=aws_profile, region_name=aws_region)
    route53_client = session.client('route53')

    hosted_zones = route53_client.list_hosted_zones()["HostedZones"]
    results = []

    for hosted_zone in hosted_zones:
        hz_id = hosted_zone['Id']
        hz_name = hosted_zone['Name']
        hz_num_records = hosted_zone['ResourceRecordSetCount']

        records = route53_client.list_resource_record_sets(HostedZoneId=hz_id)['ResourceRecordSets']

        added = False

        for record in records:
            # if record['Type'] in ['NS', 'MX', 'SOA']:
            #     continue

            result = []
            if not added:
                added = True
                result.append(hz_name)
                result.append(hz_num_records)
            else:
                result.append('')
                result.append('')

            result.append(record['Name'][0:len(record['Name']) - len(hz_name) - 1])
            result.append(record['Type'])
            if 'ResourceRecords' in record:
                result.append('\n'.join([value['Value'] for value in record['ResourceRecords']]))
            elif 'AliasTarget' in record:
                result.append(record['AliasTarget']['DNSName'])

            results.append(result)

    print(tabulate(results))


if __name__ == '__main__':
    list_routes(profile_name)
