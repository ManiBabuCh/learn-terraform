variable "value"{
default = 100
}


output "sample"{
value = "Hello worls is ${var.value}"
}
