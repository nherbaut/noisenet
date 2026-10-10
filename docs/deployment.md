# Déploiement et maintenance

## Avant installation

- [ ] Identifier la station et ses révisions matérielle et firmware.
- [ ] Valider les essais électriques, radio, acoustiques et extérieurs.
- [ ] Enregistrer la calibration de la station assemblée.
- [ ] Vérifier étanchéité du montage, fixation, chemin acoustique et dégagement de l'antenne.
- [ ] Vérifier exposition du panneau et protection de la batterie contre la chaleur.
- [ ] Vérifier le comportement de charge aux températures attendues.
- [ ] Configurer LoRaWAN EU868 / OTAA et confirmer la réception des résumés binaires.

Consigner date, site, orientation du panneau, version du décodeur, observations et lien vers l'essai de réception. Conserver les secrets LoRaWAN hors Git.

## Entretien

Enregistrer chaque intervention dans `nodes/NN-xxx/maintenance.md` : état du panneau, membrane, joints, connecteurs, batterie et fixation ; composants remplacés ; essais et recalibration nécessaires. Définir la fréquence d'entretien à partir des premiers retours de terrain.
