# main.tf

provider "azurerm" {
  features = {}
}

# Create main resource group
resource "azurerm_resource_group" "rgdata01" {
  name     = "adf-${var.orgname}-${var.env}-rg"
  location = "${var.default_location}"
}

# Reference to an existing Azure Subnet
data "azurerm_subnet" "PaaS-subnet1" {
  name                 = "PaaS-subnet1"
  virtual_network_name = "PaasVnet"
  resource_group_name  = data.azurerm_resource_group.rgdata01.name
}

# Create an Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.orgname}"
  resource_group_name = data.azurerm_resource_group.rgdata01.name
  location            = data.azurerm_resource_group.rgdata01.location
}

# Create a Self-Hosted Integration Runtime in an existing subnet
resource "azurerm_data_factory_managed_private_endpoint" "adf_endpoint" {
  name                = "adf-integration-endpoint"
  data_factory_name   = azurerm_data_factory.adf.name
  resource_group_name = data.azurerm_resource_group.rgdata01.name

  subnet_id = data.azurerm_subnet.PaaS-subnet1.id
}

# Create a Self-Hosted Integration Runtime linked to the private endpoint
resource "azurerm_data_factory_managed_private_endpoint_connection" "adf_connection" {
  name                     = "adf-integration-endpoint-connection"
  data_factory_name        = azurerm_data_factory.adf.name
  resource_group_name      = data.azurerm_resource_group.rgdata01.name
  managed_private_endpoint = azurerm_data_factory_managed_private_endpoint.adf_endpoint.id
}
