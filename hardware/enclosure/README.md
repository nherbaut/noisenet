# Montage mécanique

Conserver les plans éditables, exports et photos du montage. Documenter les dimensions, fixations, ouvertures acoustiques, presse-étoupes et le chemin acoustique.

## Fixation directe des modules

Le boîtier de référence est le Hammond 1555F2F42GY. Fixer le Pico 2, le Grove Wio-E5 et les autres composants électroniques légers directement à l'intérieur avec de petites bandes de 3M VHB 5952 (Farnell 3935787 ; largeur 19 mm, épaisseur environ 1.1 mm). Voir la [BOM](../bom.csv) pour les liens fournisseur.

Cette méthode ne nécessite ni plaque interne, ni découpe de plaque, ni perçage du fond du boîtier. Ne pas recouvrir toute la face inférieure des PCB : limiter l'isolation thermique, faciliter le retrait et conserver l'accès aux points de test et aux soudures exposées.

Installer le SEN0232 près de l'ouverture acoustique, avec de petites bandes de VHB ou un petit support mécanique amovible. Aligner le microphone sur l'ouverture et ne jamais poser d'adhésif sur son port.

```text
extérieur
   |
protection pluie
   |
membrane acoustique hydrophobe
   |
ouverture acoustique
   |
microphone SEN0232
   |
petites bandes VHB / support amovible
   |
intérieur du boîtier
```

Conserver une courte cavité acoustique. La colle thermofusible peut servir pour un prototype temporaire de laboratoire ou pour soulager les efforts sur les câbles. Elle n'est pas la fixation permanente privilégiée dehors : le boîtier peut chauffer au soleil et certaines colles peuvent ramollir.

Le montage prévu comprend une protection contre la pluie, une membrane acoustique hydrophobe et une courte cavité vers le microphone. Éloigner les cellules des parois chauffées par le soleil. L'indice IP du boîtier seul ne valide pas l'étanchéité de l'assemblage modifié.

Calibrer la station après installation du boîtier, de la membrane, de la protection pluie, de la cavité et de la fixation finale du SEN0232.
