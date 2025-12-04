# Architecture du Projet

## Vue d'ensemble

Application full stack déployée sur Azure Kubernetes Service avec pipeline CI/CD complet.

## Composants

### Frontend
- React 18
- Nginx (production)
- Port : 80

### Backend
- Node.js + Express
- API RESTful
- Port : 3001

### Infrastructure Azure
- AKS : Cluster Kubernetes
- ACR : Registre de conteneurs
- Key Vault : Gestion des secrets
- Log Analytics : Monitoring et logs
- NSG : Sécurité réseau

## Environnements

### Dev
- 1 node AKS (Standard_B2s)
- Déploiement automatique sur push branche dev
- Pas de haute disponibilité

### Staging
- 2 nodes AKS (Standard_B2s)
- Déploiement automatique après validation dev
- Tests d'intégration

### Prod
- 2 nodes AKS (Standard_B2s)
- Déploiement avec approbation manuelle
- Haute disponibilité
- Monitoring actif

## Flux de Déploiement

1. Push code sur GitHub
2. GitHub Actions déclenché
3. Scan de sécurité (Trivy + Gitleaks)
4. Build des images Docker
5. Push vers ACR
6. Deploy sur AKS (selon environnement)
7. Tests de santé
8. Monitoring

## Région Azure
Switzerland North (switzerlandnorth)
