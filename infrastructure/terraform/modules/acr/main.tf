resource "azurerm_container_registry" "acr" {
  name                = "acr${replace(var.project_name, "-", "")}${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = false
  identity { type = "SystemAssigned" }
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
