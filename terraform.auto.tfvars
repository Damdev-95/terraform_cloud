region = "us-east-1"

vpc_cidr = "192.168.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

ami-web = "ami-0aed417e6ac980cd9"

ami-nginx = "ami-0a10943fae9b3921a"

ami-bastion = "ami-08f5dbc0412c3ff23"

ami-sonar = "ami-0af0f15bb05f1cb0e"

keypair = "douxtech"

account_no = 014285054687

master-username = "admin"

master-password = "douxtech"

tags = {
  Enviroment      = "development"
  Owner-Email     = "douxtech.ng@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "014285054687"
}