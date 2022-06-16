region = "us-east-1"

vpc_cidr = "192.168.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

ami = "ami-0c4f7023847b90238"

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