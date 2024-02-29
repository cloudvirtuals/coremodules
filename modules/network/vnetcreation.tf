# Modules for Network v1.0.1
resource "azurerm_resource_group" "rg" {
  name     = "${var.orgname}-net-rg"
  location = var.location
}

resource "azurerm_network_security_group" "PaaSnsgone" {
  name                = var.paas1_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "PaaSnsgtwo" {
  name                = var.paas2_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
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
    security_group = azurerm_network_security_group.PaaSnsgone.id
  }

  subnet {
    name           = var.subnet2_name
    address_prefix = var.subnet2_cidr
    security_group = azurerm_network_security_group.PaaSnsgtwo.id
  }
}
