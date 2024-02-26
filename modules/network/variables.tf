#############################################################################
# VARIABLES
#############################################################################

variable "location" {
  type    = string
  default = "eastus2"
}

variable "naming_prefix" {
  type    = string
  default = "ctslabs"
}


variable "target_group_addition" {
  type    = string
  default = "true"
}
