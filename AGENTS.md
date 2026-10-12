# AGENTS.md

## Project

NoiseNet is an outdoor environmental sensing node intended to measure urban noise and transmit compact measurements over LoRaWAN.

The project contains exactly two complete sensing stations:

- **Station A:** solar-powered, using one DFRobot KIT0210 and three matched RS PRO 18650 cells.
- **Station B:** battery-only, using one DFRobot DFR0559 and one BAK Technology 1S 3.7 V battery, rechargeable through USB. No solar panel is fitted to Station B.

Both stations retain the Raspberry Pi Pico 2, DFRobot SEN0232, Grove Wio-E5 EU868, DFR0848 expansion board and Hammond outdoor enclosure. Common sensing, LoRaWAN, enclosure and firmware decisions remain unchanged.

Station A charges during daylight and continues on battery when solar power is unavailable. Station B operates from its battery and can continue measuring while USB charging power is connected.

## Baseline BOM

Build quantity: **one solar station (A) and one USB-rechargeable battery-only station (B)**. Station columns describe installed requirements. Total quantities include shared consumables and supplier packs; surplus items are spares, not additional stations.

| Function | Part | Supplier / reference | Solar station qty | Battery-only station qty | Total qty | Product URL | Notes |
|---|---|---|---:|---:|---:|---|---|
| MCU | Raspberry Pi Pico 2 | Farnell 4531086 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/raspberry-pi/raspberry-pi-pico-2/carte-mcu-rpi-pico-2-520ko-150mhz/dp/4531086) | Main controller |
| Pico IO expansion | DFRobot DFR0848 Gravity expansion board for Raspberry Pi Pico / Pico 2 | Farnell 4308193 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/dfr0848/carte-d-expansion-gravit-carte/dp/4308193) | Simplifies sensor and module connections; verify Pico pin headers, connector compatibility, enclosure fit, and power routing before assembly |
| Sound-level sensor | DFRobot SEN0232 | Farnell 3517935 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/dfrobot/sen0232/sonom-tre-analogique-arduino/dp/3517935) | Analog output, 30–130 dBA nominal range |
| LoRaWAN radio | Seeed Studio Grove Wio-E5, EU868 | Farnell 4007875 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/seeed-studio/113020091/module-lora-e5-carte-arduino-pi/dp/4007875) | UART/AT-command interface |
| Solar power system | DFRobot KIT0210, 10 W / 18 V | Farnell 4829811 | 1 | 0 | 1 | [Farnell product page](https://fr.farnell.com/dfrobot/kit0210/solar-power-bank-kit-12v-5v-1a/dp/4829811) | Station A only; KIT0210 includes its 10 W / 18 V panel, controller, cables and PG7 glands. No separate panel or controller. |
| Battery cells | RS PRO 18650, 3.6 V, 3500 mAh | RS 0206038 | 3 | 0 | 3 | [RS product page](https://fr.rs-online.com/web/p/piles-rechargeables-taille-speciale/0206038) | Station A only; three identical new matched cells; verify KIT0210 holder fit and cell charging specifications. |
| Electronics enclosure | Hammond 1555F2F42GY, IP-rated polycarbonate | Farnell 1829810 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/en-FR/hammond/1555f2f42gy/box-flanged-pc-ip67/dp/1829810) | Light-coloured enclosure preferred outdoors |
| PCB/module mounting | 3M VHB 5952 double-sided acrylic foam tape | Farnell 3935787 | Shared | Shared | 1 roll | [Farnell product page](https://fr.farnell.com/3m/5952-black-3m-x-19mm/ruban-double-face-3m-x-19mm-noir/dp/3935787) | Shared project consumable; 19 mm wide, approximately 1.1 mm thick; small strips for direct mounting without an internal plate or base drilling. |
| Power isolation diode | SS14 Schottky diode | Farnell 2675133 | 1 | 1 | 2 | [Farnell product page](https://fr.farnell.com/multicomp-pro/ss14/redresseur-schottky-1a-40v-do/dp/2675133) | Between external 5 V supply and Pico VSYS |
| Acoustic vent | Hydrophobic microphone-rated acoustic membrane | TBD | 1 | 1 | 2 | TBD | Must have documented acoustic insertion loss / frequency response |
| LoRa antenna | EU868 antenna | Included with Wio-E5 or compatible external antenna | 1 | 1 | 2 | TBD | Keep clear of enclosure shielding |
| Cable glands | HellermannTyton NGM12-GY, M12, light grey, IP68 | Farnell 2499293 | 1 | 0 | 1 pack of 10 | [Farnell product page](https://fr.farnell.com/hellermanntyton/ngm12-gy/presse-etoupe-nylon-6-6-3mm-6/dp/2499293) | One M12 IP68 gland for Station A regulated 5 V cable entering the Hammond enclosure; nine spare glands. Cable diameter 3–6.5 mm; verify fit and mounting accessories. KIT0210 PG7 glands are already included; additional antenna or USB cable entries only if required by final routing. |
| Shared LoRaWAN gateway | MikroTik wAP LR8G kit, 868 MHz | GETIC / RBwAPR-2nD&R11e-LR8G | Shared | Shared | 1 | [GETIC product page](https://www.getic.fr/product/mikrotik-wap-lr8g-kit) | Shared infrastructure for both stations; [manufacturer specifications](https://mikrotik.com/product/wap_lr8g_kit); included 24 V 0.8 A power adapter and PoE injector; provide dedicated power and Ethernet/Wi-Fi Internet access; verify coverage and configure the LoRaWAN server |
| Grove connection cable | Seeed Studio 110990028, Grove 4-pin to female jumpers | Farnell 3932132 | 1 | 1 | 1 pack of 5 | [Farnell product page](https://fr.farnell.com/en-FR/seeed-studio/110990028/f-jumper-conversion-cable-4-pin/dp/3932132) | One cable per station for Wio-E5 and three spares; female jumpers fit 2.54 mm male headers; verify available headers and UART/power pinout |
| USB-rechargeable power manager | DFRobot Solar Power Manager 5 V, DFR0559 | Farnell France 3769962 | 0 | 1 | 1 | [Farnell product page](https://fr.farnell.com/dfrobot/dfr0559/module-de-gestion-de-l-nergie/dp/3769962) | Station B only; USB 5 V charging; 1S 3.7 V battery; regulated 5 V / 1 A; maximum charging current 900 mA; solar input unused. |
| Battery-only station battery | BAK Technology 18650CA-1S-3J, 3.7 V, 2250 mAh | Farnell France 2401852 | 0 | 1 | 1 | [Farnell product page](https://fr.farnell.com/bak-technology/18650ca-1s-3j/batt-rechargeable-li-ion-3-7v/dp/2401852) | Station B only; one 1S battery, 4.2 V charge voltage; connector type unverified; use BAT IN terminal fallback if needed. |
| Pico headers | 2 × 20-pin male headers, 2.54 mm pitch, per Pico | TBD | 1 set | 1 set | 2 sets | TBD | Required for the selected Pico and expansion board; verify fit and whether headers are supplied before ordering separately. |
| Common wiring | Power, ground and sensor hookup wires / connectors | TBD | 1 set | 1 set | 2 sets | TBD | Finalize lengths and connectors for each enclosure; retain common ground and insulated connections. |
| USB charger | Regulated 5 V USB charger | TBD | 0 | 1 | 1 | TBD | Station B DFR0559 USB input; size for concurrent charging and station load per manufacturer instructions. |
| USB charging cable | USB cable compatible with DFR0559 USB input | TBD | 0 | 1 | 1 | TBD | Provide protected charging access; preserve enclosure sealing in outdoor operation. |
| Battery connection accessories | Insulated battery lead adapter / terminal preparation as required | TBD | 0 | 1 set | 1 set | TBD | Verify battery connector and polarity; KF396 3.96 mm two-pole BAT IN terminal is the fallback. |

Project totals: **2 Pico 2, 2 SEN0232, 2 Grove Wio-E5 and 2 Hammond enclosures; 1 KIT0210 with its included solar panel/controller and 3 matched RS PRO cells; 1 DFR0559 and 1 BAK 18650CA-1S-3J battery**. The gateway and mounting tape are shared. Acoustic membranes remain TBD pending validated acoustic documentation.

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
       SS14
        |
        v
    Pico 2 VSYS
```

KIT0210 handles charging and solar/battery switchover. Its panel, controller, cables and PG7 glands are included. Use one M12 IP68 gland for the regulated 5 V cable entering the Hammond enclosure; do not purchase a second solar panel or controller.

### Station B: USB-rechargeable battery-only

```text
5 V USB charger
       |
       v
DFRobot DFR0559 <----> 1S 3.7 V BAK battery (4.2 V fully charged)
       |
regulated 5 V output
       |
      SS14
       |
       v
   Pico 2 VSYS
```

DFR0559 solar input is unused. Never connect the KIT0210 18 V panel to it: DFR0559 SOLAR IN is documented for 4.5–6 V, approximately 5 V panels, with a documented damage-limit warning of 6.5 V; stay within the 4.5–6 V operating range and never exceed that 6.5 V limit. [DFRobot specifications](https://wiki.dfrobot.com/dfr0559) and [input-voltage warning](https://wiki.dfrobot.com/dfr0559/docs/21586)

DFR0559 supports one 3.7 V Li-ion/LiPo cell, a 5 V USB input, a regulated 5 V / 1 A output and a maximum battery charging current of 900 mA. It provides JST-PH2.0 and KF396 3.96 mm two-pole battery connectors. Battery protections cover overcharge, over-discharge, over-current and reverse polarity; regulated-output protections cover short circuit, over-current and over-temperature. These protections do not remove the requirement to respect battery temperature limits. [DFRobot connection and protection documentation](https://wiki.dfrobot.com/dfr0559/docs/21586)

### Station B USB charging behavior

```text
During charging:
USB 5 V
   |
   v
DFR0559
   +----> charges 1S battery
   |
   +----> regulated 5 V -> SS14 -> Pico VSYS

Without USB:
1S battery
   |
   v
DFR0559 boost converter
   |
regulated 5 V
   |
  SS14
   |
   v
Pico VSYS
```

The application hardware and firmware must operate identically with USB charging power present or absent. Keep the regulated output enabled and verify uninterrupted station operation when connecting and disconnecting USB during power testing.

### Common Pico power connection

For both stations:

```text
power manager regulated 5 V -> SS14 -> Pico VSYS
Pico 3V3 -> SEN0232
Wio-E5 supply -> appropriate regulated rail per module requirements
power manager GND = Pico GND = SEN0232 GND = Wio-E5 GND
```

Orient SS14 to conduct from the power manager toward VSYS. Do not feed external 5 V into Pico `3V3`. Never power the Pico directly from a raw solar panel or bare Li-ion cells. Each station's power manager handles battery charging and protection.

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

### Station B: BAK 18650CA-1S-3J

Use one BAK Technology `18650CA-1S-3J`, Farnell France `2401852`, with the DFR0559. Specifications from the [Farnell product page](https://fr.farnell.com/bak-technology/18650ca-1s-3j/batt-rechargeable-li-ion-3-7v/dp/2401852) and [battery datasheet](https://www.farnell.com/datasheets/1806910.pdf):

| Parameter | Specification |
|---|---|
| Nominal voltage | 3.7 V (1S) |
| Capacity | 2250 mAh |
| Charge voltage | 4.2 V |
| Maximum charge current | 2200 mA |
| Maximum continuous discharge | 2200 mA |
| Charging temperature | 0 °C to 45 °C |
| Discharging temperature | -20 °C to 60 °C |
| Diameter | 18.5 mm |
| Length | 69 mm |
| Weight | Approximately 50 g |
| Termination | Connector; exact type unverified |

The DFR0559 maximum charging current of **900 mA is below the battery's 2200 mA maximum**, so charger and battery are compatible with respect to charge current. Verify wiring and polarity separately; do not assume the battery connector is JST-PH2.0.

If its connector is incompatible, use appropriately insulated leads with the DFR0559 KF396 3.96 mm two-pole terminal:

```text
battery + -> DFR0559 BAT IN +
battery - -> DFR0559 BAT IN -
```

Verify polarity before connection. Identify any additional battery lead from the battery documentation; do not connect an unidentified lead to BAT IN. Keep the battery mechanically protected and shaded, and charge only within 0–45 °C.

### Station B autonomy

```text
3.7 V × 2.25 Ah ≈ 8.3 Wh nominal
```

Actual autonomy depends primarily on continuous SEN0232 consumption, Pico consumption, the LoRa transmission interval, DFR0559 boost-converter efficiency, and battery temperature and aging. Do not specify a precise runtime until average station power consumption has been measured and conversion losses accounted for.

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
- use regulated 5 V through SS14 to Pico VSYS; never feed external 5 V into `3V3`;
- retain common ground between the power manager, Pico, SEN0232 and Wio-E5;
- never charge lithium batteries outside their specified temperature range;
- protect electronics, batteries and charging connections from rain and condensation;
- do not assume an IP-rated enclosure automatically provides a valid acoustic path.

For Station A:

- use three identical matched new 18650 cells; never mix models, capacities, chemistries, ages or states of health;
- verify KIT0210 holder compatibility and respect both KIT0210 and cell temperature/current specifications;
- retain the KIT0210 solar controller; never bypass it;
- shade the battery from direct solar heating.

For Station B:

- use only one 1S 3.7 V Li-ion/LiPo battery, with 4.2 V maximum normal charging voltage;
- use the DFR0559 charger and protection; never bypass its charger;
- do not charge the selected BAK battery below 0 °C or above 45 °C; discharge only within -20–60 °C;
- keep the battery mechanically protected and away from direct solar heating;
- verify battery polarity before connecting BAT IN;
- leave the DFR0559 solar input unused; never connect the KIT0210 18 V panel to it.

## Procurement notes

Primary sourcing is Farnell where practical.

Station A matched cells are sourced from RS; Station B uses the selected BAK battery from Farnell France.

Before ordering, re-check:

- current stock;
- battery mechanical compatibility;
- battery charge-current specification;
- connector compatibility;
- antenna inclusion;
- acoustic membrane availability.

Stock status and pricing change over time and must not be hard-coded into firmware or project logic.

New-part reference and availability check, **2026-10-11**: Farnell France lists [DFRobot DFR0559 / 3769962](https://fr.farnell.com/dfrobot/dfr0559/module-de-gestion-de-l-nergie/dp/3769962) and [BAK Technology 18650CA-1S-3J / 2401852](https://fr.farnell.com/bak-technology/18650ca-1s-3j/batt-rechargeable-li-ion-3-7v/dp/2401852) as in stock on the retrieved product pages. This is a dated procurement observation, not a permanent specification; re-check availability before ordering.

Retain battery `2401852` unless unavailable. Any necessary substitute must be a documented 1S 3.7 V Li-ion/LiPo battery with maximum charging current at least 900 mA; document the unavailability and substitution reason, then verify temperature limits, dimensions, connector and polarity.
