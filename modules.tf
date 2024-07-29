data "http" "my_ip" {
  url = "http://ip4.clara.net/?raw"
}

module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "7.1.1"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "6.1.1"

  client_name = var.client_name
  environment = var.environment
  location    = module.azure_region.location
  stack       = var.stack
  name_suffix = "001"
}

module "azure_virtual_network" {
  source  = "claranet/vnet/azurerm"
  version = "7.0.0"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack
  name_suffix    = "001"

  resource_group_name = module.rg.resource_group_name

  vnet_cidr   = ["10.2.0.0/16"]

  extra_tags = local.extra_tags
}