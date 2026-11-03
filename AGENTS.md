# AGENTS.md

## Project

NoiseNet is an outdoor environmental sensing node intended to measure urban noise and transmit compact measurements over LoRaWAN.

The project contains exactly two complete sensing stations:

- **Station A:** solar-powered, using one DFRobot KIT0210 and three matched RS PRO 18650 cells.
- **Station B:** powered directly through the Pico 2 WH micro-USB port using a Raspberry Pi 5 USB-C PSU and USB-C-female to micro-USB-male adapter. No solar panel, battery or battery charger is fitted to Station B.

Both stations use the Raspberry Pi Pico 2 WH (SC1634, presoldered headers), DFRobot SEN0232, Grove Wio-E5 EU868, Grove BME280 environmental sensor, DFR0848 expansion board and the selected Hammond outdoor enclosure design; purchase only one enclosure for the project, with allocation to A/B to be decided. Common sensing, LoRaWAN, enclosure and firmware decisions remain unchanged.

Station A charges during daylight and continues on battery when solar power is unavailable. Station B measures while USB power is present and stops when it is disconnected; no battery backup is provided.

## Baseline BOM

Build quantity: **one solar station (A) and one directly USB-powered station (B)**. Station columns describe installed requirements. Total quantities include shared consumables and supplier packs; surplus items are spares, not additional stations.

