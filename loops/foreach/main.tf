
resource "aws_instance" "web" {
  for_each      = var.instances
  ami           = data.aws_ami.example.id
  instance_type = lookup(each.value,"instance_type", "t3.micro" )

  tags = {
    Name = each.value.name
  }
}


data "aws_ami" "example" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

variable "instances" {
  default = {

    catalogue = {
      name = "catalogueee"
      instance_type = "t3.nano"
    }

    frontend={
      name = "frontendddd"
    }
  }
}