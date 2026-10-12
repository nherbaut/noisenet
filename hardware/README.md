# Suivi du matériel

- `bom.csv` : nomenclature de base pour deux stations, avec quantités par station et quantités totales à prévoir, sans prix ni disponibilité supposés.
- `optional-bom.csv` : options hors baseline ; le SEN0460 reste exclu tant qu'il n'est pas explicitement demandé.
- `procurement.csv` : une ligne par composant et commande ; identifiants d'achat `PO-001`, etc. Actualiser les quantités reçues, y compris pour une réception partielle.
- `inventory.csv` : une ligne par lot, état, emplacement et affectation ; identifiants `INV-001`, etc. Lors d'une affectation partielle, répartir la quantité en plusieurs lignes sans la compter deux fois.

États d'achat suggérés : `à commander`, `commandé`, `partiellement reçu`, `reçu`, `annulé`. État du matériel : `neuf`, `en service`, `à contrôler`, `défectueux`.

Les colonnes `manufacturer_reference` et `supplier_reference` distinguent la référence fabricant du code de commande. Pour le Grove Wio-E5 : `113020091` chez le fabricant, `4007875` chez Farnell. `product_url` contient une page produit directe Farnell France, RS France ou GETIC du composant, ou `TBD` lorsqu'aucune référence exacte n'est sélectionnée. `quantity_unit` distingue les pièces du rouleau de VHB ; conserver les identifiants existants lors des évolutions de BOM.

`documentation_url` contient la documentation du composant (wiki fabricant ou fiche technique officielle), ou `TBD`. Sur le site Hugo, les colonnes fabricant et référence fabricant pointent vers cette documentation ; les colonnes fournisseur et référence fournisseur pointent vers l'achat. Les URL restent dans les CSV téléchargeables, sans colonnes de liens supplémentaires à l'écran. Le suivi des achats réutilise les liens de la BOM via `component_id`, uniquement si le fournisseur et sa référence correspondent.

Conserver la référence RS `0206038` comme texte dans les tableurs pour préserver le zéro initial. Les cellules d'une station doivent former un jeu de trois cellules neuves identiques ; consigner leur lot et leur affectation ensemble.

Ajouter les accessoires après définition du montage. Une alternative ou une option ne devient pas un composant de base sans décision documentée. Ne pas combiner Wio-E5 et Waveshare SX1262 dans une station.

La construction prévue comprend **deux stations**. `quantity_per_node` conserve le besoin par station ; `quantity_for_two_nodes` indique la quantité totale à prévoir, réserves et conditionnement inclus. Les composants installés dans chaque station sont doublés et les batteries totalisent six cellules (trois par station). Pour les presse-étoupes `HW-012`, commander **un pack de 10** Farnell `2499293` : provision de deux pièces par station et six de réserve. Confirmer le nombre de passages et le diamètre des câbles (3–6.5 mm) lors du montage. Les quantités de cette ligne sont en pièces ; une quantité de commande de 1 correspond à un pack de 10.

La passerelle `HW-013` MikroTik wAP LR8G kit (868 MHz), référence `RBwAPR-2nD&R11e-LR8G`, est achetée chez GETIC : **une seule unité partagée pour les deux stations**. `quantity_per_node = 0` indique un équipement réseau externe aux stations ; `quantity_for_two_nodes = 1` représente le besoin du projet. La référence fournisseur reprend la référence fabricant affichée par GETIC. Prévoir une alimentation dédiée et un accès Internet Ethernet/Wi-Fi ; valider la couverture des deux stations et la configuration du serveur LoRaWAN au déploiement. La page fabricant indique un adaptateur 24 V 0.8 A et un injecteur PoE inclus.

Pour le câble Grove `HW-014` Seeed Studio `110990028` (Farnell `3932132`), commander **un lot de cinq câbles** : un par station pour le Wio-E5 et trois de réserve. Les quantités de la BOM sont en câbles ; une quantité de commande de 1 correspond à un lot de 5. Vérifier la présence de barrettes mâles au pas de 2.54 mm et le brochage UART/alimentation avant raccordement.
