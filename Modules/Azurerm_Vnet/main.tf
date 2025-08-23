
resource "azurerm_virtual_network" "Vnet" {
  name                = var.Vnet_name
  location            = var.Vnet_location
  resource_group_name = var.resource_group_name
  address_space       = var.Vnet_address_space
}


 