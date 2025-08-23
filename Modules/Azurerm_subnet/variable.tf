variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string

}



variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
}

variable "Azurerm_Vnet" {
    description = "The name of the virtual network"
    type        = string
}

variable "subnet_name" {
    description = "The name of the subnet"
    type        = string

}
