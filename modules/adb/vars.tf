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
variable "default_location" {   
    sensitive = true
    type = string
}
variable "dbwscope" {   
    sensitive = true
    type = string
}
variable "secretsname" {   
    sensitive = true
    type = map
}
variable "env" {   
    sensitive = true
    type = string
}
variable "adbstgaccname" {   
    sensitive = true
    type = string
}
variable "adbstgcbronze" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbstgcbronze"
}
variable "adbstgcsilver" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbstgcsilver"
}
variable "adbstgcgold" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbstgcgold"
}
variable "adbappsecret" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbappsecret"
}
variable "adbappclientid" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbappclientid"
}
variable "adbapptenantid" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbapptenantid"
}

variable "adbclustername" {   
    sensitive = true
    type = string
    default = "cloudtechstack-adbcluster"
}
variable "noworkers" {   
    sensitive = true
    type = string
    default = "1"
}
 variable "node_type_id" {   
    sensitive = true
    type = string
    default = "Standard_DS3_v2"
}
