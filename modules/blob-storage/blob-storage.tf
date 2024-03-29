resource "azurerm_resource_group" "rgdata01" {
  name     = "stg-${var.orgname}-${var.env}-rg"
  location = var.location
}


resource "azurerm_storage_account" "cloudtechstack-adf-stg" {
    name = var.adfstgname
    resource_group_name = azurerm_resource_group.rgdata01.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        creator = "Terraform"
        project = var.orgname
    }
}

resource "azurerm_storage_container" "cloudtechstack-adf-stg-c" {
  name                  = var.adfstgcont01
  storage_account_name  = azurerm_storage_account.cloudtechstack-adf-stg.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "cloudtechstack-dataset-tabprojects" {
  name                   = "Tab_Projects.csv"
  storage_account_name   = azurerm_storage_account.cloudtechstack-adf-stg.name
  storage_container_name = azurerm_storage_container.cloudtechstack-adf-stg-c.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Projects.csv"

  metadata = {
        creator = "Terraform"
        project = var.orgname
  }
}

resource "azurerm_storage_blob" "cloudtechstack-dataset-tab-leads" {
  name                   = "Tab_Leads.csv"
  storage_account_name   = azurerm_storage_account.cloudtechstack-adf-stg.name
  storage_container_name = azurerm_storage_container.cloudtechstack-adf-stg-c.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Leads.csv"

  metadata = {
        creator = "Terraform"
        project = var.orgname
  }
}

resource "azurerm_storage_blob" "cloudtechstack-dataset-tab-expenses" {
  name                   = "Tab_Expenses.csv"
  storage_account_name   = azurerm_storage_account.cloudtechstack-adf-stg.name
  storage_container_name = azurerm_storage_container.cloudtechstack-adf-stg-c.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Expenses.csv"

  metadata = {
        creator = "Terraform"
        project = var.orgname
  }
}

resource "azurerm_storage_blob" "cloudtechstack-dataset-tab-geo-data" {
  name                   = "Tab_Geo_Data.csv"
  storage_account_name   = azurerm_storage_account.cloudtechstack-adf-stg.name
  storage_container_name = azurerm_storage_container.cloudtechstack-adf-stg-c.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Geo_Data.csv"

  metadata = {
        creator = "Terraform"
        project = var.orgname
  }
}
