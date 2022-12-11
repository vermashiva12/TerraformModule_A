module "networking" {
  source              = "./tf-vpc"
  vpc_name            = "Lab4-SV"
  vpc_cidr            = "172.31.0.0/16"
  public_subnet_cidr  = "172.31.96.0/21"
  private_subnet_cidr = "172.31.104.0/21"
  public_subnet_az    = "us-east-1a"
  private_subnet_az   = "us-east-1b"


}
output "vpcID" {
  value = module.networking.vpcIDMain
}
output "publicS" {
  value = module.networking.publicsb
}
output "privatesb" {
  value = module.networking.privatesb
}
output "azPublic" {
  value = module.networking.public_az
}
output "azPrivate" {
  value = module.networking.private_az
}
module "sgGroup" {
  source = "./tf-sg"
  vpc_id = module.networking.vpcIDMain
}
output "sgOut" {
  value = module.sgGroup.sgID_web
}
output "sgOut_B" {
  value = module.sgGroup.sgID_dbGroup
}
module "rds" {
    source = "./tf-rds"
    dbidentifier = "dbfinal"
    dbname = "dbfinal"
    username = "admin"
    userPass = "Admin123"
    dbGroup = module.sgGroup.sgID_dbGroup
  
}
module "ec2" {
  source            = "./tf-ec2"
  amiID             = "ami-0b0dcb5067f052a63"
  instanceType      = "t2.micro"
  sgoutID           = module.sgGroup.sgID_web
  publicsubnet_a    = module.networking.publicsb
  privatesubnet_b   = module.networking.privatesb
  public_subnet_az  = module.networking.public_az
  private_subnet_az = module.networking.private_az
  keyName           = "lab4"


}
output "InstanceId" {
    value = module.ec2.Instance_Id
  
}
module "alb" {
    source = "./tf-alb"
    vpc_id = module.networking.vpcIDMain
    machineID = module.ec2.Instance_Id
    sgDB = module.sgGroup.sgID_web
    publicS = module.networking.publicsb
  
}