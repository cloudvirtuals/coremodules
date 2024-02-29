variable "location" {
  sensitive = true
  type = string
}
variable "rgname" {
  sensitive = true
  type = string
}
variable "orgname" {
  sensitive = true
  type = string
}
variable "env" {
  sensitive = true
  type = string
}
variable "default_location" {   
    sensitive = true
    type = string
}
variable "subnet1_name" {   
    sensitive = true
    type = string
}
variable "vnet_name" {   
    sensitive = true
    type = string
}

