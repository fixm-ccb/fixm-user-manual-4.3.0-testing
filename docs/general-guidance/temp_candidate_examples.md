# Candidate examples and rules for section `Encoding guidance`

## fx:Aircraft

### `aircraftAddress`

> Additional example from Doc 10150 (LADR)

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:aircraftAddress>AC82EC</fx:aircraftAddress>
  <!-- ... -->
```

### `aircraftApproachCategory`

The `aircraftApproachCategory` is a classification of aircraft based on 1.3 times stall speed in landing configuration at maximum certified landing mass.

The `aircraftApproachCategory` shall be one of the following values:
  - `A` - less than 169 km/h (91 kt) indicated airspeed 
  - `B` - 169 km/h (91 kt) or more but less than 224 km/h 
  - `C` - 224 km/h (121 kt) or more but less than 261 km/h (141 kt) 
  - `D` - 261 km/h (141 kt) or more but less than 307 km/h (166 kt) 
  - `E` - 307 km/h (166 kt) or more but less than 391 km/h (211 kt) 
  - `H` - Helicopters

The value of the `aircraftApproachCategory` shall be consistent with the `aircraftType` content. For instance, the `aircraftApproachCategory` should not be set to `H` for e.g. an AIRBUS A380.

 
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:aircraftApproachCategory>C</fx:aircraftApproachCategory>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>A319</fx:icaoAircraftTypeDesignator>
   <!-- ... -->
```

### `aircraftType`

#### `icaoAircraftTypeDesignator`

> FF-ICE/R1 Manual B-2.5.1:

The `icaoAircraftTypeDesignator` shall be a valid two to four alphanumeric characters indicator, starting with a letter, per [ICAO Doc. 8643].

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a ROBIN DR-400 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>DR40</fx:icaoAircraftTypeDesignator>
    <!-- ... -->
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a COMAC ARJ-21-700 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>AJ27</fx:icaoAircraftTypeDesignator>
    <!-- ... -->
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a BOEING 787-10 Dreamliner -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>B78X</fx:icaoAircraftTypeDesignator>
    <!-- ... -->
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For an AIRBUS A-380-800 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>A388</fx:icaoAircraftTypeDesignator>
    <!-- ... -->
```

#### `otherAircraftType`

The property `otherAircraftType` can be used to exchange an aircraft type that has no ICAO Doc. 8643 identifier.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:aircraftType>
    <fx:otherAircraftType>PL-11 AIRTRUCK</fx:otherAircraftType>
    <!-- https://en.wikipedia.org/wiki/Bennett_Airtruck -->
```


### `coloursAndMarkings`

> From Doc 4444 Field Type 19:
> 
> (g) A/ followed by one or more of the following, separated by spaces:
> The colour of the aircraft.
> Significant markings (this may include the aircraft registration).

Property `coloursAndMarkings` can be used to exchange one or more of the following, separated by a space character: 
- The colour of the aircraft
- Significant markings (this may include the aircraft registration).

> Example from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:coloursAndMarkings>WHITE</fx:coloursAndMarkings>
  <!-- ... -->
```

:question: *Opportunity to introduce a codelist with predefined colours? (like [AIXM 5.1.1](https://aixm.aero/sites/default/files/imce/AIXM511HTML/AIXM/DataType_CodeColourBaseType.html)* :question: 

:question: *Is the space character an appropriate separator? Should another separator be used?* :question:

### `wakeTurbulence`

The `wakeTurbulence` category is a grouping of aircraft according to the effect of the rotating air mass created behind the wing tips.

The `wakeTurbulence` category shall be one of the following values:
  - `J` (SUPER) - for aircraft types specified as such in Doc 8643, Aircraft Type Designators
  - `H` (HEAVY) - for aircraft types of 136 000 kg or more, with the exception of aircraft types listed in Doc 8643 in the SUPER (J) category
  - `M` (MEDIUM) - for aircraft types less than 136 000 kg but more than 7 000 kg
  - `L` (LIGHT) - aircraft types of 7 000 kg or less

> FF-ICE/R1 Manual E-4:

The `wakeTurbulence` specified for the aircraft shall be consistent with the category associated with the `aircraftTypeDesignator` in [ICAO Doc. 8643].

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a ROBIN DR-400 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>DR40</fx:icaoAircraftTypeDesignator>
  </fx:aircraftType>
  <fx:wakeTurbulence>L</fx:wakeTurbulence>
</fx:aircraft>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a COMAC ARJ-21-700 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>AJ27</fx:icaoAircraftTypeDesignator>
  </fx:aircraftType>
  <fx:wakeTurbulence>M</fx:wakeTurbulence>
</fx:aircraft>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For a BOEING 787-10 Dreamliner -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>B78X</fx:icaoAircraftTypeDesignator>
  </fx:aircraftType>
  <fx:wakeTurbulence>H</fx:wakeTurbulence>
</fx:aircraft>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<!-- For an AIRBUS A-380-800 -->
<fx:aircraft>
  <fx:aircraftType>
    <fx:icaoAircraftTypeDesignator>A388</fx:icaoAircraftTypeDesignator>
  </fx:aircraftType>
  <fx:wakeTurbulence>J</fx:wakeTurbulence>
</fx:aircraft>
```

