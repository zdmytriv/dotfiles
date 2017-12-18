### List ElasticBeanstalk envs:

```
./ebt.py <profile-name>
```
and result would be 
```
./ebt.py profile-dev
------------  --------------------  -------------------------------------------------------  ------------------------------------------  ----------------
10.10.0.1     A-App1-01-app-11      ACTIVE-App1-01-app-11.us-west-2.elasticbeanstalk.com     b643fa0e5bc2c0ba4442c3da02e66d283325196a    Green|Ok|Ready
10.10.0.2     A-App2-01-app-11      ACTIVE-App2-01-app-11.us-west-2.elasticbeanstalk.com     b643fa0e5bc2c0ba4442c3da02e66d283325196a    Green|Ok|Ready
10.10.0.3     A-App1-01-app-11      BACKUP-App1-01-app-11.us-west-2.elasticbeanstalk.com     9ac35f74bbe40e50f01389d7f9957e88713018e3    Green|Ok|Ready
10.10.0.4     A-App2-01-app-11      BACKUP-App2-01-app-11.us-west-2.elasticbeanstalk.com     9ac35f74bbe40e50f01389d7f9957e88713018e3    Green|Ok|Ready
------------  --------------------  -------------------------------------------------------  ------------------------------------------  ----------------
```

### List EC2 instances:
```
./ec2.py <profile-name>
```
and result would be 
```
./ec2.py profile-dev
-------------------------------------------------------------------  -------------------  -------------  -------------
A-App1-dev-01-app-11                                                 i-00111111111111111  10.10.0.1      -
A-App2-dev-01-app-11                                                 i-00222222222222222  10.10.0.2      -
B-App1-dev-01-app-11                                                 i-00333333333333333  10.10.0.3      -
B-App2-dev-01-app-11                                                 i-00444444444444444  10.10.0.4      -
BastionAutoScalingGroup                                              i-00555555555555555  10.10.0.5      1.2.3.4
-------------------------------------------------------------------  -------------------  -------------  -------------
```

### List Route53 records:
```
./route53.py <profile-name>
```

and result would be

```
./route53.py profile-dev
---------------  --  ---------------------------  -----  ----------------------------------------------------------------------------------
mydomain.com.    4   account                      CNAME  staging.mydomain.com
                     dashboard                    CNAME  77ec929dde26.cloudfront.net
mydomain.io.     2   \052.sandbox                 A      active-app-dev-01-app-1.us-west-2.elasticbeanstalk.com.
---------------  --  ---------------------------  -----  ----------------------------------------------------------------------------------
```

or to show all record types

```
./route53.py profile-dev all
---------------  --  ---------------------------  -----  ----------------------------------------------------------------------------------
mydomain.com.    4   api                          TXT    "9d14c756-e40d-11e7-80fd-77ec929dde26"
                     account                      CNAME  staging.mydomain.com
                     dashboard                    CNAME  77ec929dde26.cloudfront.net
                     _acme-challenge.power        TXT    "9d14c756-e40d-11e7-80fd-77ec929dde26"
mydomain.io.     2   mydomain.io                  TXT    "google-site-verification=9d14c756-e40d-11e7-80fd-77ec929dde26"
                     \052.sandbox                 A      active-app-dev-01-app-1.us-west-2.elasticbeanstalk.com.
---------------  --  ---------------------------  -----  ----------------------------------------------------------------------------------
```

### More

Also aliases can be created like
```
alias ebt="dotfiles/scripts/aws/ebt.py"
alias ec2="dotfiles/scripts/aws/ec2.py"
alias route53="dotfiles/scripts/aws/route53.py"
```
so these scripts can be used like this from anywhere
#### Instances
```
ec2 profile-dev
```

#### ElasticBeanstalk apps
```
ebt profile-dev
```

#### Routes
Show only `CNAME` and `A`
```
route53 profile-dev
```
or show all record types including `NS`, `MX`, `SOA`, `TXT`
```
route53 profile-dev all
```
