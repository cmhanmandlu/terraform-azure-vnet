variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name              = string
    address_prefixes  = list(string)
    service_endpoints = optional(list(string), [])
  }))
}

variable "create_nsg" {
  description = "Whether to create a Network Security Group"
  type        = bool
  default     = false
}

variable "nsg_name" {
  description = "Name of the NSG (if created)"
  type        = string
  default     = ""
}

variable "subnets_to_attach_nsg" {
  description = "List of subnet names to associate with NSG"
  type        = list(string)
  default     = []
}
