

resource "azurerm_subnet" "bhagat_subnet" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.Azurerm_Vnet
    address_prefixes = var.address_prefixes
}

