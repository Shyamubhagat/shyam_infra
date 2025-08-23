variable "Vnet_name" {
    type = string
    description =  "VNet ka name" 

}

variable "Vnet_address_space" {
    type = list(string)
    description =  "VNet ka address space" 

}
variable "Vnet_location" {
    type = string
    description =  "VNet ka location"

}

variable "resource_group_name" {
    type = string
    description =  "Resource group ka name"

}