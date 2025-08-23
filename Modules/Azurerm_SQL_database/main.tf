

resource "azurerm_sql_database" "bhagat_sql_db" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  server_name         = var.azurerm_sql_server
  edition            = "Standard"
  requested_service_objective_name = "S1"
}

