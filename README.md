# NoiseNet

Station autonome de mesure du bruit urbain, alimentée par énergie solaire et transmettant des résumés par LoRaWAN EU868.

## État du projet

Le dépôt contient la documentation de départ. Aucun achat, assemblage ou essai n'est encore enregistré. Les références de matériel sont reprises d'[AGENTS.md](AGENTS.md) ; leur compatibilité reste à vérifier avant commande.

Architecture de référence : Pico 2, SEN0232, Grove Wio-E5 et KIT0210 avec trois cellules 18650 identiques. Le SEN0460 est une option hors nomenclature de base.

## Navigation

| Besoin | Fichier ou dossier |
|---|---|
| Matériel prévu pour une station | [Nomenclature](hardware/bom.csv) |
| Commandes et réceptions | [Achats](hardware/procurement.csv) |
| Matériel disponible et affectation | [Inventaire](hardware/inventory.csv) |
| Sources techniques | [Fiches techniques](hardware/datasheets/README.md) |
| Branchements | [Câblage](docs/wiring.md) |
| Construction | [Assemblage](docs/assembly.md) |
| Validation des mesures | [Calibration](docs/calibration.md) |
| Installation et entretien | [Déploiement](docs/deployment.md) |
| Choix techniques | [Décisions](docs/decisions/README.md) |
| Suivi de chaque station | [Stations](nodes/README.md) |
| Protocoles et résultats | [Essais](tests/README.md) |
| Firmware | [Sources](src/README.md) et [configuration](config/README.md) |

## Prochaines étapes

- [ ] Vérifier les cellules RS 0206038 : dimensions, terminaux, courant et températures de charge, compatibilité avec le KIT0210.
- [ ] Documenter la protection contre la charge hors plage de température.
- [ ] Choisir une membrane acoustique avec réponse documentée.
- [ ] Vérifier l'alimentation, les niveaux UART et l'antenne du Grove Wio-E5.
- [ ] Choisir les broches UART et le circuit de mesure de la batterie.
- [ ] Compléter les connecteurs, câbles, fixations et presse-étoupes dans la BOM.
- [ ] Valider le câblage, puis enregistrer les achats et réceptions.
- [ ] Assembler une première station et effectuer les essais électriques et acoustiques.

## Conventions de suivi

Les CSV utilisent UTF-8, la virgule comme séparateur et le point décimal. Les dates suivent `AAAA-MM-JJ`. Une case vide indique une information inconnue, jamais une quantité nulle confirmée.

Les identifiants `HW-xxx` relient BOM, commandes, inventaire et assemblages. Les stations utilisent `NN-xxx`. La BOM représente le matériel prévu ; la fiche d'assemblage représente le matériel effectivement installé. Toute évolution validée reçoit une révision matérielle, enregistrée dans la BOM et les fiches de stations.

Créer une issue par tâche sur la forge, avec une catégorie `achat`, `matériel`, `assemblage`, `calibration` ou `terrain`. Lier les résultats et décisions aux fichiers du dépôt. Ne pas versionner les clés LoRaWAN, mots de passe ou données personnelles des commandes.
