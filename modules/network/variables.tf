#############################################################################
# VARIABLES
#############################################################################

variable "location" {
  type    = string
  default = "eastus2"
}

variable "orgname" {
  type    = string
}


variable "target_group_addition" {
  type    = string
  default = "true"
}
