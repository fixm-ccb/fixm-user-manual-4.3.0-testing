# Encoding guidance for fx:Aircraft

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA1/EA233.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_AircraftType.html)

---

## `aircraftAddress`

The `Aircraft Address` is *a unique combination of twenty-four bits available for assignment to an aircraft for the purpose of air-ground communications, navigation and surveillance.* The `Aircraft Address` is hardcoded in the aircraft and is commonly called Mode S Address.

Example: 
- Aircraft Address = `4010DA`

Corresponding encoding in `FIXM 4.3.0`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:flight>
  <fx:aircraft>
    <fx:aircraftAddress>4010DA</fx:aircraftAddress>
```

---

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

---

## `aircraftType`

### `aircraftCount`

In the case of a formation flight, FIXM does not represent the total number of aircraft within the formation directly. Rather, this number can be derived by adding up the individual values for each `<aircraftCount>` element under each `<aircraftType>` element of the formation.  For example, the following XML snippet would be used to represent a formation of nine aircraft including two F15s, four K35Rs, and three B2s:

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:flight>
  <fx:aircraft>
    <fx:aircraftType>
      <fx:aircraftCount>2</fx:aircraftCount>
      <fx:otherAircraftType>F15</fx:otherAircraftType>
    </fx:aircraftType>
    <fx:aircraftType>
      <fx:aircraftCount>4</fx:aircraftCount>
      <fx:icaoAircraftTypeDesignator>K35R</fx:icaoAircraftTypeDesignator>
    </fx:aircraftType>
    <fx:aircraftType>
      <fx:aircraftCount>3</fx:aircraftCount>
      <fx:otherAircraftType>B2</fx:otherAircraftType>
    </fx:aircraftType>
```

Although technically permitted, when the flight is not a formation, the `<aircraftCount>` element should be omitted.  It is only intended to be used for formation flights.

### `icaoAircraftTypeDesignator`

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

### `otherAircraftType`

The property `otherAircraftType` can be used to exchange an aircraft type that has no ICAO Doc. 8643 identifier.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:aircraftType>
    <fx:otherAircraftType>PL-11 AIRTRUCK</fx:otherAircraftType>
    <!-- https://en.wikipedia.org/wiki/Bennett_Airtruck -->
```

---

## `coloursAndMarkings`

Property `coloursAndMarkings` can be used to exchange one or more of the following, separated by a space character: 
- The colour of the aircraft. The AIRM provides a [list of colour codes](https://airm.aero/developers/advanced-search/1.1.0/CodeColourType?model=LogicalModel) that should be used preferably when encoding the colour of the aircraft.
- Significant markings (this may include the aircraft registration).

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:aircraft>
  <fx:coloursAndMarkings>WHITE</fx:coloursAndMarkings>
  <!-- ... -->
```

---

## `wakeTurbulence`

The `wakeTurbulence` category is a grouping of aircraft according to the effect of the rotating air mass created behind the wing tips.

The `wakeTurbulence` category shall be one of the following values:
  - `J` (SUPER) - for aircraft types specified as such in Doc 8643, Aircraft Type Designators
  - `H` (HEAVY) - for aircraft types of 136 000 kg or more, with the exception of aircraft types listed in Doc 8643 in the SUPER (J) category
  - `M` (MEDIUM) - for aircraft types less than 136 000 kg but more than 7 000 kg
  - `L` (LIGHT) - aircraft types of 7 000 kg or less

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

## `registration`

The `Aircraft Registration` is *a unique, alphanumeric string that identifies a civil aircraft and consists of the Aircraft Nationality or Common Mark and an additional alphanumeric string assigned by the state of registry or common mark registering authority.* 

The `Aircraft Registration` is commonly called tail number and is visible on the airframe. 

Examples: 


- Aircraft Registration = `PH-NSC`, as visible on the airframe of this DR-400

![Image](.//media/aircraft_reg_PHNSC.png "Example of aircraft registration - PHNSC")

Corresponding encoding in `FIXM 4.3.0`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:flight>
  <fx:aircraft>
    <fx:registration>PHNSC</fx:registration>
```

- Aircraft Registration = `9M-MRO` for the aircraft operated during flight `MAS370`

![Image](.//media/MH370_aircraft_reg.png "Example of aircraft registration - 9MMRO")

Corresponding encoding in `FIXM 4.3.0`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:flight>
  <fx:aircraft>
    <fx:registration>9MMRO</fx:registration>
```

[ICAO Doc. 8643]: https://www.icao.int/publications/DOC8643/Pages/Search.aspx
