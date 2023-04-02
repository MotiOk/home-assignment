from insertions import *

# register_service(1, "ec2", "ec2", "describe_instances", "Reservations", "Instances")
# register_service(2, "rds", "rds", "describe_db_instances", "DBInstances", "")
# register_service(3, "s3", "s3", "list_buckets", "Buckets", "")
# register_service(4, "security_groups", "ec2", "describe_security_groups", "SecurityGroups", "")
# register_service(5, "vpc", "ec2", "describe_vpcs", "Vpcs", "")
# register_service(6, "elb", "elbv2", "describe_load_balancers", "LoadBalancers", "")

# ##### ec2 parameters #####
# register_parameter(1, "InstanceId", "Instance ID", 1)
# register_parameter(2, "InstanceType", "Instance Type", 1)
# register_parameter(3, "PublicIpAddress", "Public IP Address", 1)
# register_parameter(4, "PrivateIpAddress", "Private IP Address", 1)
# register_parameter(5, "LaunchTime", "Launch Time", 1)
# register_parameter(6, "Placement;AvailabilityZone", "Availability Zone", 1)
# register_parameter(7, "State;Name", "State", 1)
# register_parameter(8, "Tags", "Tags", 1)

# ##### rds parameters #####
# register_parameter(9, "DBInstanceIdentifier", "Instance ID", 2)
# register_parameter(10, "Endpoint;Address", "Instance Endpoint", 2)
# register_parameter(11, "DBInstanceClass", "Instance Type", 2)
# register_parameter(12, "Engine", "n", 2)
# register_parameter(13, "EngineVersion", "Engine Version", 2)
# register_parameter(14, "PubliclyAccessible", "Publicly Accessible", 2)
# register_parameter(15, "AvailabilityZone", "Availability Zone", 2)
# register_parameter(16, "DBInstanceStatus", "State", 2)

# ##### s3 parameters #####
# register_parameter(17, "Name", "Name", 3)
# register_parameter(18, "CreationDate", "creation_date", 3)

# ##### security_groups parameters #####
# register_parameter(19, "GroupId", "Id", 4)
# register_parameter(20, "GroupName", "Name", 4)
# register_parameter(21, "IpPermissions", "inbound rules", 4)
# register_parameter(22, "IpPermissionsEgress", "outbound rules", 4)

# ##### VPCs parameters #####
# register_parameter(23, "VpcId", "Id", 5)
# register_parameter(24, "CidrBlock", "CIDR Block", 5)

# ##### ELBs parameters #####
# register_parameter(25, "LoadBalancerArn", "Arn", 6)
# register_parameter(26, "LoadBalancerName", "Name", 6)
# register_parameter(27, "Type", "Type", 6)
# register_parameter(28, "Scheme", "Scheme", 6)