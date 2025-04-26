module "vnet" {
  source              = "../../"
  vnet_name           = "demo-vnet"
  resource_group_name = "demo-rg"
  location            = "East US"
  address_space       = ["10.0.0.0/16"]

  subnets = [
    {
      name              = "subnet1"
      address_prefixes  = ["10.0.1.0/24"]
      service_endpoints = ["Microsoft.Storage"]
    },
    {
      name              = "subnet2"
      address_prefixes  = ["10.0.2.0/24"]
    }
  ]

  create_nsg             = true
  nsg_name               = "demo-nsg"
  subnets_to_attach_nsg  = ["subnet1"]
}
