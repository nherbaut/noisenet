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

| Function | Part | Supplier / reference | Qty. | Notes |
|---|---|---|---:|---|
| MCU | Raspberry Pi Pico 2 | Farnell 4531086 | 1 | Main controller |
| Sound-level sensor | DFRobot SEN0232 | Farnell 3517935 | 1 | Analog output, 30–130 dBA nominal range |
| LoRaWAN radio | Seeed Studio Grove Wio-E5, EU868 | Farnell 4007875 | 1 | UART/AT-command interface |
| Solar power system | DFRobot KIT0210, 10 W / 18 V | Farnell 4829811 | 1 | Solar panel, controller, cabling, outdoor accessories |
| Battery cells | RS PRO 18650, 3.6 V, 3500 mAh | RS 0206038 | 3 | Use three identical new cells; verify mechanical compatibility before ordering |
| Electronics enclosure | Hammond 1555F2F42GY, IP-rated polycarbonate | Farnell 1829810 | 1 | Light-coloured enclosure preferred outdoors |
| Power isolation diode | SS14 Schottky diode | Farnell 2675133 | 1 | Between external 5 V supply and Pico VSYS |
| Acoustic vent | Hydrophobic microphone-rated acoustic membrane | TBD | 1 | Must have documented acoustic insertion loss / frequency response |
| LoRa antenna | EU868 antenna | Included with Wio-E5 or compatible external antenna | 1 | Keep clear of enclosure shielding |

## Optional environmental sensor

The following sensor may be added later:

| Function | Part | Reference | Qty. | Notes |
|---|---|---|---:|---|
| PM sensor | DFRobot SEN0460 | Farnell 3974148 | 1 | I2C, PM1.0 / PM2.5 / PM10 |

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
- RS reference 0206038
- quantity: 3

The previously considered Jauch LR1865HB is not the preferred option because of its high unit cost.

## Outdoor enclosure

The electronics enclosure should be IP-rated and preferably light-coloured.

The SEN0232 cannot simply be sealed behind solid plastic. Sound must reach the microphone through a protected acoustic path.

Preferred arrangement:

```text
outside
   |
   v
rain shield
   |
hydrophobic acoustic membrane
   |
short acoustic cavity
   |
SEN0232 microphone
```

Requirements:

- microphone aperture should face downward or be protected by a rain hood;
- use a microphone-rated hydrophobic acoustic membrane;
- do not substitute a generic waterproof pressure vent unless its acoustic response is documented;
- calibrate the complete assembled node after the membrane, cavity, enclosure, and rain shield are installed;
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
