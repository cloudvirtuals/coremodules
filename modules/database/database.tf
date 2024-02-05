resource "azurerm_sql_server" "cloudtechstack-sqlserver" {
  name                         = var.sqlservername
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sqlusername
  administrator_login_password = var.sqlpasswd
}

resource "azurerm_sql_database" "cloudtechstack-sql-database" {
  name                = var.sqldbname
  resource_group_name = var.rgname
  location            = var.location
  server_name         = var.sqlservername
}