# Suivi du matériel

- `bom.csv` : nomenclature de base pour une station, sans prix ni disponibilité supposés.
- `optional-bom.csv` : options hors baseline ; le SEN0460 reste exclu tant qu'il n'est pas explicitement demandé.
- `procurement.csv` : une ligne par composant et commande ; identifiants d'achat `PO-001`, etc. Actualiser les quantités reçues, y compris pour une réception partielle.
- `inventory.csv` : une ligne par lot, état, emplacement et affectation ; identifiants `INV-001`, etc. Lors d'une affectation partielle, répartir la quantité en plusieurs lignes sans la compter deux fois.

États d'achat suggérés : `à commander`, `commandé`, `partiellement reçu`, `reçu`, `annulé`. État du matériel : `neuf`, `en service`, `à contrôler`, `défectueux`.

Les colonnes `manufacturer_reference` et `supplier_reference` distinguent la référence fabricant du code de commande. Pour le Grove Wio-E5 : `113020091` chez le fabricant, `4007875` chez Farnell. `product_url` contient une page produit directe Farnell France ou RS France reprise d'AGENTS.md, ou `TBD` lorsqu'aucune référence exacte n'est sélectionnée. `quantity_unit` distingue les pièces du rouleau de VHB ; conserver les identifiants existants lors des évolutions de BOM.

`documentation_url` contient la documentation du composant (wiki fabricant ou fiche technique officielle), ou `TBD`. Sur le site Hugo, les colonnes fabricant et référence fabricant pointent vers cette documentation ; les colonnes fournisseur et référence fournisseur pointent vers l'achat. Les URL restent dans les CSV téléchargeables, sans colonnes de liens supplémentaires à l'écran. Le suivi des achats réutilise les liens de la BOM via `component_id`, uniquement si le fournisseur et sa référence correspondent.

Conserver la référence RS `0206038` comme texte dans les tableurs pour préserver le zéro initial. Les cellules d'une station doivent former un jeu de trois cellules neuves identiques ; consigner leur lot et leur affectation ensemble.

Ajouter les accessoires après définition du montage. Une alternative ou une option ne devient pas un composant de base sans décision documentée. Ne pas combiner Wio-E5 et Waveshare SX1262 dans une station.
