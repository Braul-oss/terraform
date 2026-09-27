
/*
resource "random_string" "suffix" {
  length    = var.length
  special  = true
}
*/

/*
locals {
  unique_name    = "${var.application_name}-${var.environment}-${random_string.suffix.result}"
  application_name  = var.application_name
}
*/

resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "main"{
  name                = local.virtual_network_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = var.vnet_address_space

  tags = local.common_tags
}