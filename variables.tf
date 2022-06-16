variable "region" {
  type        = string
  description = "The region to deploy resources"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC cidr block"
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_classiclink" {
  type = bool
}

variable "enable_classiclink_dns_support" {
  type = bool
}

variable "preferred_number_of_public_subnets" {
  type        = number
  description = "Number of public subnets"
}

variable "preferred_number_of_private_subnets" {
  type        = number
  description = "Number of private subnets"
}

variable "name" {
  type    = string
  default = "Project_18"

}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}


variable "ami" {
  type        = string
  description = "AMI id for the launch template"

}

variable "keypair" {
  type        = string
  description = "keypair for the ec2 instances"

}

variable "account_no" {
  type        = number
  description = "Account number of the AWS account"
}

variable "master-username" {
  type        = string
  description = "RDS Username for the Database"
}

variable "master-password" {
  type        = string
  description = "RDS Password for the Database"
}