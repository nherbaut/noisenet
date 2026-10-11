# AGENTS.md

## Project

NoiseNet is an outdoor environmental sensing node intended to measure urban noise and transmit compact measurements over LoRaWAN.

The baseline node uses:

- Raspberry Pi Pico 2
- DFRobot SEN0232 analog sound-level sensor
- Seeed Studio Grove Wio-E5 LoRaWAN module
- DFRobot KIT0210 solar power system
- three matched 18650 Li-ion cells
- an IP-rated outdoor enclosure

The system should operate autonomously from solar power, charge its battery during daylight, and continue operating from the battery when solar power is unavailable.

## Baseline BOM

Build quantity: **two stations**. Quantities below cover both stations, including shared packs and spares.

| Function | Part | Supplier / reference | Qty. for 2 stations | Product URL | Notes |
|---|---|---|---:|---|---|
| MCU | Raspberry Pi Pico 2 | Farnell 4531086 | 2 | [Farnell product page](https://fr.farnell.com/raspberry-pi/raspberry-pi-pico-2/carte-mcu-rpi-pico-2-520ko-150mhz/dp/4531086) | Main controller |
| Pico IO expansion | DFRobot DFR0848 Gravity expansion board for Raspberry Pi Pico / Pico 2 | Farnell 4308193 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/dfr0848/carte-d-expansion-gravit-carte/dp/4308193) | Simplifies sensor and module connections; verify Pico pin headers, connector compatibility, enclosure fit, and power routing before assembly |
| Sound-level sensor | DFRobot SEN0232 | Farnell 3517935 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/sen0232/sonom-tre-analogique-arduino/dp/3517935) | Analog output, 30–130 dBA nominal range |
| LoRaWAN radio | Seeed Studio Grove Wio-E5, EU868 | Farnell 4007875 | 2 | [Farnell product page](https://fr.farnell.com/seeed-studio/113020091/module-lora-e5-carte-arduino-pi/dp/4007875) | UART/AT-command interface |
| Solar power system | DFRobot KIT0210, 10 W / 18 V | Farnell 4829811 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/kit0210/solar-power-bank-kit-12v-5v-1a/dp/4829811) | Solar panel, controller, cabling, outdoor accessories |
| Battery cells | RS PRO 18650, 3.6 V, 3500 mAh | RS 0206038 | 6 | [RS product page](https://fr.rs-online.com/web/p/piles-rechargeables-taille-speciale/0206038) | Use three identical new cells; verify mechanical compatibility before ordering |
| Electronics enclosure | Hammond 1555F2F42GY, IP-rated polycarbonate | Farnell 1829810 | 2 | [Farnell product page](https://fr.farnell.com/en-FR/hammond/1555f2f42gy/box-flanged-pc-ip67/dp/1829810) | Light-coloured enclosure preferred outdoors |
| PCB/module mounting | 3M VHB 5952 double-sided acrylic foam tape | Farnell 3935787 | 2 rolls | [Farnell product page](https://fr.farnell.com/3m/5952-black-3m-x-19mm/ruban-double-face-3m-x-19mm-noir/dp/3935787) | 19 mm wide, approximately 1.1 mm thick; directly mount the Pico, LoRa module, and other lightweight electronics inside the Hammond enclosure without drilling or a separate mounting plate |
| Power isolation diode | SS14 Schottky diode | Farnell 2675133 | 2 | [Farnell product page](https://fr.farnell.com/multicomp-pro/ss14/redresseur-schottky-1a-40v-do/dp/2675133) | Between external 5 V supply and Pico VSYS |
| Acoustic vent | Hydrophobic microphone-rated acoustic membrane | TBD | 2 | TBD | Must have documented acoustic insertion loss / frequency response |
| LoRa antenna | EU868 antenna | Included with Wio-E5 or compatible external antenna | 2 | TBD | Keep clear of enclosure shielding |
| Cable glands | HellermannTyton NGM12-GY, M12, light grey, IP68 | Farnell 2499293 | 1 pack of 10 | [Farnell product page](https://fr.farnell.com/hellermanntyton/ngm12-gy/presse-etoupe-nylon-6-6-3mm-6/dp/2499293) | Cable diameter 3–6.5 mm; provisionally two per station for solar and antenna connections as required, with six spares; verify cable diameter and mounting accessories |
| Shared LoRaWAN gateway | MikroTik wAP LR8G kit, 868 MHz | GETIC / RBwAPR-2nD&R11e-LR8G | 1 | [GETIC product page](https://www.getic.fr/product/mikrotik-wap-lr8g-kit) | Shared infrastructure for both stations; [manufacturer specifications](https://mikrotik.com/product/wap_lr8g_kit); included 24 V 0.8 A power adapter and PoE injector; provide dedicated power and Ethernet/Wi-Fi Internet access; verify coverage and configure the LoRaWAN server |
| Grove connection cable | Seeed Studio 110990028, Grove 4-pin to female jumpers | Farnell 3932132 | 1 pack of 5 | [Farnell product page](https://fr.farnell.com/en-FR/seeed-studio/110990028/f-jumper-conversion-cable-4-pin/dp/3932132) | One cable per station for Wio-E5 and three spares; female jumpers fit 2.54 mm male headers; verify available headers and UART/power pinout |

## Optional environmental sensor

The following sensor may be added later:

| Function | Part | Reference | Qty. | Product URL | Notes |
|---|---|---|---:|---|---|
| PM sensor | DFRobot SEN0460 | Farnell 3974148 | 1 | [Farnell product page](https://fr.farnell.com/dfrobot/sen0460/module-capteur-de-qualit-de-l/dp/3974148) | I2C, PM1.0 / PM2.5 / PM10 |

The SEN0460 is not part of the baseline node unless explicitly requested.

## Considered LoRa alternative

The Waveshare Pico-LoRa-SX1262-868M is a valid alternative to the Wio-E5.

Use it only if the project explicitly chooses to run the LoRaWAN stack on the Pico.

Differences:

- Wio-E5:
  - LoRaWAN stack runs inside the module.
  - Pico communicates through UART and AT commands.
  - Lower software integration effort.

- Waveshare Pico-LoRa-SX1262-868M:
  - SX1262 is controlled directly through SPI.
  - LoRaWAN stack runs on the Pico.
  - Hardware integration is cleaner.
  - GP26 is used for battery monitoring on the Waveshare board, so the SEN0232 should use GP27 / ADC1 instead.

Do not combine both LoRa solutions in the same node.

## Electrical architecture

Baseline architecture:

```text
10 W / 18 V solar panel
          |
          v
+----------------------+
| DFRobot KIT0210      |
| solar power system   |
|                      |
| 3 x 18650 battery    |
+----------+-----------+
           |
           | regulated 5 V
           v
        SS14 diode
           |
           v
       Pico 2 VSYS
           |
           +---- 3V3 ----> SEN0232
           |
           +-------------> Wio-E5 supply as appropriate
```

The Pico must not be powered directly from the raw solar panel.

The Pico must not be connected directly to bare Li-ion cells.

Battery charging and solar/battery switchover must be handled by the solar power-management system.

## Pico pin allocation

Baseline with Wio-E5:

| Pico signal | Function |
|---|---|
| GP26 / ADC0 | SEN0232 analog output |
| UART TX | Wio-E5 RX |
| UART RX | Wio-E5 TX |
| 3V3 | SEN0232 supply |
| GND | Common ground |
| VSYS | External regulated power through Schottky diode |

Select concrete UART GPIO pins in firmware and document them in the source tree.

If the Waveshare Pico-LoRa-SX1262-868M is used instead:

| Pico signal | Function |
|---|---|
| GP27 / ADC1 | SEN0232 analog output |
| GP26 / ADC0 | Waveshare battery voltage monitoring |
| GP2 | SX1262 BUSY |
| GP3 | SX1262 CS |
| GP10 | SPI SCK |
| GP11 | SPI MOSI |
| GP12 | SPI MISO |
| GP15 | SX1262 RESET |
| GP20 | SX1262 DIO1 |

## SEN0232 acquisition

The SEN0232 is an analog sound-level module.

The firmware should:

1. sample the SEN0232 through the Pico ADC;
2. convert ADC readings to sensor output voltage;
3. derive the corresponding sound level using the sensor calibration;
4. aggregate measurements locally;
5. transmit compact summaries over LoRaWAN.

Do not transmit raw ADC samples over LoRaWAN.

A reasonable initial aggregation interval is one minute.

Suggested fields:

- `laeq_1min`
- `min_1min`
- `max_1min`
- battery voltage
- node status
- sequence number

Do not label a metric as standards-compliant `LAeq`, `LAFmax`, or similar unless the complete measurement chain has been validated accordingly.

## LoRaWAN

Target region: EU868.

For the baseline Wio-E5 design:

- communicate with the module over UART;
- use OTAA unless the project explicitly requires ABP;
- keep the radio inactive between transmissions;
- use compact binary payloads;
- perform payload decoding on the network/server side.

A transmission interval of approximately five minutes is a reasonable starting point if several one-minute measurements are batched into one payload.

Avoid JSON on the LoRa air interface.

## Battery rules

The KIT0210 uses three 18650 cells.

Requirements:

- use three identical cells;
- use new cells from the same model and preferably the same batch;
- do not mix capacities, chemistries, ages, or states of health;
- verify cell dimensions and terminal style against the KIT0210 holder before procurement;
- verify the permitted charging current and charging-temperature range from the cell datasheet;
- never charge cells outside the battery manufacturer's allowed temperature range;
- keep the battery shaded from direct solar heating.

The current cost-oriented candidate is:

- RS PRO 18650
- 3.6 V nominal
- 3500 mAh
- RS reference 0206038 — [RS product page](https://fr.rs-online.com/web/p/piles-rechargeables-taille-speciale/0206038)
- quantity: 3

The previously considered Jauch LR1865HB is not the preferred option because of its high unit cost.

## Outdoor enclosure

The electronics enclosure should be IP-rated and preferably light-coloured.

Mount lightweight modules directly inside the enclosure using small strips of 3M VHB 5952. This strategy minimizes assembly work for students: no custom plate cutting, no drilling of the enclosure base, and no separate internal mounting plate.

```text
Hammond 1555F2F42GY
│
├── Pico 2
│     └── mounted directly with small strips of 3M VHB 5952
│
├── LoRa module
│     └── mounted directly with small strips of 3M VHB 5952
│
└── SEN0232
      └── mounted close to the acoustic opening
          using VHB or a small removable mechanical support
```

Apply VHB only in small strips rather than covering the complete underside of each PCB, so that components are not unnecessarily thermally insulated, modules remain easier to remove, and test pads and exposed solder joints remain accessible.

Hot-melt glue may be used for temporary laboratory prototypes or for strain relief. It should not be the preferred permanent mounting method for outdoor deployment because enclosure temperatures can become high in direct sunlight and some hot-melt adhesives may soften.

The SEN0232 cannot simply be sealed behind solid plastic. Sound must reach the microphone through a protected acoustic path.

Preferred arrangement:

```text
outside
   |
rain shield
   |
hydrophobic acoustic membrane
   |
acoustic opening
   |
SEN0232 microphone
   |
small VHB strips / removable support
   |
inside enclosure
```

Keep the microphone aligned with the acoustic opening and preserve a short acoustic cavity. Do not place adhesive over the microphone port.

Requirements:

- microphone aperture should face downward or be protected by a rain hood;
- use a microphone-rated hydrophobic acoustic membrane;
- do not substitute a generic waterproof pressure vent unless its acoustic response is documented;
- calibrate the complete assembled node after the enclosure, acoustic membrane, rain shield, microphone cavity, and final SEN0232 mounting are installed;
- avoid placing the battery against the solar-heated enclosure wall;
- use sealed cable glands for solar and antenna connections as required.

## Calibration

Calibration applies to the complete assembled station, not only to the bare SEN0232.

The assembled system may alter acoustic response because of:

- enclosure geometry;
- acoustic membrane;
- rain shield;
- microphone cavity;
- ADC gain/offset;
- manufacturing variation.

Store calibration coefficients per node.

At minimum, compare each node against a reference sound-level meter at several stable sound levels.

A simple correction model may initially be used:

```text
L_corrected = a * L_sensor + b
```

Store `a` and `b` in node-specific configuration.

Do not claim a guaranteed +/-3 dB field accuracy until it has been verified experimentally on the assembled outdoor station.

## Power strategy

The node is intended to measure noise continuously.

Therefore:

- keep the SEN0232 powered during normal operation;
- reduce Pico power consumption where practical;
- keep the LoRa radio asleep except during communication;
- aggregate locally and transmit infrequently;
- monitor battery voltage and report it with telemetry.

The 10 W solar panel is intentionally oversized relative to the average node consumption so that it can:

- power the node during daylight;
- recharge the battery after overnight operation;
- recover from several cloudy periods;
- tolerate non-optimal panel orientation and conversion losses.

## Firmware structure

Preferred source layout:

```text
src/
  main.c
  sensor/
    sen0232.c
    sen0232.h
  radio/
    lorawan.c
    lorawan.h
  power/
    battery.c
    battery.h
  telemetry/
    telemetry.c
    telemetry.h

config/
  node_config.h

docs/
  wiring.md
  calibration.md
  deployment.md
```

Keep hardware-specific code isolated from measurement logic.

## Telemetry

A compact binary payload is preferred.

Example logical fields:

```text
uint16  LAeq_x10
uint16  min_x10
uint16  max_x10
uint16  battery_mV
uint8   status
uint8   sequence
```

The server should convert the binary payload to JSON or database records after LoRaWAN reception.

## Safety constraints

Do not:

- connect an 18 V solar panel directly to the Pico;
- connect an 18 V solar panel directly to a LiPo cell;
- bypass the solar charge controller;
- use unmatched 18650 cells in the KIT0210;
- charge lithium cells outside their specified temperature range;
- expose bare electronics or battery cells to rain or condensation;
- assume that an IP-rated enclosure automatically provides a valid acoustic path.

## Procurement notes

Primary sourcing is Farnell where practical.

Battery cells may be sourced from RS because Farnell's suitable 18650 options are disproportionately expensive.

Before ordering, re-check:

- current stock;
- battery mechanical compatibility;
- battery charge-current specification;
- connector compatibility;
- antenna inclusion;
- acoustic membrane availability.

Stock status and pricing change over time and must not be hard-coded into firmware or project logic.
