output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  value = { for k, v in azurerm_subnet.this : k => v.id }
}

output "nsg_id" {
  value       = var.create_nsg ? azurerm_network_security_group.this[0].id : null
  description = "ID of the NSG if created"
}
