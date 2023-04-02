##### CREDENTIALS #####
/* You can configure those credentials in the comments
     with "aws configure" command instead. */

# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}

##### other secrets #####
variable "AWS_REGION" {
  default = ""
}

# certificate for the elb to listen on port 443 #
variable "CERTIFICATE_ARN" {
  default = ""
}
