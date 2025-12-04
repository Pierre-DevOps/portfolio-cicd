# Script de création de l'infrastructure Terraform
Write-Host "Creation de l'infrastructure Terraform..." -ForegroundColor Green

$basePath = "E:\DevOps\portfolio-cicd\infrastructure\terraform"

# Providers et variables globales
Write-Host "Creation des fichiers providers et variables..." -ForegroundColor Yellow

$providersContent = @"
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
"@

$providersContent | Out-File -FilePath "$basePath\providers.tf" -Encoding UTF8

$variablesContent = @"
variable "location" {
  description = "Azure region"
  type        = string
  default     = "switzerlandnorth"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "portfoliocicd"
}

variable "admin_email" {
  description = "Admin email for notifications"
  type        = string
  default     = "pierre.baroni@free.fr"
}
"@

$variablesContent | Out-File -FilePath "$basePath\variables.tf" -Encoding UTF8

Write-Host "Fichiers de base crees!" -ForegroundColor Green
Write-Host "Modules Terraform crees dans: $basePath\modules" -ForegroundColor Green
