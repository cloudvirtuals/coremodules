
# Create main resource group
resource "azurerm_resource_group" "rgdata01" {
  name     = "adf-${var.orgname}-${var.env}-rg"
  location = var.default_location
}

# Reference to an existing Azure Subnet
data "azurerm_subnet" "PaaS-subnet1" {
  name                 = "PaaS-subnet1"
  virtual_network_name = "PaaSvnet"
  resource_group_name  = ${var.orgname}-net-rg
}

# Create an Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name                = "adf-${var.orgname}"
  resource_group_name = azurerm_resource_group.rgdata01.name
  location            = azurerm_resource_group.rgdata01.location
}

resource "azurerm_storage_account" "adfstgacc" {
  name                     = "adfstg${var.orgname}"
  resource_group_name      = azurerm_resource_group.rgdata01.name
  location                 = azurerm_resource_group.rgdata01.location
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create a Self-Hosted Integration Runtime in an existing subnet
resource "azurerm_data_factory_managed_private_endpoint" "adf_endpoint" {
  name                = "adf-integration-endpoint"
  data_factory_id   = azurerm_data_factory.adf.id
  target_resource_id = azurerm_storage_account.adfstgacc.id
}

# Create a Self-Hosted Integration Runtime linked to the private endpoint
#resource "azurerm_data_factory_managed_private_endpoint_connection" "adf_connection" {
#  name                     = "adf-integration-endpoint-connection"
#  data_factory_name        = azurerm_data_factory.adf.name
#  resource_group_name      = azurerm_resource_group.rgdata01.name
#  managed_private_endpoint = azurerm_data_factory_managed_private_endpoint.adf_endpoint.id
#}
