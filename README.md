# TerraformModule_A



 
![Screenshot 2022-12-11 at 1 22 22 PM](https://user-images.githubusercontent.com/115514079/206940389-44a2d496-8230-42c2-826d-519062139873.png)
## AWS has  Been used as Cloud Provider for this Lab. 


## IaC type has been used for this Lab to deploy Infrastructure on AWS.

### Description
- When Deploying Resources using Terraform Modules, Inputs and Outputs are very important as one module's Outputs can be 2nd Module's Inputs. For Example. For VPC Module its Output which is VPC ID has to be used in Security Group Module as input. 
- References of these are very curical. After any major Changes Always Use Terraform Init to keep IDE Up-to-Date. 


### Pre-requisties 


-  AWS Account
-  Deployed Cloud9 Enviornment (https://docs.aws.amazon.com/cloud9/latest/user-guide/create-environment-main.html)
-  Use this CLI command on your Cloud9 Environment to Clone the repository " git clone https://github.com/vermashiva12/TerraformLab4.git "
-  Source Code Cloned on Local Machine or can be Pulled directly on Cloud9 Enviornment. 
-  A Key Pair stored Local which will be helpful to Deploy the Web Server. 

### AWS Resources 
- This Source Code Deploys Following Resources.
-  VPC
-  2 Subnets (Public and Private)
-  Internet Gateway 
-  Route tables and Their assoications with Specific Subnet
-  AWS Relational Database Service (RDS) MySQL Version.
-  Target Groups 
-  DB Subnet Group
-  2 Security Group
-  1 EC2 Instance
-  Application Load Balancer

### Changes Before Deploy.
-  On Line Number 56 of Main.tf Please Refer your Key Pair. 

### Commands to Deploy.
- Terraform init :- Used for initializing Terraform in that environment.
- Terraform plan :- Lets you know the output or Detailed Information of what It will be deploying with all Information
- Terraform apply :- It goes to console to deploy all mentioned resources, but it will ask you permission to deploy. 
- Bonus :- Terraform apply -auto-approve :- It also deploys all resources but its permissions are already approved before deploying. Make Sure all the resources are checked before using this command.
- Terraform destroy :- It removes all the created resources using code. Permission has to be provided before destroy. 