---

## fx:Arrival

### `actualTimeOfArrival`

> FF-ICE/R1 Manual 10.4.3.2 

An arrival time can be recorded by different automated or manual means which do not
always refer to the same event or location. Therefore, FIXM proposes different options 
to exchange the `actualTimeOfArrival`, in order to help system providers and operators select the 
one most applicable to their operations. 

Concretely, the `actualTimeOfArrival` is exchanged in FIXM using the following properties:
- property `time` captures the arrival time value, expressed as a [DateTimeUtc].
- properties `type` and `position` may be used optionally to provide details about the event and point on the arrival aerodrome to which the arrival time refers.
  - `type` shall be one of the following value: `WHEELS_ON`, `IN_BLOCKS`, `END_LANDING_ROLL`.
  - `position` shall capture the geographical position of that point, expressed as a [GeographicalPosition]

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:arrival>
  <fx:actualTimeOfArrival>
    <fx:time>2024-06-19T20:43:26Z</fx:time>
    <fx:type>WHEELS_ON</fx:type>
  </fx:actualTimeOfArrival>
</fx:arrival>
```


### `destinationAerodrome` / `arrivalAerodrome`

> FF-ICE/R1 Manual chapter 7.4.3

The `destinationAerodrome` is the aerodrome at which the flight is ***scheduled*** to arrive. The `arrivalAerodrome` is the aerodrome at which the flight has ***actually*** arrived. 
In normal circumstances, the `arrivalAerodrome` will be the same as the `destinationAerodrome`, but will be different in the case of a diversion.

The `destinationAerodrome` and `arrivalAerodrome` shall be both expressed in FIXM as a valid [AerodromeReference].

Example - flight scheduled to arrive at Brussels Airport (EBBR) that has actually landed at this airport. 

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:arrival>
  <fx:arrivalAerodrome>
    <fb:locationIndicator>EBBR</fb:locationIndicator>
  </fx:arrivalAerodrome>
  <fx:destinationAerodrome>
    <fb:locationIndicator>EBBR</fb:locationIndicator>
  </fx:destinationAerodrome>
</fx:arrival>
```

Example - flight scheduled to arrive at Brussels Airport (EBBR) that actually landed at Lille Airport (LFQQ) following a diversion.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:arrival>
  <fx:arrivalAerodrome>
    <fb:locationIndicator>LFQQ</fb:locationIndicator>
  </fx:arrivalAerodrome>
  <fx:destinationAerodrome>
    <fb:locationIndicator>EBBR</fb:locationIndicator>
  </fx:destinationAerodrome>
</fx:arrival>
```


### `destinationAerodromeAlternate`

A `destinationAerodromeAlternate` is an alternate aerodrome at which the aircraft would be able to land should it become either
impossible or inadvisable to land at the `destinationAerodrome`. Up to 2 `destinationAerodromeAlternate` may be specified for a flight.

> FF-ICE/R1 Manual appendix C : *Up to 2 alternate destination aerodromes may be specified*


Example - a flight scheduled to land at Düsseldorf Airport (EDDL) with Münster Osnabrück Airport (EDDG) identified as destination alternate.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:arrival>
  <fx:destinationAerodrome>
    <fb:locationIndicator>EDDL</fb:locationIndicator>
  </fx:destinationAerodrome>
  <fx:destinationAerodromeAlternate>
    <fb:locationIndicator>EDDG</fb:locationIndicator>
  </fx:destinationAerodromeAlternate>
```

