# Modules for Network v1.0.1
resource "azurerm_resource_group" "rg" {
  name     = "${var.orgname}-net-rg"
  location = var.location
}

resource "azurerm_network_security_group" "PaaS1nsg" {
  name                = var.PaaS1nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_network_security_group" "PaaS2nsg" {
  name                = var.PaaS2nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "PaaSvnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnet1_name
    address_prefix = var.subnet1_cidr
    security_group = azurerm_network_security_group.PaaS1nsg.id
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = var.subnet2_cidr
    security_group = azurerm_network_security_group.PaaS2nsg.id
  }
}
