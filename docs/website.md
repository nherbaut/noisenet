# Site de documentation

## Construire et consulter

Prérequis : Hugo 0.165.0 ou plus récent, Python 3 et Make. Aucun thème externe, Node.js ou module Python supplémentaire n'est nécessaire.

```bash
make site-build
make site-serve
```

Le site compilé est dans `public/`. L'aperçu est disponible sur `http://localhost:1313/`. `make site-check` construit le site et vérifie les liens et ressources internes.

Le script `scripts/prepare-site.py` transforme les Markdown du projet en contenu Hugo et les quatre CSV de matériel en tableaux HTML avec téléchargement CSV. Les sources restent dans leurs emplacements habituels ; `.build/site/` et `public/` sont générés et ignorés par Git.

Dans les tableaux de matériel, cliquer sur un fabricant ouvre sa documentation et cliquer sur un fournisseur ouvre la page d'achat du composant. Les liens viennent des colonnes `documentation_url` et `product_url` de la BOM ; les URL inconnues restent sans lien. Cette présentation s'applique aussi aux tableaux de nomenclature Markdown générés depuis AGENTS.md.

Après modification d'un Markdown ou CSV, relancer `make site-prepare` dans un autre terminal pour actualiser l'aperçu. Hugo surveille ensuite les fichiers générés. Les modifications des templates et du CSS sont prises en compte directement.

## Publier sur GitHub Pages

Le dépôt utilise le remote GitLab `origin` et le miroir GitHub `github` (`nherbaut/noiset`).

1. Pousser les sources, y compris `.github/workflows/pages.yml`, vers un dépôt GitHub.
2. Dans **Settings → Pages**, choisir **GitHub Actions** comme source.
3. Dans **Actions**, lancer manuellement **Publish documentation to GitHub Pages** sur la branche souhaitée.

Pour déclencher le même workflow depuis le terminal, installer GitHub CLI (`gh`) et s'authentifier avec `gh auth login`, puis lancer :

```bash
make site-deploy
# Autre branche ou autre dépôt GitHub :
make site-deploy DEPLOY_REF=my-branch GITHUB_REPO=OWNER/REPO
```

La cible utilise par défaut le dépôt `nherbaut/noiset` et la branche `main`. Elle déploie les sources déjà présentes sur GitHub ; pousser les modifications avant de la lancer (`make push` pousse `main` vers les deux remotes). Suivre le résultat dans l'onglet **Actions** du dépôt GitHub.

Le workflow utilise l'adresse fournie par GitHub, y compris le sous-chemin du dépôt. Aucun déploiement n'est déclenché par un simple push. Pour vérifier localement le cas d'un site de projet :

```bash
make site-check BASE_URL=https://USER.github.io/REPO/
```

Le site publie les Markdown de `hardware/`, `docs/`, `nodes/`, `tests/`, `src/` et `config/`, ainsi que le README et AGENTS.md. Il inclut les modèles de station et les quatre CSV de matériel ; les fichiers de données liés depuis les Markdown sont également copiés. `config/local/` et les fichiers nommés `secrets.*` sont exclus. Vérifier les documents, achats, inventaire et fiches de station avant une publication publique, notamment leurs données personnelles et identifiants sensibles.

Référence : [déploiement Hugo sur GitHub Pages](https://gohugo.io/host-and-deploy/deploy-to-github-pages/).