### `reclearanceInFlight`

`TODO`

> ICAO Doc 4444 RIF: *The route details to the revised destination aerodrome, followed by the ICAO four-letter location indicator
> of the aerodrome. The revised route is subject to reclearance in flight.*
>
> Examples: RIF/DTA HEC KLAX
> 
> RIF/ESP G94 CLA YPPH


### `runwayDirection`

`TODO`

> FF-ICE/R1 Manual, chapter 10.4.3.2
> Note: It is recognized that departure and arrival runways in conjunction with associated
> SIDs and STARs may not be known with certainty prior to the flight’s departure.

---

## fx:Capability

### `communication`

#### `communicationCapabilityCode`

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

:warning: *The current FIXM 4.3.0 codelist has the definition **Reserved for RCP** for values P1, P2, P3. These definitions should be updated in the next version.* :warning: 


#### `datalinkCommunicationCapabilityCode` 

The property `datalinkCommunicationCapabilityCode` is used to exchange information about the capabilities of the flight 
in terms of CPDLC. It shall consist of zero or more of the following values, separated by a space character:

- ATN CPDLC
  - `J1`: CPDLC ATN Via VHF Data Link (VDL) Mode 2
- FANS 1/A CPDLC
  - `J2`: CPDLC FANS 1/A Via HF Data Link (HFDL) 
  - `J3`: CPDLC FANS 1/A Via VDL Mode 0/a (ACARS)
  - `J4`: CPDLC FANS 1/A Via VHF Data Link, Mode 2 (VDL Mode 2)
  - `J5`: CPDLC FANS 1/A Via SATCOM (INMARSAT)
  - `J6`: CPDLC FANS 1/A Via SATCOM (MTSAT)
  - `J7`: CPDLC FANS 1/A Via SATCOM (Iridium) 

#### `otherCommunicationCapabilities` / `otherDatalinkCapabilities`

> FF-ICE/R1 B-2.10.2 

The properties `otherCommunicationCapabilities` and `otherDatalinkCapabilities` can be used to exchange 
communication or datalink capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes but are required
in a flight plan.


### `navigation`

#### `navigationCapabilityCode`

The property `navigationCapabilityCode` is used to exchange information about the navigation capabilities of the flight. 
If present, it shall consist of one or more of the following values, separated by a space character:

- Navigation capabilities listed in ICAO Doc 9965 Vol II chapter B-2.10.3
  - `F`: Automatic Direction Finder (ADF)
  - `O`: VHF omnidirectional radio range (VOR)
  - `T`: UHF tactical air navigation aid (TACAN)
  - `D`: Distance Measuring Equipment (DME)
  - `G`: Global Navigation Satellite System (GNSS)
  - :warning: MISSING "SBAS" ??? How is this capability exchange in FIXM ??? :warning: 
  - `A`: Indicate presence of Ground Based Augmentation System (GBAS)
  - `I`: Inertial Navigation (INS)
  - :warning: MISSING VOR/DME ??? How is this capability exchanged in FIXM ??? :warning: 
  - :warning: MISSING DME/DME ??? How is this capability exchanged in FIXM ??? :warning:
  - :warning: MISSING DME/DME/Inertial Reference Unit (IRU) ??? How is this capability exchanged in FIXM ??? :warning:
  - `W`: Reduced Vertical Separation Minimum (RVSM)
- Addional navigation capabilities from PANS-ATM Item 10a
  - `C`: LORAN C
  - `X`: MNPS approved
- Approach capabilities listed in ICAO Doc 9965 Vol II chapter B-2.10.4
  - `L`: Instrument Landing System (ILS)
  - `K`: Microwave Landing System (MLS)
  - `B`: Localizer Performance with Vertical Guidance (LPV)
  - :warning: MISSING Ground-Based Augmentation Landing System (GBAS Landing System) ??? How is this capability exchanged in FIXM ??? Or does it duplicate perhaps code `A` above ??? :warning: 


#### `otherNavigationCapabilities`

The properties `otherNavigationCapabilities` can be used to exchange 
navigation capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes but are required
in a flight plan.


