module "azure_virtual_network_98908093" {
  source  = "claranet/vnet/azurerm"
  version = "7.0.0"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack
  name_suffix    = "002"

  resource_group_name = module.rg.resource_group_name

  vnet_cidr   = ["10.29.0.0/16"]

  extra_tags = local.extra_tags
}