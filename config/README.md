# Configuration

Le futur `node_config.h` contiendra les paramètres matériels et de fonctionnement documentés : broches, cadence et format de télémétrie. Les coefficients de calibration sont propres à chaque station et proviennent de sa calibration validée.

Conserver les clés OTAA et autres secrets hors Git, par exemple dans `config/local/` (ignoré). Aucun paramètre électrique ou coefficient de calibration non vérifié ne doit être utilisé comme valeur par défaut opérationnelle.