#### `performanceBasedCode`

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
- optional functional capabilities described in ICAO Doc. 9613 Vol. 1, Attachment A, section 5
  - :warning: MISSING Fixed radius paths including RF legs and Fixed Radius Turns - or possibly other combinations ??? How are these capabilities exchanged in FIXM ??? Using `otherNavigationCapabilities` ??? :warning: 
- identification of the type of Vertical Navigation required, as explained in ICAO Doc. 9613 Part A. section 1.1.4.2.
  - :warning: TODO :warning: 

> From FF-ICE/R1 Manual appendix E-2. Performance Based Navigation 

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

:warning: no consistency rule specified in the FF-ICE/R1 manual for codes `D2`, `D3`, `D4`, `L1`. Is this intentional or is it a gap? :warning: 


#### `requiredRunwayVisualRange`

> From FF-ICE/R1 Manual chapter B-2.39

The property `requiredRunwayVisualRange` can be used to exchange the minimum RVR value required by the flight in order to execute an
approach to land at the destination aerodrome in accordance with the applicable ATM configuration.

The `requiredRunwayVisualRange` is expressed as a [Distance].

### `standardCapabilities`

The property `standardCapabilities` can be used to indicate standard equipment and capabilities. The property, if exchanged, shall take the value `STANDARD`.

> From Doc 4444 Appendix 3 Field 10a) Note 1

Standard equipment is considered to be `V` (VHF RTF), `O` (VOR) and `L` (ILS), unless another combination is prescribed by the appropriate ATS authority.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:standardCapabilities>STANDARD</fx:standardCapabilities>
    <!-- ... -->
```


### `surveillance`

#### `otherSurveillanceCapabilities`

The properties `otherSurveillanceCapabilities` can be used to exchange 
surveillance capabilities that are not pre-defined. This is to allow for new capabilities or ANSP-
specific capabilities that have not been designated standard codes but are required
in a flight plan.

#### `surveillanceCapabilityCode`

The property `surveillanceCapabilityCode` is used to exchange information about the Transponder, ADS-B and ADS-C capabilities of the flight. 
It shall consist of zero or more of the following values, separated by a space character:

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
  - :warning: *The FF-ICE/R1 Manual Chapter B-2.10.14 b) ii) explains that it shall be possible to indicate the ABS-B capability "1090 MHz With "In" Capability". The definition of code `B2` in FIXM says "In" and "Out" capability altogether. It is assumed that the "In" capability always come together with the "Out" capability. TBC* :warning: 
  - `B1`: 1090 MHz With "Out" Capability
  - `B2`: 1090 MHz With "Out" and "In" Capability
  - `U1`: Universal Access Transceiver (UAT) With "Out" Capability
  - `U2`: Universal Access Transceiver (UAT) With "Out" and "In" Capability
  - :warning: *MISSING CODES for B-2.10.14 d) ??? See quote below. How are these capabilities exchanged in FIXM ??? Using `otherSurveillanceCapabilities`???* :warning: 

> FF-ICE/R1 Manual
> B-2.10.14 Expression of Surveillance Capability shall allow at a minimum indication of
> the following ADS-B capabilities ...
> 
> i. Airborne traffic situational awareness (AIRB)
> 
> ii. Own Visual Separation in Approach (VSA)
> 
> iii. Traffic Situational Awareness on the Surface (SURF)
> 
> iv. Traffic Situational Awareness with Alerts (TSAA)
> 
> v. CDTI (Cockpit Display of Traffic Information) Assisted Visual
> Separation (CAVS) RTCA DO-317B / EUROCAE ED-194A
> 
> vi. Flight Deck based Interval Management for Spacing (FIM-S)
> RTCA DO-361 / EUROCAE ED-236
> vii. Advanced Interval Management (A-IM) RTCA DO-361A /
> EUROCAE ED-236A
> 
> viii. Paired Approach (PA) RTCA DO-361A / EUROCAE ED-236A
> 
> ix. In trail Procedures (ITP) RTCA DO-317A / EUROCAE ED-194
> (including subsequent versions)

- ADS-C capabilities
  - `G1`: ADS-C with ATN capabilities
  - `D1`: ADS-C with FANS 1/A capabilities



> FF-ICE/R1 Manual
> B-2.10.14 Expression of Surveillance Capability shall allow at a minimum indication of
> the following ADS-B capabilities including the ability to indicate whether certified against:
> • EASA AMC20-24,
> • CASA CA020.18,
> • USA 14 CFR 91.227 / FAA AC 20-165 (all versions),
> • EASA CS-ACNS.D.ADSB, and/or
> • EASA CS-STAN 005 configuration 1.

:warning: *How can this be exchanged in FIXM ? Using `otherSurveillanceCapabilities`? Encoding guidance probably required for this.* :warning:

### `survival`

#### `carriedEltHexIdentifier`

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


#### `dinghyInformation`

The property `dinghyInformation` is used to exchange information about the dinghies on board the aircraft. This `dinghyInformation` consists of the following fields:
- `colour`: used for indicating the colour of the dinghies.
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

#### `emergencyRadioCapabilityType`

The property `emergencyRadioCapabilityType` is used to exchange information about the types of emergency radios carried on board the aircraft.
It shall consist of zero or more of the following values, separated by a space character:
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

#### `lifeJacketType`

The property `lifeJacketType` is used to exchange information about the types of life jackets available on board the aircraft.
It shall consist of zero or more of the following values, separated by a space character:
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

#### `survivalEquipmentType` / `survivalEquipmentRemarks`

The property `survivalEquipmentType` is used to exchange information about the types of survival capabilities on board the aircraft.
It shall consist of zero or more of the following values, separated by a space character:
- `DESERT`: Desert survival equipment is carried.
- `JUNGLE`: Jungle survival equipment is carried.
- `MARITIME`: Maritime survival equipment is carried.
- `POLAR`: Polar survival equipment is carried.

The field `survivalEquipmentRemarks`  can be used to provide clarifying remarks and other survival equipment carried that is not specified above.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:capabilities>
    <fx:survival>
      <fx:survivalEquipmentType>MARITIME</fx:survivalEquipmentType>
      <!-- ... -->
```

