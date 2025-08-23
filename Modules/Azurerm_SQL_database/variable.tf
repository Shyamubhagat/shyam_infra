variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  
}
variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}
variable "azurerm_sql_server" {
  description = "The name of the Azure SQL Server"
  type        = string
}
variable "sql_database_name" {
  description = "The name of the SQL Database"
  type        = string
}