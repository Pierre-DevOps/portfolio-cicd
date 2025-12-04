# Projet CI/CD Full Stack

## Présentation
Application web full stack avec pipeline CI/CD automatisé et infrastructure cloud, démontrant mes compétences DevOps.

## Compétences démontrées

Infrastructure et Cloud
- Provisionnement d'infrastructure Azure avec Terraform
- Gestion de clusters Kubernetes (AKS)
- Configuration de registres de conteneurs (ACR)
- Gestion sécurisée des secrets (Azure Key Vault)

CI/CD et Automatisation
- Pipelines GitHub Actions (build, test, deploy)
- Déploiement automatisé multi-environnements
- Gestion des versions et rollbacks

Sécurité
- Scan de vulnérabilités des images Docker (Trivy)
- Gestion centralisée des secrets
- Configuration des règles réseau (NSG)

Conteneurisation
- Dockerisation d'applications (React + Node.js)
- Orchestration avec Kubernetes
- Optimisation des images (multi-stage builds)

## Stack technique
Cloud : Azure (AKS, ACR, Key Vault, Log Analytics)
IaC : Terraform
Conteneurs : Docker, Kubernetes
CI/CD : GitHub Actions
Frontend : React
Backend : Node.js + Express
Sécurité : Trivy, secrets management

## Environnements
Dev : Tests et développement
Staging : Validation pré-production
Prod : Production avec haute disponibilité

## Architecture
GitHub > Actions > Build et Scan > ACR > Deploy AKS
Les images passent par un scan de sécurité Trivy avant déploiement
Déploiement progressif : Dev > Staging > Prod

## Installation

Infrastructure :
cd infrastructure/terraform/environments/dev
terraform init
terraform apply

Application :
kubectl apply -f infrastructure/k8s/

Contact : pierre.baroni@free.fr
Profil : TSSR avec montée en compétences DevOps