---

## Package fx:Departure

### `actualTimeOfDeparture`

A departure time can be recorded by different automated or manual means which do not
always refer to the same event or location. Therefore, FIXM proposes different options 
to exchange the `actualTimeOfDeparture`, in order to help system providers and operators select the 
one most applicable to their operations. 

Concretely, the `actualTimeOfDeparture` is exchanged in FIXM using the following properties:
- property `time` captures the departure time value, expressed as a [DateTimeUtc].
- properties `type` and `position` may be used optionally to provide details about the event and point on the departure aerodrome to which the departure time refers.
  - `type` shall be one of the following value: `WHEELS_OFF`, `OFF_BLOCKS`, `START_TAKEOFF_ROLL`.
  - `position` shall capture the geographical position of that point, expressed as a [GeographicalPosition]

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:departure>
  <fx:actualTimeOfDeparture>
    <fx:time>2024-06-19T20:47:32Z</fx:time>
    <fx:type>WHEELS_OFF</fx:type>
  </fx:actualTimeOfDeparture>
  <!-- ... -->
```

### `runwayDirection`

`TODO`

### `takeoffAlternateAerodrome`

A `takeoffAlternateAerodrome` is an alternate aerodrome at which an aircraft would be able to land should this become necessary
shortly after take-off and it is not possible to use the `departureAerodrome`. Up to 2 `takeoffAlternateAerodrome` may be
specified.

---

## fx:Emergency

### `lastContact`

#### `position`

> Example - values taken from Doc 10150 (LADR) 

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:emergency>
  <fx:lastContact>
    <fx:position>
      <fx:altitude uom="FT" source="BAROMETRIC">35000</fx:altitude>
      <fx:groundSpeed uom="KT">350</fx:groundSpeed>
      <fx:heading uom="DEG" zeroBearingType="TRUE_NORTH">90</fx:heading>
      <fx:position>
        <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>45.50027778 -73.5525</fb:pos>
        </fb:position>
      </fx:position>
      <fx:timeAtPosition>2017-12-07T00:00:00Z</fx:timeAtPosition>
    </fx:position>
  </fx:lastContact>
</fx:emergency>
```


## fx:EnRoute

### `alternateAerodrome`

An en-route `alternateAerodrome` is an alternate aerodrome at which an aircraft would be able to land in the event that a diversion
becomes necessary while en route. Up to 20 en-route `alternateAerodrome`  may be specified.

### `boundaryCrossingCoordination`

`TODO`

### `currentModeACode`

The propoerty `currentModeACode` is used to exchange the SSR code assigned to the aircraft by ATS and
transmitted in Mode A.

