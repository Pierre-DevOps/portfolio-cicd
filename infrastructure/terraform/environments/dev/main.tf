module "resource_group" {
  source       = "../../modules/resource-group"
  project_name = var.project_name
  environment  = var.environment
  location     = var.location
}

module "acr" {
  source              = "../../modules/acr"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  sku                 = "Basic"
}

module "aks" {
  source              = "../../modules/aks"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  node_count          = 1
  vm_size             = "Standard_B2s"
}

module "keyvault" {
  source              = "../../modules/keyvault"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "network" {
  source              = "../../modules/network"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

module "monitoring" {
  source              = "../../modules/monitoring"
  project_name        = var.project_name
  environment         = var.environment
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}
