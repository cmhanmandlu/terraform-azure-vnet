Inputs

Name	Description	Type	Default	Required
vnet_name	Name of the VNet	string	n/a	yes
address_space	VNet CIDR	list	n/a	yes
create_nsg	Whether to create NSG	bool	false	no
Outputs

Name	Description
vnet_id	ID of the VNet
subnet_ids	Map of subnet names to IDs

Configurable Parameters
Address space

Subnets

NSG creation and associations

Region and tags

🔐 Optional Enhancements for Security
NSG rules (customizable)

NSG Flow Logs (with Network Watcher)

Private endpoints

Subnet delegation