> Example from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:enRoute>
  <fx:currentModeACode>5100</fx:currentModeACode>
  <!-- [...] -->
```

---

## fx:Flight

### `flightConstraint`

`TODO`

### `flightIdentification`

#### `iataFlightDesignator`

FIXM strives to facilitate interoperability between the ATM and airline domains by including the ability, where necessary, to add the IATA
representation of relevant information. In particular, property `flightIdentification` has a field `iataFlightDesignator` that can be used to 
exchange the commercial flight identifier. 

If exchanged, property `iataFlightDesignator` shall consist of: 
- the `iataOperatorCode`: the IATA identifier for the operator of the flight. The `iataOperatorCode` shall be valid code listed in IATA's [Airline Coding Directory].
- the `flightNumber`: Up to four-digit commercial flight number.
- optionally, the `operationalSuffix`: One character suffix used to further identify a flight. 


```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->    
<fx:flight>
  <fx:flightIdentification>
    <fx:iataFlightDesignator>			
      <fx:flightNumber>12</fx:flightNumber>
      <fx:iataOperatorCode>UA</fx:iataOperatorCode>
    </fx:iataFlightDesignator>
    <!-- [...] -->
```

### `flightPlanOriginator`

`TODO`

### `flightPlanSubmitter`

`TODO`

### `flightRulesCategory`

The property `flightRulesCategory` is used to exchange the category of flight rules with which the pilot intends to comply.
It shall be one of the following values:
- `I`: Intention to operate the entire flight under the IFR;
- `V`: Intention to operate the entire flight under the VFR;
- `Y`: Intention to operate initially under the IFR, followed by one or more subsequent changes of flight rules;
- `Z`: Intention to operate initially under the VFR, followed by one or more subsequent changes of flight rules.

If the value `Y` or `Z` is used, the point or points at which a [flight rules change] is planned shall be described in the `routeTrajectoryGroup`. 

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:flightRulesCategory>I</fx:flightRulesCategory>
```

### `flightType`

The property `flightType` is used to exchange the indication of the type of carried out aircraft operation. 
It shall be one of the following values:
- `S`: Scheduled Air Transport
- `N`: Non-Scheduled Air Transport
- `G`: General Aviation
- `M`: Military
- `X`: Other

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:flightType>S</fx:flightType>
```

### `operator`

`TODO`

### `radioCommunicationFailure`

`TODO`

### `remarks`

The property `remarks` is used to exchange any other plain-language remarks when required by the appropriate ATS authority or deemed necessary, by the pilot-in-command for the provision of air traffic services. 
This may include, for instance, other reasons for special handling by ATS not covered by property `specialHandling`.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:remarks>NO POSITION REPORT SINCE DEP PLUS 2 MINUTES</fx:remarks>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:remarks>CHARTER</fx:remarks>
```

### `routeTrajectoryGroup`

`TODO`

### `specialHandling`

The property `specialHandling` is used to exchange to the reason for special handling of a flight by ATS. 
If present, it shall consist of one or more of the following values, separated by a space character:
- `ALTRV`: for a flight operated in accordance with an altitude reservation;
- `ATFMX`: for a flight approved for exemption from ATFM measures by the appropriate ATS authority;
- `FFR`: fire-fighting;
- `FLTCK`: flight check for calibration of navaids;
- `HAZMAT`: for a flight carrying hazardous material;
- `HEAD`: a flight with Head of State status;
- `HOSP`: for a medical flight declared by medical authorities;
- `HUM`: for a flight operating on a humanitarian mission;
- `MARSA`: for a flight for which a military entity assumes responsibility for separation of military aircraft;
- `MEDEVAC`: for a life critical medical emergency evacuation;
- `NONRVSM`: for a non-RVSM capable flight intending to operate in RVSM airspace;
- `SAR`: for a flight engaged in a search and rescue mission;
- `STATE`: for a flight engaged in military, customs or police services.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:specialHandling>MEDEVAC</fx:specialHandling>
```

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:specialHandling>HEAD MARSA</fx:specialHandling>
```

### `supplementaryInformation`

In FIXM, the property `supplementaryInformation` consists of the following fields:
- `fuelEndurance`: This is the estimated maximum length of time the aircraft can spend in the cruise phase of flight, determined by the amount of fuel at takeoff. The fuel endurance shall be expressed as hours and minutes of flying time. The encoding of a `fuelEndurance` shall therefore always start with `P0Y0M0DT`.

