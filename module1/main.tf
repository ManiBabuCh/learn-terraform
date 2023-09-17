module "instance1"{
source ="./ec2"
name = "instance1"
}
module "instance2"{
source ="./ec2"
name = "instance2"
}
variable "name"{}