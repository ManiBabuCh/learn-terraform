variable "course" {
  default = "DevOps Training"
}

# List
variable "courses" {
  default = [
    "DevOps",
    "AWS",
    "Python"
  ]
}

## Map
variable "course_details" {
  default = {
    DevOps = {
      name     = "DevOps"
      timing   = "10am"
      duration = 90
    }
    AWS = {
      name     = "AWS"
      timing   = "11am"
      duration = 30
    }
  }
}

output "course" {
  value = var.course
}

output "courses" {
  value = var.courses
}

output "course_details" {
  value = var.course_details
}