> Encoding Rules: FF-ICE/R1 Manual B-2.33: *fuel endurance expressed as hours and minutes of flying time.*

- `personsOnBoard`: This is the total number of persons (passengers and crew) on board the aircraft.
- `pilotInCommand`: This is the pilot designated by the operator, or in the case of general aviation, the owner, as being in command and charged with the safe conduct of a flight.

> Example from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:supplementaryInformation>
  <fx:fuelEndurance>P0Y0M0DT3H45M0S</fx:fuelEndurance>
  <fx:personsOnBoard>300</fx:personsOnBoard>
  <fx:pilotInCommand>
    <fb:name>DENKE</fb:name>
  </fx:pilotInCommand>
</fx:supplementaryInformation>
```

Note: The `supplementaryInformation` does not capture the complete set of elements described in ICAO Doc 4444 ITEM 19 "Supplementary Information"; it only contains those elements that could not be modeled more logically in other FIXM structures. 

---


---

# Candidate examples and rules for `ffice:FFiceMessage`

## filingStatus

The property `filingStatus` is used in an `FficeMessage` of `type`=`FILING_STATUS` to indicate the status of the submitted flight with respect to the eASP. 
It consists of the following properties:
- as a minimum, property `value` is used to exchange the value of the filing status. It shall be one the following values:
  - `ACCEPTABLE` - Indicates the the eFPL, and in particular the desired route/trajectory, is acceptable.
  - `NOT_ACCEPTABLE` - Indicates that the eFPL, typically the desired route/trajectory, does not comply with operational requirements.
  - `PENDING` - Indicates that the flight plan has not yet been evaluated. This might happen when the eFPL is receivedby the eASP at a time which is in advance of its processing horizon for the flight, leading to 
     a deferral of the eFPL evaluation.
- property `trajectoryPurpose` can be used to provide the eASP's intended purpose in providing an Agreed R/T in a Filing Status. Property `trajectoryPurpose` may be used only if the Filing Status `value` is `ACCEPTABLE`.
- property `explanation` is used to detail the inconsistencies with the ATM configuration and/or with restrictions that have led to the filing status `value` being set to `NOT_ACCEPTABLE`. Property `explanation` shall be exchanged if and only if the Filing Status `value` is `NOT_ACCEPTABLE`.
- property `expectedEvaluationTime` is used to exchange the time at which the eASP expects to perform its first operational evaluation of the flight plan. Property `expectedEvaluationTime` shall be exchanged if and only if the Filing Status `value` is `PENDING`.
- property `originator` is used to identify the originator of the Filing Status, to be provided when forwarding the Filing Status back to the originator of a forwarding request.

```xml
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:filingStatus>
  <ffice:value>ACCEPTABLE</ffice:value>
</ffice:filingStatus>
```

```xml
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:filingStatus>
  <ffice:expectedEvaluationTime>2024-12-25T00:00:00Z</ffice:expectedEvaluationTime>
  <ffice:value>PENDING</ffice:value>
</ffice:filingStatus>
```

Note: when a Filing Status value is `NOT_ACCEPTABLE`, the content of the property `explanation` may commonly capture the errors generated by the flight plan processing system that has evaluated the eFPL. These error messages may vary accross systems. Here are local/regional examples of possible content for property `explanation`:
- In Europe, the possible errors and warnings are documented in the EUROCONTROL IPFS Users Manual. Examples:   
   - `PROF323: TRAJECTORY INFO ERROR (MORE THAN ONE TOD)`
   - `PROF323: TRAJECTORY INFO ERROR (LAST ELEMENT DOES NOT CONTAIN THE DESTINATION AERODROME)`
   - `EFPM335: INCONSISTENT DATA (<Aircraft Type> WAS SUBMITTED AS A NON_ICAO AIRCRAFT TYPE DESIGNATOR)`
   - `EFPM324: ACTIVE FPL WITH SAME GUFI EXISTS: (ARCID) (ADEP) (ADES) (EOBT)`
   - `EFPM402: CLOSED FPL WITH SAME GUFI EXISTS: (ARCID) (ADEP) (ADES) (EOBT)`
- Other examples: ...

## flight

The property `flight` is captures the information about the flight associated with the `FficeMessage`. The expected content will vary depending on the `type` of `FficeMessage`.
The information captured in property `flight` shall conform to the general encoding guidance.

## informationRequest

The property `informationRequest` is used in an `FficeMessage` of `type`=`FLIGHT_DATA_REQUEST` in order to indicate what information about the flight is being requested. 

The property `informationRequest` provides a choice between:
- a predefined `type` of request, being one of the following values:
    - `FLIGHT_PLAN`, to request the latest submitted flight plan;
    - `FLIGHT_STATUS`, to request the latest status (Planning or Filing) from an eASP;
    - `SUPPLEMENTARY_FLIGHT_PLAN`, to request the latest submitted search and rescue information;
- an `other` custom type of request established by the flight data request service.

```xml
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:informationRequest>
  <ffice:type>FLIGHT_PLAN</ffice:type>
