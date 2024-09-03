# Candidate examples and rules for section `Encoding guidance`

## fx:Aircraft

### `aircraftAddress`

The `aircraftAddress` is a unique combination of twenty-four bits available for assignment to an aircraft 
for the purpose of air-ground communications, navigation and surveillance.


> Example from Doc 10150 (LADR)

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

#### `aircraftTypeDesignator`

> FF-ICE/R1 Manual B-2.5.1:

The `aircraftTypeDesignator` shall be a valid two to four alphanumeric characters indicator, starting with a letter, per [ICAO Doc. 8643].

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


### `coloursAndMarkings`

> From Doc 4444 Field Type 19:
> 
> (g) A/ followed by one or more of the following, separated by spaces:
> The colour of the aircraft.
> Significant markings (this may include the aircraft registration).

Property `coloursAndMarkings` can be used to exchange one or more of the following, separeated by `WHICH SEPARATOR`?
- The colour of the aircraft
- Significant markings (this may include the aircraft registration).

> Example from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:coloursAndMarkings>WHITE</fx:coloursAndMarkings>
  <!-- ... -->
```

:question: opportunity to introduce a codelist with predefined colours? (like [AIXM 5.1.1](https://aixm.aero/sites/default/files/imce/AIXM511HTML/AIXM/DataType_CodeColourBaseType.html)


### `wakeTurbulenceCategory`

The `wakeTurbulenceCategory` is a grouping of aircraft according to the effect of the rotating air mass created behind the wing tips.

The `wakeTurbulenceCategory` shall be one of the following values:
  - `J` (SUPER) - for aircraft types specified as such in Doc 8643, Aircraft Type Designators
  - `H` (HEAVY) - for aircraft types of 136 000 kg or more, with the exception of aircraft types listed in Doc 8643 in the SUPER (J) category
  - `M` (MEDIUM) - for aircraft types less than 136 000 kg but more than 7 000 kg
  - `L` (LIGHT) - aircraft types of 7 000 kg or less

> FF-ICE/R1 Manual E-4:

The `wakeTurbulenceCategory` specified for the aircraft shall be consistent with the category associated with the `aircraftTypeDesignator` in [ICAO Doc. 8643].

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

FIXM proposes different options to indicate the arrival time, in order to help system providers and operators select the one most applicable to their operations. Concretely, the actual time of arrival is exchanged in FIXM using the following properties:
- property `time` holds the arrival time value, expressed as a [DateTimeUtc].
- properties `type` and `position` may be used optionally to provide details about the point on the arrival aerodrome to which the arrival time refers.
  - `type` shall be one of the following value: `WHEELS_ON`, `IN_BLOCKS`, `END_LANDING_ROLL`.
  - `position` shall capture the geographical position of that point, expressed as a [GeographicalPosition]

```xml
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
<fx:arrival>
  <fx:destinationAerodrome>
    <fb:locationIndicator>EDDL</fb:locationIndicator>
  </fx:destinationAerodrome>
  <fx:destinationAerodromeAlternate>
    <fb:locationIndicator>EDDG</fb:locationIndicator>
  </fx:destinationAerodromeAlternate>
```

### `reclearanceInFlight`

> ICAO Doc 4444 RIF: *The route details to the revised destination aerodrome, followed by the ICAO four-letter location indicator
> of the aerodrome. The revised route is subject to reclearance in flight.*
>
> Examples: RIF/DTA HEC KLAX
> 
> RIF/ESP G94 CLA YPPH


### `runwayDirection`

> FF-ICE/R1 Manual, chapter 10.4.3.2
> Note: It is recognized that departure and arrival runways in conjunction with associated
> SIDs and STARs may not be known with certainty prior to the flight’s departure.

---

## fx:Capability

### `survival`



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
      <fx:emergencyRadioCapabilityType>EMERGENCY_LOCATOR_TRANSMITTER ULTRA_HIGH_FREQUENCY VERY_HIGH_FREQUENCY</fx:emergencyRadioCapabilityType>
      <fx:lifeJacketType>LIGHTS FLUORESCENCE</fx:lifeJacketType>
      <fx:survivalEquipmentType>MARITIME</fx:survivalEquipmentType>
    </fx:survival>
  </fx:capabilities>
```

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

### `currentModeACode`

> Example from Doc 4444

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:enRoute>
  <fx:currentModeACode>5100</fx:currentModeACode>
  <!-- [...] -->
```

## fx:Flight

### `supplementaryInformation`

`personsOnBoard` = The total number of persons (passengers and crew) on board the aircraft.

> Encoding Rules: FF-ICE/R1 Manual B-2.33: *fuel endurance expressed as hours and minutes of flying time.*

The `fuelEndurance` shall be expressed as hours and minutes of flying time. The Encoding of a `fuelEndurance` shall therefore always start with `P0Y0M0DT`.

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

## 


[ICAO Doc. 8643]: https://www.icao.int/publications/DOC8643/Pages/Search.aspx
[DateTimeUtc]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutc-datetimeutchighprecision
[GeographicalPosition]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=geographicalposition
[AerodromeReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=aerodromereference
