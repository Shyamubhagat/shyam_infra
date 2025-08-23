module "resource_group" {
  source                  = "../Modules/Azurerm_resource_group"
  resource_group_name     = "bhagat_rg11"
  resource_group_location = "centralindia"

}

module "resource_group3" {
  source                  = "../Modules/Azurerm_resource_group"
  resource_group_name     = "bhagat_rg2"
  resource_group_location = "East US"

}

module "resource_group2" {
  source                  = "../Modules/Azurerm_resource_group"
  resource_group_name     = "bhagat_rg3"
  resource_group_location = "East US"

}


module "resource_group1" {
  source                  = "../Modules/Azurerm_resource_group"
  resource_group_name     = "bhagat_rg4"
  resource_group_location = "East US"

}

module "Vnet" {
  depends_on          = [module.resource_group]
  source              = "../Modules/Azurerm_Vnet"
  resource_group_name = "bhagat_rg11"
  Vnet_name           = "bhagat_vnet"
  Vnet_location       = "East US"
  Vnet_address_space  = ["10.0.0.0/16"]

}

module "backend_subnet" {
  depends_on          = [module.Vnet]
  source              = "../Modules/Azurerm_subnet"
  resource_group_name = "bhagat_rg11"
  Azurerm_Vnet        = "bhagat_vnet"
  subnet_name         = "backend_subnet"
  address_prefixes    = ["10.0.1.0/24"]

}

module "frontend-subnet" {
  depends_on          = [module.Vnet]
  source              = "../Modules/Azurerm_subnet"
  resource_group_name = "bhagat_rg11"
  Azurerm_Vnet        = "bhagat_vnet"
  subnet_name         = "frontend_subnet"
  address_prefixes    = ["10.0.2.0/24"]

}

module "bhagat_sql_server" {
  source = "../Modules/Azurerm_SQL_Server"

  sql_server_name              = "bhagat-sqlserver2"
  resource_group_name          = "bhagat_rg11"
  location                     = "centralindia"
  sql_server_version           = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Shyam@1234"
}
resource "azurerm_public_ip" "frontend_public_ip" {
  name                = "frontend_public_ip"
  location            = "centralindia"
  resource_group_name = "bhagat_rg11"
  allocation_method   = "Static"    # Static is recommended for Standard SKU
  sku                 = "Standard"  # Important: Change Basic -> Standard
}

module "key_vault" {
  source              = "../Modules/Azurerm_Key_Vault"
  key_vault_name      = "Shyamulocked"
  resource_group_name = "bhagat_rg11"
  location            = "centralindia"
}

module "vm_username" {
  source              = "../Modules/Azurerm_Key_Vault_Secret"
  depends_on = [ module.key_vault ]
  secret_name         = "vm-username"
  secret_value        = "Shyamubhagat"
  key_vault_name      = "Shyamulocked"
  resource_group_name = "bhagat_rg11"
}

module "vm_password" {
  source              = "../Modules/Azurerm_Key_Vault_Secret"
  depends_on          = [ module.key_vault ]
  secret_name         = "vm-password"
  secret_value        = "Bhagat@1234"
  key_vault_name      = "Shyamulocked"
  resource_group_name = "bhagat_rg11"
}
  
  