</ffice:informationRequest>
```

```xml
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:informationRequest>
  <ffice:other>PRELIMINARY_FLIGHT_PLAN</ffice:other>
</ffice:informationRequest>
```

## operatorFlightPlanVersion

The negotiation process introducd by FF-ICE can give rise to a significant number of modifications to the flight plan, performed over a period of time.
In order to assist in data synchronisation and in providing a reference for feedback, the operator is required to provide an 
indication of the flight plan revision, using property `operatorFlightPlanVersion`.

The `operatorFlightPlanVersion` shall be always expressed as a positive integer. An initial eFPL submission shall have the `operatorFlightPlanVersion` set to `1`. 
A subsequent submission intending to replace the previous flight plan should indicate an `operatorFlightPlanVersion` one greater than the previously submitted plan or update.

Examples:

```xml
<!-- Initial submission -->
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:operatorFlightPlanVersion>1</ffice:operatorFlightPlanVersion>
```

```xml
<!-- First subsequent submission -->
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:operatorFlightPlanVersion>2</ffice:operatorFlightPlanVersion>
```

```xml
<!-- Second subsequent submission -->
<!--xmlns:ffice="http://www.fixm.aero/app/ffice/1.1"-->
<ffice:operatorFlightPlanVersion>3</ffice:operatorFlightPlanVersion>
```

*Note: The `operatorFlightPlanVersion` only relates to the provision and update of flight plan data provided by the operator.*


## originator

`TODO`

## planningStatus

The property `planningStatus` is used in an `FficeMessage` of `type`=`PLANNING_STATUS` or `type`=`TRIAL_RESPONSE` to indicate the status of the preliminary flight plan or trial request with respect to the eASP. 
It consists of the following properties:
- as a minimum, property `value` is used to exchange the value of the planning status. It shall be one the following values:
  - `CONCUR` - Indicates that the prelimnary flight plan or trial request, and in particular the route and trajectory, is acceptable without the need for modification. This should mean that if the flight plan were to be filed, it would be accepted.
  - `NON_CONCUR` - Indicates that the preliminary flight plan or trial request does not comply with published airspace/route availability or published restrictions and would result in a rejection or an unacceptable status if the flight plan were to be filed.
  - `NEGOTIATE` - Indicates that the flight plan, and in particular the route and trajectory, is acceptable and would be accepted if filed. However the route/trajectory determined by the eASP has included additional constraints and/or has applied ATM configuration factors such as runway-in-use or Met data which may have resulted in a route/trajectory that is different to the Desired route/trajectory.
- property `explanation` is used to detail the inconsistencies with the ATM configuration and/or with restrictions that have led to the planning status `value` being set to `NON_CONCUR`. Property `explanation` shall be exchanged if and only if the Planning Status `value` is `NON_CONCUR`.

## recipient

`TODO`

## referencedMessageIdentifier

## relevantAtmServiceProvider

`TODO`

## respondByLimit

## submissionStatus

## timestamp

## translationProvider

## translationRecipient

## type

## uniqueMessageIdentifier






[ICAO Doc. 8643]: https://www.icao.int/publications/DOC8643/Pages/Search.aspx
[DateTimeUtc]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutc-datetimeutchighprecision
[GeographicalPosition]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=geographicalposition
[AerodromeReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=aerodromereference
[Distance]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures
[Flight Rules Change]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory
[Airline Coding Directory]: https://www.iata.org/en/publications/manuals/airline-coding-directory/
