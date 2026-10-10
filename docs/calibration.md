# Calibration

Calibrer chaque station après montage du boîtier, de la membrane, de la cavité, de la protection pluie et de la fixation finale du SEN0232. Le microphone doit rester aligné avec l'ouverture et son port doit rester sans adhésif. Ne pas attribuer une précision garantie ou une conformité normative sans validation de la chaîne complète.

## Procédure initiale

1. Enregistrer station, révision matérielle, firmware, sonomètre de référence et conditions de mesure.
2. Comparer la station au sonomètre à plusieurs niveaux sonores stables, avec positions et fenêtres temporelles documentées.
3. Conserver les lectures brutes dans `nodes/NN-xxx/calibration.csv`.
4. Ajuster si pertinent `L_corrected = a * L_sensor + b`.
5. Vérifier la correction sur des mesures distinctes de celles utilisées pour l'ajustement ; enregistrer écarts et limites.
6. Enregistrer les coefficients validés dans `calibration.json`, la date et le rapport correspondant.

Les coefficients `null` du modèle indiquent une calibration absente et ne doivent pas être utilisés par le firmware. Une modification du chemin acoustique ou du capteur impose de réévaluer la calibration.

Pour une moyenne énergétique indicative, travailler sur l'énergie (`10^(L/10)`) avant conversion en dB. Cette opération ne suffit pas à qualifier une mesure de LAeq conforme. Documenter la conversion tension/niveau à partir de la documentation du SEN0232.
