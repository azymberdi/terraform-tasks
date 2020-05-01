aws_region     =       "us-east-1"

vpc_cidr        =      "192.168.0.0/16"

private1_cidr   =       "192.168.1.0/24"
private2_cidr   =       "192.168.2.0/24"
private3_cidr   =       "192.168.3.0/24"

public1_cidr   =       "192.168.11.0/24"
public2_cidr   =       "192.168.12.0/24"
public3_cidr   =       "192.168.13.0/24"

tags [
    Name        =       "VPC_PROJECT"
    Environment =       "Devops"
    Department  =       "IT"
    Team        =       "Infrastructure"
    Created_by  =       "rash_balo"
]