module "instance1"{
source ="./ec2"
name = "instance1"
}
module "instance2"{
source ="./ec2"
name = "instance2"
}
output "instance1_public_ip" {
  value = module.instance1.public_ip
}
output "instance2_public_ip" {
  value = module.instance2.public_ip
}