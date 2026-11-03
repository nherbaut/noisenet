# Câblage

Statut : architecture prévue, câblage à valider avant mise sous tension.

```text
Panneau solaire 10 W / 18 V
  -> système KIT0210 avec trois cellules 18650 identiques
  -> sortie régulée 5 V
  -> anode 1N5819 -> cathode 1N5819 -> Pico 2 VSYS
Pico 2 3V3 -> SEN0232
SEN0232 sortie analogique -> GP26 / ADC0
Pico UART -> Grove Wio-E5
Masses communes
```

| Source | Destination | État / vérification |
|---|---|---|
| KIT0210 5 V régulé | 1N5819 puis VSYS | Vérifier tension, polarité, connecteurs et chute de tension |
| Pico 3V3 | SEN0232 alimentation | Vérifier consommation et budget du rail |
| SEN0232 analogique | GP26 / ADC0 | Vérifier plage de tension compatible ADC |
| Pico UART TX | Wio-E5 RX | GPIO à choisir ; vérifier niveaux logiques |
| Pico UART RX | Wio-E5 TX | GPIO à choisir ; vérifier niveaux logiques |
| Alimentation à définir | Grove Wio-E5 | Vérifier la fiche du module Grove et les pointes de courant |
| GND | Masses des modules | Documenter chaque connexion |
| Circuit batterie à définir | ADC à choisir | Ne pas raccorder la batterie directement à un GPIO |

Le circuit de mesure batterie doit être dimensionné selon la topologie et la plage réelles du KIT0210. Documenter le diviseur, la référence de masse, les protections et la conversion avant raccordement.

Ne jamais alimenter le Pico depuis le panneau brut ou des cellules nues. La charge et le passage solaire/batterie restent assurés par le KIT0210. Documenter également le branchement USB lors du développement.

La diode retenue est une **1N5819 STMicroelectronics, axiale traversante DO-41, 1 A / 40 V**, adaptée à la soudure manuelle. Pour la station A, relier l’anode au 5 V régulé du gestionnaire d’alimentation et la cathode (côté bague) à VSYS. Isoler les soudures et les pattes exposées avec de la gaine thermorétractable ; contrôler la tension VSYS en charge.

## Alimentation USB directe de la station B

```text
Alimentation Raspberry Pi 5 SC1157, câble USB-C captif
  -> adaptateur USB-C femelle / micro-USB mâle
  -> port micro-USB du Pico 2 WH enfiché dans la DFR0848
  -> alimentation des modules depuis les rails adaptés de la station
```

La station B ne possède ni pile, ni batterie, ni gestionnaire de charge. Le port micro-USB du Pico alimente VSYS via la diode déjà présente sur le Pico ; aucune 1N5819 externe n'est à ajouter sur ce trajet. Ne pas injecter le 5 V sur `3V3`. Conserver les masses communes du Pico, du SEN0232, du GPS et du Wio-E5. La station s'arrête lorsque l'alimentation USB est débranchée.

L’adaptateur prévu est CAB55550, avec fournisseur à sélectionner. Vérifier qu'il active correctement la sortie 5 V du chargeur USB-C ; aucun déclencheur PD à tension supérieure ne doit être utilisé. Le KIT0210 de la station A possède une entrée USB-C utilisable directement, sans cet adaptateur.

Fil et gaine thermorétractable sont déjà disponibles chez l'utilisateur. La batterie et les essais de charge concernent uniquement la station A.
