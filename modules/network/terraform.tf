##################################################################################
# TERRAFORM CONFIG 
##################################################################################
terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 2.0"
        }
    }
    backend "azurerm" {
      resource_group_name  = "cloudtechstackstg"
      storage_account_name = "cloudtechstackstgbackend"
      container_name       = "terraformbackend"
      key                  = "user2.terraform.tfstate"
    }
}


##################################################################################
# PROVIDERS
##################################################################################

provider "azurerm" {
  features {}
}
