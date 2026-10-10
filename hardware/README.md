# Suivi du matériel

- `bom.csv` : nomenclature de base pour une station, sans prix ni disponibilité supposés.
- `procurement.csv` : une ligne par composant et commande ; identifiants d'achat `PO-001`, etc. Actualiser les quantités reçues, y compris pour une réception partielle.
- `inventory.csv` : une ligne par lot, état, emplacement et affectation ; identifiants `INV-001`, etc. Lors d'une affectation partielle, répartir la quantité en plusieurs lignes sans la compter deux fois.

États d'achat suggérés : `à commander`, `commandé`, `partiellement reçu`, `reçu`, `annulé`. État du matériel : `neuf`, `en service`, `à contrôler`, `défectueux`.

Conserver la référence RS `0206038` comme texte dans les tableurs pour préserver le zéro initial. Les cellules d'une station doivent former un jeu de trois cellules neuves identiques ; consigner leur lot et leur affectation ensemble.

Ajouter les accessoires après définition du montage. Une alternative ou une option ne devient pas un composant de base sans décision documentée. Ne pas combiner Wio-E5 et Waveshare SX1262 dans une station.
