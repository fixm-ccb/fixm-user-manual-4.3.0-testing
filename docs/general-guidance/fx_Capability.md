# Encoding guidance for fx:Capability

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA3/EA251.png)

Go to [XML schema documentation](https://fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_FlightCapabilitiesType.html)

---

## `communication`

### `communicationCapabilityCode`

The property `communicationCapabilityCode` is used to exchange information about the capabilities of the flight in terms of voice communication, ACARS data communication and RCP (Required Communication Performance). 
If present, it shall consist of one or more of the following values, separated by a space character:

- Voice communication
  - `H`: HF RTF
  - `M1`: ATC RTF SATCOM (INMARSAT)
  - `M2`: ATC RTF (MTSAT)
  - `M3`: ATC RTF (Iridium)
  - `U`: UHF RTF
  - `V`: VHF RTF
  - `Y`: VHF with 8.33 kHz channel spacing capability
- ACARS data communication
  - `E1`: FMC Waypoint Reporting (WPR) ACARS
  - `E2`: Digital Flight Information System (D-FIS) ACARS
  - `E3`: Pre-Departure Clearance (PDC) ACARS
- RCP (categories specified in ICAO Doc. 9869, chapter 4.4.3)
  - `P1`: CPDLC RCP 400 
  - `P2`: CPDLC RCP 240 
  - `P3`: SATVOICE RCP 400
  - *Values `P4` to `P9` are reserved for future RCP capabilities.*

### `datalinkCommunicationCapabilityCode` 

The property `datalinkCommunicationCapabilityCode` is used to exchange information about the capabilities of the flight 
in terms of CPDLC. It shall consist of one or more of the following values, separated by a space character:

- ATN CPDLC
  - `J1`: CPDLC ATN Via VHF Data Link (VDL) Mode 2
- FANS 1/A CPDLC
  - `J2`: CPDLC FANS 1/A Via HF Data Link (HFDL) 
  - `J3`: CPDLC FANS 1/A Via VDL Mode 0/a (ACARS)
  - `J4`: CPDLC FANS 1/A Via VHF Data Link, Mode 2 (VDL Mode 2)
  - `J5`: CPDLC FANS 1/A Via SATCOM (INMARSAT)
  - `J6`: CPDLC FANS 1/A Via SATCOM (MTSAT)
  - `J7`: CPDLC FANS 1/A Via SATCOM (Iridium) 

### `otherCommunicationCapabilities` / `otherDatalinkCapabilities`

The properties `otherCommunicationCapabilities` and `otherDatalinkCapabilities` can be used to exchange 
communication or datalink capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes.


### `selectiveCallingCode` 

The `SELCAL` code is a four-character code acting as a paging system for an ATS unit to establish voice communications with the pilot of an aircraft. 

`FIXM Core 4.3.0` provides support for the exchange of `SELCAL` codes as required by the FF-ICE/R1 Implementation Guidance Manual, i.e. consistent with the definitions 
in Annex 10, Volume 3, Part II, chapter 3. `FIXM Core 4.3.0` takes into account Amendment 91 to ICAO Annex 10 Volume III, approved by the ICAO Council on 6 November 2020, which has updated the SELCAL standard and added letters from T to Z and the numbers 1 to 9.

Examples of encoding:

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:selectiveCallingCode>ADBF</fx:selectiveCallingCode>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:selectiveCallingCode>GQE8</fx:selectiveCallingCode>
```

#### Compatibility with FIXM Core 4.2.0

FIXM Core 4.2.0 was released before the publication of Amendment 91 to ICAO Annex 10 Volume III and therefore does not natively support the new letters from T to Z and the numbers 1 to 9 added to the SELCAL standard. However, forward and backward compatibility between 4.2.0 and 4.3.0 is ensured:

*`FIXM Core 4.2.0` -> `FIXM Core 4.3.0`*
- A `SELCAL Code` that can be encoded in `FIXM Core 4.2.0` can be natively encoded in `FIXM Core 4.3.0`, using property `fx:selectiveCallingCode`


*`FIXM Core 4.3.0` -> `FIXM Core 4.2.0`*
- A `SELCAL Code` that can be encoded in `FIXM Core 4.3.0` and which does not include any letter from T to Z and/or numbers from 1 to 9 can be natively encoded in `FIXM Core 4.2.0`, using property `fx:selectiveCallingCode`
- A `SELCAL Code` that can be encoded in `FIXM Core 4.3.0`and  which includes at least one letter from T to Z and/or a number from 1 to 9 can be encoded in `FIXM Core 4.2.0` using this workaround involving property `fx:otherCommunicationCapabilities`
```xml
<!-- FF-ICE Flight Plan filed in old 4.2.0 format...-->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<!-- xmlns:fx="http://www.fixm.aero/flight/4.2" -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<fx:capabilities>
  <fx:communication>
   <fx:otherCommunicationCapabilities>selectiveCallingCode=ABC3</...>  
<!-- USE ";" as separator if the property fx:otherCommunicationCapabilities contains additional information -->
```

---

## `navigation`

### `navigationCapabilityCode`

The property `navigationCapabilityCode` is used to exchange information about the navigation capabilities of the flight. 
If present, it shall consist of one or more of the following values, separated by a space character:

- Navigation capabilities listed in ICAO Doc 9965 Vol II chapter B-2.10.3
  - `F`: Automatic Direction Finder (ADF)
  - `O`: VHF omnidirectional radio range (VOR)
  - `T`: UHF tactical air navigation aid (TACAN)
  - `D`: Distance Measuring Equipment (DME)
  - `G`: Global Navigation Satellite System (GNSS)
  - `A`: Indicate presence of Ground Based Augmentation System (GBAS)
  - `I`: Inertial Navigation (INS)
  - `W`: Reduced Vertical Separation Minimum (RVSM)
- Addional navigation capabilities from PANS-ATM Item 10a
  - `C`: LORAN C
  - `X`: MNPS approved
- Approach capabilities listed in ICAO Doc 9965 Vol II chapter B-2.10.4
  - `L`: Instrument Landing System (ILS)
  - `K`: Microwave Landing System (MLS)
  - `B`: Localizer Performance with Vertical Guidance (LPV)

### `otherNavigationCapabilities`

The properties `otherNavigationCapabilities` can be used to exchange 
navigation capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes.


### `performanceBasedCode`

The property `performanceBasedCode` is used to exchange information about the PBN capabilities of the flight. 
If present, it shall consist of one or more of the following values, separated by a space character:

- PBN capabilities listed in PANS-ATM Appendix 3, item 18 PBN/
  - `A1`: RNAV 10 (RNP 10)
  - `B1`: RNAV 5 all permitted sensors
  - `B2`: RNAV 5 GNSS
  - `B3`: RNAV 5 DME/DME
  - `B4`: RNAV 5 VOR/DME
  - `B5`: RNAV 5 INS or IRS
  - `B6`: RNAV 5 LORANC
  - `C1`: RNAV 2 all permitted sensors
  - `C2`: RNAV 2 GNSS
  - `C3`: RNAV 2 DME/DME
  - `C4`: RNAV 2 DME/DME/IRU
  - `D1`: RNAV 1 all permitted sensors
  - `D2`: RNAV 1 GNSS
  - `D3`: RNAV 1 DME/DME
  - `D4`: RNAV 1 DME/DME/IRU
  - `L1`: RNP 4
  - `O1`: Basic RNP 1 all permitted sensors
  - `O2`: Basic RNP 1 GNSS
  - `O3`: Basic RNP 1 DME/DME
  - `O4`: Basic RNP 1 DME/DME/IRU
  - `S1`: RNP APCH
  - `S2`: RNP APCH with BAR-VNAV
  - `T1`: RNP AR APCH with RF (special authorization required)
  - `T2`: RNP AR APCH without RF (special authorization required)

Each PBN capability depends on certain navigational capabilities. When a PBN capability
is based on a navigational capability, that navigational capability must also be present.
The following table details the rules that shall be respected to ensure consistency between 
the content of `performanceBasedCode` and `navigationCapabilityCode` / `standardCapabilities`.

|`performanceBasedCode`|`navigationCapabilityCode` & `standardCapabilities`|
|:-|:-|
| `B1` | `G` and `D` and `I` and (`O` or `STANDARD`) |
| `B2` | `G` |
| `B3` | `D` |
| `B4` | `D` and (`O` or `STANDARD`) |
| `B5` | `I` |
| `B6` | `C` |
| `C1` | `G` and `D` and `I` |
| `C2` | `G` |
| `C3` | `D` | 
| `C4` | `D` and `I`  |
| `D1` | `G` and `D` and `I` |
| `O1` | `G` and `D` and `I` |
| `O2` | `G` |
| `O3` | `D` |
| `O4` | `D` and `I` |
| `S1` | `G` |
| `S2` | `G` |
| `T1` | `G` |
| `T2` | `G` |

If any of the navigation capabilities (`STANDARD`, `O`, `D`, `I`, `G`, `C`) are changed then 
the dependencies should be re-checked.

### `requiredRunwayVisualRange`

The property `requiredRunwayVisualRange` can be used to exchange the minimum RVR value required by the flight in order to execute an
approach to land at the destination aerodrome in accordance with the applicable ATM configuration.

The `requiredRunwayVisualRange` is expressed as a [Distance].

### `standardCapabilities`

The property `standardCapabilities` can be used to indicate standard equipment and capabilities. The property, if exchanged, shall take the value `STANDARD`.

Standard equipment is considered to be `V` (VHF RTF), `O` (VOR) and `L` (ILS), unless another combination is prescribed by the appropriate ATS authority.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:standardCapabilities>STANDARD</fx:standardCapabilities>
    <!-- ... -->
```

---

## `surveillance`

### `otherSurveillanceCapabilities`

The properties `otherSurveillanceCapabilities` can be used to exchange 
surveillance capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes.

### `surveillanceCapabilityCode`

The property `surveillanceCapabilityCode` is used to exchange information about the Transponder, ADS-B and ADS-C capabilities of the flight. 
It shall consist of one or more of the following values, separated by a space character:

- Transponder capabilities
  - `A`: Mode A Transponder (4 digits-4,096 codes)
  - `C`: Mode A Transponder (4 digits-4,096 codes) with Mode C altitude
  - `S`: Mode S Transponder with aircraft identification and pressure-altitude
  - `E`: Mode S Transponder with aircraft identification, pressure-altitude, and extended squitter capability (ADS-B)
  - `H`: Mode S Transponder with aircraft identification, pressure-altitude, and enhanced surveillance capability
  - `L`: Mode S Transponder with aircraft identification, pressure-altitude, extended squitter, and enhanced surveillance capability
  - `I`: Mode S Transponder with aircraft identification, but no pressure-altitude capability
  - `P`: Mode S Transponder with pressure-altitude, but no aircraft identification capability
  - `X`: Mode S Transponder with neither aircraft identification nor pressure-altitude capability
- ADS-B capabilities
  - `V1`: VDL Mode 4 With "Out" Capability 
  - `V2`: VDL Mode 4 With "Out" and "In" Capability
  - `B1`: 1090 MHz With "Out" Capability
  - `B2`: 1090 MHz With "Out" and "In" Capability
  - `U1`: Universal Access Transceiver (UAT) With "Out" Capability
  - `U2`: Universal Access Transceiver (UAT) With "Out" and "In" Capability
- ADS-C capabilities
  - `G1`: ADS-C with ATN capabilities
  - `D1`: ADS-C with FANS 1/A capabilities

---

## `survival`

### `carriedEltHexIdentifier`

The property `carriedEltHexIdentifier` is used to exchange the identifier(s) of the Emergency Locator Transmitter(s) (Distress Tracking) on board the aircraft. 
An ELT DT identifier consists of 15 or 23 hexadecimal characters. When there is more than one ELT DT per aircraft, the identifiers shall be seperated by a space character.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:carriedEltHexIdentifier>1B71E26D012FDFF</fx:carriedEltHexIdentifier>
      <!-- ... -->
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:carriedEltHexIdentifier>1B71E26D012FDFF AEF4F4F0BAD40F0F0F19580</fx:carriedEltHexIdentifier>
      <!-- ... -->
```

### `dinghyInformation`

The property `dinghyInformation` is used to exchange information about the dinghies on board the aircraft. This `dinghyInformation` consists of the following fields:
- `colour`: used for indicating the colour of the dinghies. The AIRM provides a [list of colour codes](https://airm.aero/developers/advanced-search/1.1.0/CodeColourType?model=LogicalModel) that should be used preferably when encoding the colour of the dinghies.
- `covered`: put the value `COVERED` in this field if the dinghies are covered. If the dinghies are not covered, the field `covered` shall be omitted.
- `number`: used for indicating the number of dinghies carried, expressed as a positive integer.
- `totalCapacity`: used for indicating the number of persons that the dinghies on board the aircraft can altogether receive.

> Example - values taken from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:dinghyInformation>
        <fx:colour>YELLOW</fx:colour>
        <fx:covered>COVERED</fx:covered>
        <fx:number>11</fx:number>
        <fx:totalCapacity>330</fx:totalCapacity>
      </fx:dinghyInformation>
      <!-- ... -->
```

### `emergencyRadioCapabilityType`

The property `emergencyRadioCapabilityType` is used to exchange information about the types of emergency radios carried on board the aircraft.
It shall consist of one or more of the following values, separated by a space character:
- `EMERGENCY_LOCATOR_TRANSMITTER`: Emergency locator transmitter (ELT) is available.
- `ULTRA_HIGH_FREQUENCY`: UHF on frequency 243.0 MHz is available.
- `VERY_HIGH_FREQUENCY`: VHF on frequency 121.5 MHz is available.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:emergencyRadioCapabilityType>EMERGENCY_LOCATOR_TRANSMITTER ULTRA_HIGH_FREQUENCY VERY_HIGH_FREQUENCY</fx:emergencyRadioCapabilityType>
      <!-- ... -->
```

### `lifeJacketType`

The property `lifeJacketType` is used to exchange information about the types of life jackets available on board the aircraft.
It shall consist of one or more of the following values, separated by a space character:
- `FLUORESCENCE`: Life jackets are equipped with fluorescence.
- `LIGHTS`: Life jackets are equipped with lights.
- `ULTRA_HIGH_FREQUENCY`: UHF on frequency 243.0 MHz is available.
- `VERY_HIGH_FREQUENCY`: VHF on frequency 121.5 MHz is available.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:lifeJacketType>LIGHTS FLUORESCENCE</fx:lifeJacketType>
      <!-- ... -->
```

### `survivalEquipmentType` / `survivalEquipmentRemarks`

The property `survivalEquipmentType` is used to exchange information about the types of survival capabilities on board the aircraft.
It shall consist of one or more of the following values, separated by a space character:
- `DESERT`: Desert survival equipment is carried.
- `JUNGLE`: Jungle survival equipment is carried.
- `MARITIME`: Maritime survival equipment is carried.
- `POLAR`: Polar survival equipment is carried.

The field `survivalEquipmentRemarks` can be used to provide clarifying remarks and other survival equipment carried that is not specified above.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:survivalEquipmentType>MARITIME</fx:survivalEquipmentType>
      <!-- ... -->
```

[Distance]: //general-guidance/fb_Measures
