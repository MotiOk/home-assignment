This project tested on terraform version 1.4.2 .

First you need to check the following secrets:
*   AWS_ACCESS_KEY - Your access key to aws. Recommended to use "aws configure" command instead.
*   AWS_SECRET_KEY - Your secret access key to aws. Recommended to use "aws configure" command instead.
*   AWS_REGION - The region to deploy all the resources.
*   certificate_arn - The certificate for listening on port 443.

** If you dont have a certificate, you should leave this secret as is.
   If you DO HAVE a certificate, fill the certificate_arn variable and
   follow the instructions on the comments in the elb.tf file.

MAKE SURE YOU ARE'NT UPLOADING THOSE TO GITHUB.

Additionally, check the values of all the variables in the vars.tf and make sure
that all the values are fine with your environment.

This project is creating the following resources:
*   a vpc
*   2 public subnets
*   2 private subnets
*   an Internet GW
*   a NAT GW
*   a public route table + associations to the public subnets
*   a private route table + associations to the private subnets
*   a security group that allows ports 80 and 443 from the internet - assigned to the elb.
*   an instance-type target group
*   an application load balancer
*   if you filled in certificate - listeners on port 80 and port 443 for the elb
    if you didn't fill in certificate - a listener on port 80 for the elb
*   a route53 hosted zone
*   a route53 CNAME record for the elb.