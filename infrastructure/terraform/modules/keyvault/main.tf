data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
