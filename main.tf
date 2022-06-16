# Creating VPC(Virtual Private Cloud)

module "VPC" {
  source                              = "./modules/VPC"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  enable_classiclink                  = var.enable_classiclink
  enable_classiclink_dns_support      = var.enable_classiclink_dns_support
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}


# Module for Application Load balancer, this will create Extenal Load balancer and internal load balancer

module "ALB" {
  source             = "./modules/ALB"
  name               = "Project18"
  vpc_id             = module.VPC.vpc_id
  public-sg          = module.SG.ALB-sg
  private-sg         = module.SG.IALB-sg
  public-sbn-1       = module.VPC.public_subnets-1
  public-sbn-2       = module.VPC.public_subnets-2
  private-sbn-1      = module.VPC.private_subnets-1
  private-sbn-2      = module.VPC.private_subnets-2
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
}
# Module for Security Groups

module "SG" {
  source = "./modules/SG"
  vpc_id = module.VPC.vpc_id
}
# Module for AutoScaling Groups

module "ASG" {
  source            = "./modules/ASG"
  ami-web           = var.ami-web
  ami-bastion       = var.ami-bastion
  ami-nginx         = var.ami-nginx
  desired_capacity  = 1
  min_size          = 1
  max_size          = 1
  web-sg            = [module.SG.web-sg]
  bastion-sg        = [module.SG.bastion-sg]
  nginx-sg          = [module.SG.nginx-sg]
  wordpress-alb-tgt = module.ALB.wordpress-tgt
  nginx-alb-tgt     = module.ALB.nginx-tgt
  tooling-alb-tgt   = module.ALB.tooling-tgt
  instance_profile  = module.VPC.instance_profile
  public_subnets    = [module.VPC.public_subnets-1, module.VPC.public_subnets-2]
  private_subnets   = [module.VPC.private_subnets-1, module.VPC.private_subnets-2]
  keypair           = var.keypair
}

# Module for Elastic File System
module "EFS" {
  source       = "./modules/EFS"
  efs-subnet-1 = module.VPC.private_subnets-1
  efs-subnet-2 = module.VPC.private_subnets-2
  efs-sg       = [module.SG.datalayer-sg]
  account_no   = var.account_no

}

# Module for Database
module "RDS" {
  source          = "./modules/RDS"
  db-password     = var.master-password
  db-username     = var.master-username
  db-sg           = [module.SG.datalayer-sg]
  private_subnets = [module.VPC.private_subnets-3, module.VPC.private_subnets-4]
}

# The Module creates instances for jenkins, sonarqube abd jfrog
module "compute" {
  source          = "./modules/compute"
  #ami-jenkins     = var.ami-jenkins
  #ami-jfrog       = var.ami-jfrog
  ami-sonar       = var.ami-sonar
  sg-compute      = [module.SG.ALB-sg]
  subnets-compute = module.VPC.public_subnets-1
  keypair         = var.keypair
}
