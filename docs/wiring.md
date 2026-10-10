# Câblage

Statut : architecture prévue, câblage à valider avant mise sous tension.

```text
Panneau solaire 10 W / 18 V
  -> système KIT0210 avec trois cellules 18650 identiques
  -> sortie régulée 5 V
  -> anode SS14 -> cathode SS14 -> Pico 2 VSYS
Pico 2 3V3 -> SEN0232
SEN0232 sortie analogique -> GP26 / ADC0
Pico UART -> Grove Wio-E5
Masses communes
```

| Source | Destination | État / vérification |
|---|---|---|
| KIT0210 5 V régulé | SS14 puis VSYS | Vérifier tension, polarité, connecteurs et chute de tension |
| Pico 3V3 | SEN0232 alimentation | Vérifier consommation et budget du rail |
| SEN0232 analogique | GP26 / ADC0 | Vérifier plage de tension compatible ADC |
| Pico UART TX | Wio-E5 RX | GPIO à choisir ; vérifier niveaux logiques |
| Pico UART RX | Wio-E5 TX | GPIO à choisir ; vérifier niveaux logiques |
| Alimentation à définir | Grove Wio-E5 | Vérifier la fiche du module Grove et les pointes de courant |
| GND | Masses des modules | Documenter chaque connexion |
| Circuit batterie à définir | ADC à choisir | Ne pas raccorder la batterie directement à un GPIO |

Le circuit de mesure batterie doit être dimensionné selon la topologie et la plage réelles du KIT0210. Documenter le diviseur, la référence de masse, les protections et la conversion avant raccordement.

Ne jamais alimenter le Pico depuis le panneau brut ou des cellules nues. La charge et le passage solaire/batterie restent assurés par le KIT0210. Documenter également le branchement USB lors du développement.
