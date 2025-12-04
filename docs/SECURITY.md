# Politique de Sécurité

## Outils de Sécurité Utilisés

### Scan de Vulnérabilités
- Trivy : Analyse des images Docker et du code
- Scan automatique dans le pipeline CI/CD
- Seuils : CRITICAL, HIGH, MEDIUM

### Détection de Secrets
- Gitleaks : Détection de secrets dans le code
- Pre-commit hooks pour prévention
- Scan automatique à chaque push

### Gestion des Secrets
- Azure Key Vault pour tous les secrets sensibles
- Pas de secrets en clair dans le code
- Variables d'environnement pour la configuration

## Pratiques de Sécurité

### Conteneurs
- Images multi-stage pour réduire la surface d'attaque
- Utilisateur non-root dans les conteneurs
- Scan Trivy avant chaque déploiement
- Images basées sur Alpine (minimales)

### Infrastructure
- Network Security Groups (NSG) configurés
- RBAC Kubernetes activé
- Pod Security Standards appliqués
- Logs centralisés dans Log Analytics

### Pipeline CI/CD
- Scan de sécurité à chaque build
- Pas de déploiement si vulnérabilités critiques
- Approbation manuelle pour la production
- Audit trail complet

## Signalement de Vulnérabilités

Contact : pierre.baroni@free.fr

Merci de signaler toute vulnérabilité de manière responsable.
