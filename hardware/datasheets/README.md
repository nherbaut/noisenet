# Sources techniques

Enregistrer les liens officiels et, lorsque possible, les fiches techniques consultées. Les pages fournisseur figurent dans la [nomenclature](../bom.csv). Leur identification ne vaut pas validation des fiches techniques ou de la compatibilité électrique et mécanique.

| Composant | Page fournisseur | Source fabricant | Document / version | Date de consultation | Points à vérifier |
|---|---|---|---|---|---|
| Pico 2 | [Farnell 4531086](https://fr.farnell.com/raspberry-pi/raspberry-pi-pico-2/carte-mcu-rpi-pico-2-520ko-150mhz/dp/4531086) | [Raspberry Pi — doc](https://datasheets.raspberrypi.com/pico/pico-2-datasheet.pdf) | À renseigner | — | VSYS, budget 3V3, ADC, niveaux GPIO |
| DFR0848 | [Farnell 4308193](https://fr.farnell.com/dfrobot/dfr0848/carte-d-expansion-gravit-carte/dp/4308193) | [DFRobot — doc](https://wiki.dfrobot.com/dfr0848) | À renseigner | — | Barrettes Pico, connecteurs Gravity, encombrement, chemin d'alimentation |
| SEN0232 | [Farnell 3517935](https://fr.farnell.com/dfrobot/sen0232/sonom-tre-analogique-arduino/dp/3517935) | [DFRobot — doc](https://wiki.dfrobot.com/sen0232/) | À renseigner | — | Alimentation, transfert tension/niveau sonore, consommation |
| Grove Wio-E5 | [Farnell 4007875](https://fr.farnell.com/seeed-studio/113020091/module-lora-e5-carte-arduino-pi/dp/4007875) | [Seeed Studio — doc](https://wiki.seeedstudio.com/Grove_LoRa_E5_New_Version/) | À renseigner | — | Alimentation du module Grove, UART, veille, antenne |
| KIT0210 | [Farnell 4829811](https://fr.farnell.com/dfrobot/kit0210/solar-power-bank-kit-12v-5v-1a/dp/4829811) | [DFRobot — doc](https://wiki.dfrobot.com/kit0210/) | À renseigner | — | Sortie 5 V, holder, charge, protections, connecteurs |
| RS 0206038 | [RS 0206038](https://fr.rs-online.com/web/p/piles-rechargeables-taille-speciale/0206038) | [RS PRO — doc](https://docs.rs-online.com/1f20/A700000012589980.pdf) | À renseigner | — | Dimensions, terminaux, courant et températures de charge |
| Hammond 1555F2F42GY | [Farnell 1829810](https://fr.farnell.com/en-FR/hammond/1555f2f42gy/box-flanged-pc-ip67/dp/1829810) | [Hammond — doc](https://www.hammfg.com/part/1555F2F42GY) | À renseigner | — | Dimensions, IP, montage |
| 1N5819 | [Farnell 9801219](https://fr.farnell.com/stmicroelectronics/1n5819/diode-schottky-1a-40v/dp/9801219) | [STMicroelectronics — doc](https://www.st.com/resource/en/datasheet/1n5819.pdf) | À renseigner | — | STMicroelectronics, axial DO-41 traversant, 1 A / 40 V ; cathode côté bague ; vérifier chute de tension en charge |
| 3M VHB 5952 | [Farnell 3935787](https://fr.farnell.com/3m/5952-black-3m-x-19mm/ruban-double-face-3m-x-19mm-noir/dp/3935787) | [3M — doc](https://multimedia.3m.com/mws/media/2366487O/3m-vhb-tape-5952.pdf) | À renseigner | — | Largeur 19 mm, épaisseur environ 1.1 mm, fixation par petites bandes |
| Membrane acoustique | TBD | À sélectionner | À renseigner | — | Insertion acoustique, fréquence, montage, protection eau |
| Antenne EU868 | TBD | À sélectionner | À renseigner | — | Inclusion, connecteur, position dans le boîtier |
| SEN0460 (option hors baseline) | [Farnell 3974148](https://fr.farnell.com/dfrobot/sen0460/module-capteur-de-qualit-de-l/dp/3974148) | [DFRobot — doc](https://wiki.dfrobot.com/sen0460) | À renseigner | — | I2C, alimentation, intégration si option retenue |

Nom de fichier conseillé : `fabricant-modele-version.pdf`. Citer les pages pertinentes dans les décisions et comptes rendus.
