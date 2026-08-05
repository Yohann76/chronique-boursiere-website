# Chronique Boursière — Cahier des Charges

> Référentiel de spécification du projet **chroniqueboursiere.fr**

---

## Sommaire

1. [Présentation du projet](#1-présentation-du-projet)
2. [Plan d'implémentation](#2-plan-dimplémentation)
3. [Architecture technique](#3-architecture-technique)
4. [Design & Charte graphique](#4-design--charte-graphique)
5. [Pages & Structure du site](#5-pages--structure-du-site)
6. [Blog](#6-blog)
7. [Back-office](#7-back-office)
8. [Automatisations](#8-automatisations)
9. [SEO](#9-seo)

---

## 1. Présentation du projet

**Site :** chroniqueboursiere.fr  
**Type :** Média en ligne spécialisé en économie et actualité des entreprises

Chronique Boursière est un média dont l'objectif est de renseigner et d'aider les gens à comprendre le monde économique qui les entoure. Spécialiste de l'économie et de l'actualité des entreprises (CAC40, résultats financiers, politique économique, marchés).

**Réseaux sociaux :**
- YouTube
- X (Twitter)
- Instagram
- TikTok
- Telegram

---

## 2. Plan d'implémentation

| Étape | Description |
|-------|-------------|
| **Étape 1** | Mise en place de l'infrastructure : Docker, Docker Compose, Makefile, Hugo |
| **Étape 2** | Architecture du site : menu, footer, design principal de la homepage |
| **Étape 3** | Mise en place du blog avec optimisation SEO complète |
| **Étape 4** | Développement du back-office (authentification admin) |
| **Étape 5** | Automatisations du back-office (news, publications, données financières) |

---

## 3. Architecture technique

### Stack

| Composant | Technologie |
|-----------|-------------|
| Générateur de site statique | Hugo (Go) |
| Base de données | PostgreSQL |
| Conteneurisation | Docker + Docker Compose |
| Automatisation des builds | Makefile |

### Commandes Makefile

```bash
make dev-run      # Lance l'environnement de développement
make dev-build    # Build les images Docker
make dev-kill     # Arrête et supprime les conteneurs
```

### Docker Compose

Le projet tourne entièrement via Docker Compose :
- Service `hugo` : génération et serving du site statique
- Service `postgres` : base de données pour le back-office
- Service `backoffice` : API et interface d'administration

### Articles Hugo

Les articles du blog sont des fichiers `.md` dans le dépôt de code.  
Publier un article = ajouter un fichier `.md` dans le répertoire `content/blog/`.  
Par défaut, tous les articles créés sont en **brouillon** (`draft: true`) — ils ne sont visibles qu'après validation manuelle.

---

## 4. Design & Charte graphique

### Palette de couleurs

| Rôle | Couleur | Hex |
|------|---------|-----|
| Couleur principale | Bleu foncé | `#233b63` |
| Couleur secondaire | Orange grisé | `#af9b7e` |
| Fond / texte clair | Blanc | `#ffffff` |

### Typographie

- Police lisible, représentant l'actualité et le sérieux journalistique
- Style général : **moderne, luxueux, épuré**
- L'espace blanc est valorisé — le design doit "respirer"

### Esprit visuel

- Moderne et premium
- Simplicité et lisibilité avant tout
- Proximité avec les codes visuels des médias financiers haut de gamme

---

## 5. Pages & Structure du site

### Pages

| Route | Description |
|-------|-------------|
| `/` | Homepage — présentation du média |
| `/blog` | Liste des articles du blog |
| `/blog/{titre-article}` | Page article unique |
| `/mentions-legales` | Mentions légales |
| `/politique-de-confidentialite` | Politique de confidentialité |
| `/link` | Page de liens (type Linktree) — centralise tous les liens réseaux sociaux et ressources |

### Menu (header)

Navigation principale en haut de page :
- Accueil
- Blog
- Qui sommes-nous
- Pages

### Footer

- Logo et liens vers les réseaux sociaux : YouTube, X, Instagram, TikTok, Telegram
- Liens légaux : Mentions légales, Politique de confidentialité

### Homepage (`/`)

Page d'introduction au média :
- Présentation de Chronique Boursière : mission, positionnement, domaines de couverture
- Mise en avant du blog et des derniers articles
- Liens vers les réseaux sociaux
- Call-to-action vers le blog

### Page `/link`

Page de liens centralisée (inspiration Linktree) :
- Logo du média
- Liste de liens cliquables : réseaux sociaux, articles phares, newsletter, etc.

---

## 6. Blog

### Thématiques / Catégories

| Catégorie | Description |
|-----------|-------------|
| Résultats financiers | Publications trimestrielles et annuelles des entreprises |
| Actualité | Actualité générale économique et corporate |
| CAC40 | Suivi des entreprises du CAC40 |
| Politique | Politique économique, décisions gouvernementales |
| Finance | Marchés financiers, analyse, données |

### Fonctionnalités

- **Pas d'image obligatoire** sur les articles — le texte prime
- Classification claire par catégorie et tags
- Calendrier de publications (liste des publications à venir ou programmées)
- Résultats financiers automatisés (voir section Automatisations)
- Articles en brouillon par défaut, publication uniquement après validation manuelle

---

## 7. Back-office

Interface d'administration sécurisée (authentification admin par login/mot de passe).

### Onglet 1 — Recherche de News

Recherche et collecte automatique d'articles depuis des sources externes.

**Sources :**
- Flux RSS de journaux économiques et financiers
- Google News RSS
- Blogs spécialisés

**Workflow :**
1. Le back-office agrège les flux RSS configurés
2. Un LLM (IA) analyse et transforme le contenu en article Markdown prêt à l'emploi au format Hugo
3. L'article est créé en **brouillon** (`draft: true`) dans le dépôt
4. L'admin valide et publie manuellement l'article depuis le back-office

### Onglet 2 — Data

Suivi et affichage des résultats financiers trimestriels des entreprises.

- Affichage structuré des résultats par entreprise et par trimestre
- Données importées automatiquement ou saisies manuellement
- Lien avec les articles de blog correspondants

### Onglet 3 — Publication

#### Sous-onglet 3.1 — Articles Blog
- Gestion des articles : création, édition, validation, publication, dépublication
- Vue liste avec statut (brouillon / publié)
- Éditeur Markdown

#### Sous-onglet 3.2 — Twitter / X
- Rédaction et programmation de tweets
- Publication manuelle ou automatisée depuis le back-office
- Historique des publications

---

## 8. Automatisations

| Automatisation | Description |
|----------------|-------------|
| Agrégation RSS | Collecte automatique des flux RSS configurés à intervalle régulier |
| Génération d'articles | LLM parse le contenu RSS et génère un fichier `.md` Hugo formaté |
| Résultats financiers | Récupération automatique des résultats trimestriels des entreprises |
| Calendrier de publication | Affichage et gestion du planning de publication des articles |
| Publication Twitter | Automatisation optionnelle de la publication sur X/Twitter |

---

## 9. SEO

### Fichiers techniques

- `robots.txt` : présent et correctement configuré
- `sitemap.xml` : généré automatiquement par Hugo, soumis aux moteurs de recherche

### Bonnes pratiques

- URLs propres et lisibles (`/blog/titre-de-larticle`)
- Balises `<title>` et `<meta description>` uniques par page
- Balises Open Graph (partage réseaux sociaux)
- Balisage structuré (Schema.org) pour les articles (`Article`, `NewsArticle`)
- Temps de chargement optimisé (site statique Hugo)
- Responsive design (mobile-first)
- Catégorisation et tags cohérents pour le maillage interne
- Pagination du blog
- Fil d'Ariane (breadcrumbs) sur les articles
