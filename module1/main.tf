module "instance1"{
source ="./ec2"
name = "instance1"
# we pass variable to sub module main.tf from root module by declaring variable block ouver there
}
module "instance2"{
source ="./ec2"
name = "instance2"
}
output "instance1_public_ip" {
  value = module.instance1.ppublic_ip
}

# terraform always print from root module
output "instance2_public_ip" {
  value = module.instance2.ppublic_ip
}