| Function | Part | Supplier / reference | Solar station qty | USB station qty | Total qty | Product URL | Notes |
|---|---|---|---:|---:|---:|---|---|
| MCU | Raspberry Pi Pico 2 WH (SC1634), presoldered headers | Farnell 4667138 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/raspberry-pi/sc1634/rpi-pico-2w-brd-520kb-150mhz-w/dp/4667138) | Main controller; presoldered headers included; retain Wio-E5 for LoRaWAN. |
| Pico IO expansion | DFRobot DFR0848 Gravity expansion board for Raspberry Pi Pico / Pico 2 | Farnell 4308193 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/dfr0848/carte-d-expansion-gravit-carte/dp/4308193) | Simplifies sensor and module connections; verify Pico pin headers, connector compatibility, enclosure fit, and power routing before assembly |
| Sound-level sensor | DFRobot SEN0232 | Farnell 3517935 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/sen0232/sonom-tre-analogique-arduino/dp/3517935) | Analog output, 30–130 dBA nominal range |
| LoRaWAN radio | Seeed Studio Grove Wio-E5, EU868 | Farnell 4007875 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/seeed-studio/113020091/module-lora-e5-carte-arduino-pi/dp/4007875) | UART/AT-command interface |
| Solar power system | DFRobot KIT0210, 10 W / 18 V | Farnell 4829811 | 1 | 0 | 1 | [Farnell product page](https://fr.farnell.com/dfrobot/kit0210/solar-power-bank-kit-12v-5v-1a/dp/4829811) | Station A only; KIT0210 includes its 10 W / 18 V panel, controller, cables and PG7 glands. No separate panel or controller. |
| Battery cells | RS PRO 18650, 3.6 V, 3500 mAh | RS 0206038 | 3 | 0 | 3 | [RS product page](https://fr.rs-online.com/web/p/piles-rechargeables-taille-speciale/0206038) | Station A only; three identical new matched cells; verify KIT0210 holder fit and cell charging specifications. |
| Electronics enclosure | Hammond 1555F2F42GY, IP-rated polycarbonate | Farnell 1829810 | To allocate | To allocate | 1 | [Farnell product page](https://fr.farnell.com/en-FR/hammond/1555f2f42gy/box-flanged-pc-ip67/dp/1829810) | Purchase only one enclosure; allocation A/B TBD. Do not assume another enclosure is already available; protect each station before outdoor deployment. |
| PCB/module mounting | 3M VHB 5952 double-sided acrylic foam tape | Farnell 3935787 | Shared | Shared | 1 roll | [Farnell product page](https://fr.farnell.com/3m/5952-black-3m-x-19mm/ruban-double-face-3m-x-19mm-noir/dp/3935787) | Shared project consumable; 19 mm wide, approximately 1.1 mm thick; small strips for direct mounting without an internal plate or base drilling. |
| Power isolation diode | STMicroelectronics 1N5819, axial DO-41, 1 A / 40 V | Farnell 9801219 | 1 | 0 | 5 pieces | [Farnell product page](https://fr.farnell.com/stmicroelectronics/1n5819/diode-schottky-1a-40v/dp/9801219) | Station A only, between KIT0210 regulated 5 V and Pico VSYS; one installed and four spares. Station B uses the onboard USB diode and needs no external diode. Farnell minimum/multiple of five checked 2026-10-12; re-check before ordering. |
| Acoustic vent | Hydrophobic microphone-rated acoustic membrane | TBD | 1 | 1 | 2 | TBD | Must have documented acoustic insertion loss / frequency response |
| LoRa antenna | EU868 antenna | Included with Wio-E5 or compatible external antenna | 1 | 1 | 2 | TBD | Keep clear of enclosure shielding |
| Cable glands | HellermannTyton NGM12-GY, M12, light grey, IP68 | Farnell 2499293 | 1 | 0 | 1 pack of 10 | [Farnell product page](https://fr.farnell.com/hellermanntyton/ngm12-gy/presse-etoupe-nylon-6-6-3mm-6/dp/2499293) | One M12 IP68 gland for Station A regulated 5 V cable entering the Hammond enclosure; nine spare glands. Cable diameter 3–6.5 mm; verify fit and mounting accessories. KIT0210 PG7 glands are already included; additional antenna or USB cable entries only if required by final routing. |
| Shared LoRaWAN gateway | MikroTik wAP LR8G kit, 868 MHz | GETIC / RBwAPR-2nD&R11e-LR8G | Shared | Shared | 1 | [GETIC product page](https://www.getic.fr/product/mikrotik-wap-lr8g-kit) | Shared infrastructure for both stations; [manufacturer specifications](https://mikrotik.com/product/wap_lr8g_kit); included 24 V 0.8 A power adapter and PoE injector; provide dedicated power and Ethernet/Wi-Fi Internet access; verify coverage and configure the LoRaWAN server |
| Grove connection cable | Seeed Studio 110990210, Grove 4-pin to male jumpers | Farnell 3410135 | 2 | 2 | 1 pack of 5 | [Farnell product page](https://fr.farnell.com/en-FR/seeed-studio/110990210/cable-4-pin-male-jumper-grove/dp/3410135) | Two cables per station (Wio-E5 UART and BME280 I2C) and one spare; male 2.54 mm jumpers fit DFR0848 female headers; no soldering; verify UART TX/RX or I2C SDA/SCL and power/GND. |
| Pico headers | Presoldered headers included with Pico 2 WH | Included | 1 included set | 1 included set | 0 additional sets | Included with MCU | Do not order separate Pico headers; verify fit with DFR0848. |
| Common wiring | Hookup wire already available at home | User stock | As needed | As needed | 0 to buy | — | User supplies wire; connectors still depend on final routing. |
| USB charger | Raspberry Pi 5 official 27 W USB-C PSU EU black, SC1157 | Farnell 4263045 | 1 | 1 | 2 (quantity assumed, confirm) | [Farnell product page](https://fr.farnell.com/raspberry-pi/sc1157/alimentation-usb-c-5-1v-5a-noire/dp/4263045) | Captive USB-C cable; base output 5.1 V; B powered directly through Pico micro-USB via adapter; KIT0210 USB-C input needs no adapter. |
| USB charging adapter | CAB55550, USB-C female to micro-USB male | TBD | 1 | 1 | 2 (quantity assumed, confirm) | TBD | Replaces separate charging cable; captive cable on PSU. USB-C source activation with this adapter remains to verify; no higher-voltage PD trigger. |
| Solder-joint insulation | Heat-shrink tubing already available at home | User stock | As needed | As needed | 0 to buy | — | User supplies tubing; no additional purchase. |
| GNSS positioning | DFRobot Gravity TEL0157 | Farnell 4457334 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/en-FR/dfrobot/tel0157/gnss-module-i2c-uart-2m-3-3-to/dp/4457334) | One module per station; use I2C on DFR0848 with selector in I2C mode; Gravity 4P cable and GNSS antenna included; ensure male cable ends for female headers; firmware integration to define; retain Wio-E5 UART. |
| Gateway LoRa antenna | MikroTik 868 Omni antenna, 6.5 dBi | GETIC / 868_Omni_antenna | Shared | Shared | 1 kit | [GETIC product page](https://www.getic.fr/product/mikrotik-868-omni-antenna) | External coverage upgrade; optional if internal antenna suffices after field tests. Kit includes SMA-female antenna, 1 m SMA-male to SMA-male cable and mount; no N–SMA adapter required. Connect to the LoRa SMA port with power off. |
| Environmental sensor | Seeed Studio Grove BME280, 101020193 | Farnell 3932095 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/seeed-studio/101020193/carte-capteur-carte-arduino/dp/3932095) | Temperature, humidity and pressure; use I2C at 3.3 V via DFR0848 with a Grove-to-male-jumper cable from the existing pack. Default address 0x76; firmware and outdoor mounting to define. |

Project totals: **2 Pico 2 WH, 2 SEN0232, 2 Grove Wio-E5 and 1 Hammond enclosure to purchase (allocation TBD); 1 KIT0210 with its included solar panel/controller and 3 matched RS PRO cells; Station B powered directly by USB without a battery**. The gateway and mounting tape are shared. Acoustic membranes remain TBD pending validated acoustic documentation.

Gateway antenna selection checked **2026-11-02**: [MikroTik manual](https://manual.mikrotik.com/hardware/wap-lr8g-kit/) confirms an internal 2 dBi LoRa antenna is included but disconnected by default; connect its cable to RFIO with power off to use it. The manufacturer suggests internal use for distances below approximately 1 km; actual urban coverage must be tested. External antenna purchase is not mandatory. One [868 Omni kit](https://mikrotik.com/product/868_omni_antenna) is retained as the selected external coverage upgrade, replacing the Alfa antenna; GETIC lists it in stock on the retrieved page, subject to re-check before ordering.

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

### Station A: solar-powered

```text
10 W / 18 V solar panel (included in KIT0210)
        |
        v
DFRobot KIT0210 <----> 3 x matched RS PRO 18650 cells
        |
regulated 5 V output
        |
       1N5819
        |
        v
    Pico 2 VSYS
```

KIT0210 handles charging and solar/battery switchover. Its panel, controller, cables and PG7 glands are included. Use one M12 IP68 gland for the regulated 5 V cable entering the Hammond enclosure; do not purchase a second solar panel or controller.

### Station B: direct USB power

```text
Raspberry Pi 5 USB-C PSU (base output 5.1 V)
        |
USB-C female to micro-USB male adapter
        |
Pico 2 WH micro-USB port
        |
onboard USB Schottky diode -> VSYS -> onboard 3.3 V regulator
```

Station B has no battery, solar panel, charge controller or external isolation diode. Use the existing DFR0848 expansion board and retain the common sensor, GNSS and Wio-E5 connections. It operates while USB power is present and stops when USB is disconnected. Verify that the selected adapter activates the PSU's 5 V output; do not use a higher-voltage PD trigger. [Pico 2 W power documentation](https://datasheets.raspberrypi.com/picow/pico-2-w-datasheet.pdf)

### Pico and module power connections

```text
Station A: KIT0210 regulated 5 V -> 1N5819 -> Pico VSYS
Station B: USB PSU -> adapter -> Pico micro-USB (onboard diode to VSYS)
Both: Pico 3V3 -> SEN0232
Both: Wio-E5 and GNSS -> appropriate regulated rails per module requirements
Both: common ground between Pico, SEN0232, GNSS and Wio-E5
Station A: KIT0210 GND also joins common ground
```

On Station A, orient 1N5819 anode toward regulated 5 V and cathode (marked band) toward VSYS; insulate solder joints and exposed leads. Never feed external 5 V into Pico `3V3`. Never power the Pico directly from a raw solar panel or bare cells. KIT0210 handles charging and protection for Station A only.

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

### Station A: KIT0210

The KIT0210 uses three matched 18650 cells; these cells belong only to Station A.

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
- quantity: 3 for Station A, 3 total

The previously considered Jauch LR1865HB is not the preferred option because of its high unit cost.

### Station B

No battery is installed. There are no battery capacity, charge-current, charging-temperature or battery-autonomy requirements for Station B. Firmware battery reporting must distinguish Station A's battery from Station B's USB supply; do not report a USB/VSYS measurement as battery voltage on B.

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
- monitor battery voltage on Station A and report it with telemetry; Station B has no battery and must identify battery telemetry as unavailable without changing the common measurement and LoRaWAN architecture.

Station A’s included 10 W solar panel is intentionally oversized relative to the average node consumption so that it can:

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

For both stations:

- never connect an 18 V solar panel directly to the Pico or a lithium battery;
- use KIT0210 regulated 5 V through 1N5819 to VSYS on Station A, and the Pico micro-USB port on Station B; never feed external 5 V into `3V3`;
- retain common ground between Pico and all modules, including the KIT0210 on Station A;
- never charge lithium batteries outside their specified temperature range;
- protect electronics, batteries and charging connections from rain and condensation;
- do not assume an IP-rated enclosure automatically provides a valid acoustic path.

For Station A:

- use three identical matched new 18650 cells; never mix models, capacities, chemistries, ages or states of health;
- verify KIT0210 holder compatibility and respect both KIT0210 and cell temperature/current specifications;
- retain the KIT0210 solar controller; never bypass it;
- shade the battery from direct solar heating.

For Station B:

- use the Pico micro-USB input with the selected PSU and adapter;
- do not install a battery or charge controller;
- verify adapter compatibility and the 5 V supply before connection;
- protect the USB connection and modules against rain and condensation.

## Procurement notes

Primary sourcing is Farnell where practical.

Station A matched cells are sourced from RS; Station B requires only USB power, without a battery or battery manager.

Before ordering, re-check:

- current stock;
- battery mechanical compatibility;
- battery charge-current specification;
- connector compatibility;
- antenna inclusion;
- acoustic membrane availability.

Stock status and pricing change over time and must not be hard-coded into firmware or project logic.

Procurement update 2026-11-02: hookup wire and heat-shrink tubing are already available at the user’s home. Buy only one Hammond enclosure. Two Pi 5 PSU/adapter sets are provisionally allocated, pending quantity clarification; this is not a purchase record.

Station B power decision: remove DFR0559 and BAK battery from the active BOM; reserve their previous component IDs HW-017/HW-018. Keep the existing USB PSUs/adapters and one-Hammond purchase plan.
