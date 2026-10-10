# Firmware

Le firmware n'est pas encore implémenté. Organisation prévue par AGENTS.md :

```text
src/
  main.c
  sensor/sen0232.c, sen0232.h
  radio/lorawan.c, lorawan.h
  power/battery.c, battery.h
  telemetry/telemetry.c, telemetry.h
config/
  node_config.h
```

Isoler les accès matériels de la logique de mesure. Documenter les GPIO UART retenus dans la configuration et `docs/wiring.md`. Prévoir acquisition continue, agrégations locales et payloads binaires ; ne pas transmettre les échantillons ADC bruts.
