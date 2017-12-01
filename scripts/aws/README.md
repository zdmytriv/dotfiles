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

### More

Two aliases can be created like
```
alias ebt="dotfiles/scripts/aws/ebt.py"
alias ec2="dotfiles/scripts/aws/ec2.py"
```
so these scripts can be used like this from anywhere
```
ec2 profile-dev

# and

ebt profile-dev
```
