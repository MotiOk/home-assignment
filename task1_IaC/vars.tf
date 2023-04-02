##### vpc.tf variables #####
# a map to organize the main vpc CIDR
variable "AWS_CIDRS" {
  type = map(string)
  default = {
    vpc-main = "10.0.0.0/16"
  }
}

##### PORT MAPPINGs #####
# mapping ports for Security Groups #
variable "MAIN_ELB_SG" {
  type = map(list(string))
  default = {
    "80"  = ["0.0.0.0/0"]
    "443" = ["0.0.0.0/0"]
  }
}

##### Route 53 #####
variable "HOSTEZ_ZONE_NAME" {
  default = "365test.com"
}

variable "MAIN_ELB_CNAME_SUBDOMAIN" {
  default = "www"
}
