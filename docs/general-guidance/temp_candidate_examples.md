# Candidate examples and rules

## fx:Aircraft

### `aircraftAddress`

Example from Doc 10150 (LADR)
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:aircraftAddress>AC82EC</fx:aircraftAddress>
  <!-- ... -->
```

### `aircraftApproachCategory`

Classification of aircraft based on 1.3 times stall speed in landing configuration at maximum certified landing mass.

Encoding Rules:
- FIXM Codelist: the `aircraftApproachCategory` shall be one of the following values:
  - A - less than 169 km/h (91 kt) indicated airspeed 
  - B - 169 km/h (91 kt) or more but less than 224 km/h 
  - C - 224 km/h (121 kt) or more but less than 261 km/h (141 kt) 
  - D - 261 km/h (141 kt) or more but less than 307 km/h (166 kt) 
  - E - 307 km/h (166 kt) or more but less than 391 km/h (211 kt) 
  - H - Helicopters

- Plausibility rule: the value of the `aircraftApproachCategory` should be consistent with the `aircraftType` content. For instance, the `aircraftApproachCategory` should not be set to `H` for e.g. an AIRBUS A380.
- 
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

Encoding Rules
- FF-ICE/R1 Manual B-2.5.1: the `aircraftTypeDesignator` shall be a valid two to four alphanumeric characters indicator, starting with a letter, per ICAO Doc. 8643.
See https://www.icao.int/publications/DOC8643/Pages/Search.aspx

### `coloursAndMarkings`

Example from Doc 4444
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:coloursAndMarkings>WHITE</fx:coloursAndMarkings>
  <!-- ... -->
```

### `wakeTurbulenceCategory`

Encoding Rules
- FIXM Codelist: the `wakeTurbulenceCategory` shall be one of the following values:
  - J (SUPER) - for aircraft types specified as such in Doc 8643, Aircraft Type Designators
  - H (HEAVY) - for aircraft types of 136 000 kg or more, with the exception of aircraft types listed in Doc 8643 in the SUPER (J) category
  - M (MEDIUM) - for aircraft types less than 136 000 kg but more than 7 000 kg
  - L (LIGHT) - aircraft types of 7 000 kg or less

- FF-ICE/R1 Manual E-4: the `wakeTurbulenceCategory` specified for the aircraft shall be consistent with the category associated with the `aircraftTypeDesignator` in ICAO Doc. 8643
See https://www.icao.int/publications/DOC8643/Pages/Search.aspx

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


## fx:Emergency

### `lastContact`

#### `position`

Example - values taken from Doc 10150 (LADR) 

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

Example from Doc 4444
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:enRoute>
  <fx:currentModeACode>5100</fx:currentModeACode>
  <!-- [...] -->
```

## fx:Flight

### `supplementaryInformation`

Encoding Rules
- FF-ICE/R1 Manual B-2.33: *fuel endurance expressed as hours and minutes of flying time.* Encoding of a `fuelEndurance` shall always start with `P0Y0M0DT`.

Example from Doc 4444
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
