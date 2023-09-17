resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.name
  }
    # Establishes connection to be used by all
    # generic remote provisioners (i.e. file/remote-exec)
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }

    provisioner "remote-exec" {
      inline = [
        "sudo labauto",
        "ansible-pull -i localhost, -U https://github.com/ManiBabuCh/learn-ansible.git rmain.yml -e env=dev -e role_name=frontend",
      ]
    }

}


data "aws_ami" "example" {

  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]


}


resource "aws_security_group" "sg" {
  name        = var.name
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "SSH"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.name
  }
}

variable "name"{}

output "ppublic_ip" {
  value = aws_instance.web.public_ip
}



