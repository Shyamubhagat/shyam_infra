
resource "azurerm_network_interface" "azurerm_network_interface" {
  name                = "bhagat-nic"
  location            = "centralindia"
  resource_group_name = "bhagat_rg11"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.backend_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id           = data.azurerm_public_ip.frontend_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "Bhagtavm" {
  name                = "bhagat-vm"
  location            = "centralindia"
  resource_group_name = "bhagat_rg11"
  size                = "Standard_DS1_v2"
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password      = data.azurerm_key_vault_secret.vm_password.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.azurerm_network_interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

