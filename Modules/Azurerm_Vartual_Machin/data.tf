# data "azurerm_public_ip" "frontend_public_ip" {
#   name                = "frontend_public_ip"
#   location            = "centralindia"
#   resource_group_name = "bhagat_rg11"
# }

# data "azurerm_subnet" "backend_subnet" {
#   name                = "backend_subnet"
#   resource_group_name = "bhagat_rg11"
#   virtual_network_name = data.azurerm_virtual_network.name
# }

# data "azurerm_key_vault" "name" {
#   name                = "Shyamulocked"
#   resource_group_name = "bhagat_rg11"
# }

# data "azurerm_key_vault_secret" "vm_username" {
#   name                = "vm-username"
#   key_vault_name      = data.azurerm_key_vault.name
#   resource_group_name = data.azurerm_key_vault.resource_group_name
# }

# data "azurerm_key_vault_secret" "vm_password" {
#   name                = "vm-password"
#   key_vault_name      = data.azurerm_key_vault.name
#   resource_group_name = data.azurerm_key_vault.resource_group_name
# }