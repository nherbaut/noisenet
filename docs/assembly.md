# Assemblage d'une station

Créer d'abord une fiche à partir de [nodes/_template](../nodes/_template/). Renseigner les composants réellement montés et la révision matérielle.

## Avant montage

- [ ] BOM et schéma vérifiés ; points bloquants résolus.
- [ ] Trois cellules neuves identiques, dimensions et terminaux compatibles.
- [ ] Courant et températures de charge vérifiés ; protection contre la charge hors plage documentée.
- [ ] Alimentation et interface du Wio-E5 vérifiées.
- [ ] Membrane acoustique sélectionnée avec documentation.
- [ ] Ruban 3M VHB 5952 prévu pour les modules légers ; implantation et accès aux points de test définis.

## Montage et contrôle

- [ ] Fixer les éléments en conservant la batterie à l'écart des parois chauffées.
- [ ] Fixer directement le Pico et le Wio-E5 avec de petites bandes de VHB, sans plaque ni perçage du fond du boîtier.
- [ ] Laisser accessibles points de test et soudures exposées ; ne pas recouvrir tout le dessous des PCB.
- [ ] Fixer le SEN0232 près de l'ouverture par petites bandes de VHB ou support amovible, microphone aligné et port sans adhésif.
- [ ] Installer le chemin acoustique protégé et les passages de câbles étanches.
- [ ] Contrôler polarité, continuité et absence de court-circuit hors tension.
- [ ] Contrôler les tensions d'alimentation avant de raccorder les modules.
- [ ] Vérifier acquisition ADC, radio et mesure batterie.
- [ ] Photographier et enregistrer le montage réel.
- [ ] Réaliser les essais de consommation et de fonctionnement solaire/batterie.
- [ ] Calibrer après installation du boîtier, de la membrane, de la protection pluie, de la cavité et de la fixation finale du SEN0232.

Enregistrer les résultats dans la fiche de station avec des liens vers les essais. Une case cochée doit être appuyée par un contrôle réalisé.

Voir le [montage mécanique](../hardware/enclosure/README.md). Réserver la colle thermofusible aux prototypes temporaires de laboratoire ou au soulagement des câbles ; certaines colles peuvent ramollir lorsque le boîtier chauffe au soleil.
