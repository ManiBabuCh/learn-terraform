module "instance1"{
source ="./ec2"
name = "instance1"
}
module "instance2"{
source ="./ec2"
name = "instance2"
}
output "instance1_public_ip" {
  value = aws_instance.web.public_ip
}
output "instance2_public_ip" {
  value = aws_instance.web.public_ip
}