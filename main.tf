resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints
}

resource "azurerm_network_security_group" "this" {
  count               = var.create_nsg ? 1 : 0
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  for_each = var.create_nsg && length(var.subnets_to_attach_nsg) > 0 ? toset(var.subnets_to_attach_nsg) : {}
  subnet_id                 = azurerm_subnet.this[each.value].id
  network_security_group_id = azurerm_network_security_group.this[0].id
}
