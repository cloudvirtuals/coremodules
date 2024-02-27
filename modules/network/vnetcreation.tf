
resource "azurerm_resource_group" "rg" {
  #name     = "${var.orgname}-net-rg"
  name     = "cloudtechstackrg"
  location = "eastus2"
}

resource "azurerm_network_security_group" "PaaS1nsg" {
  name                = "PaaS1nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_network_security_group" "PaaS2nsg" {
  name                = "PaaS2nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "PaaSvnet" {
  name                = "PaaSvnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "PaaS-subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.PaaS1nsg.id
  }

  subnet {
    name           = "PaaS-subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.PaaS2nsg.id
  }
}