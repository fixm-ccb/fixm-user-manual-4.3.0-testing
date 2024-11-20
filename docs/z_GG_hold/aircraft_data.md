# Aircraft Data

## Aircraft Registration

The `Aircraft Registration` is *a unique, alphanumeric string that identifies a civil aircraft and consists of the Aircraft Nationality or Common Mark and an additional alphanumeric string assigned by the state of registry or common mark registering authority.* 

The `Aircraft Registration` is commonly called tail number, and is visible on the airframe. 

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

--- 

## Aircraft Address

The `Aircraft Address` is *A unique combination of twenty-four bits available for assignment to an aircraft for the purpose of air-ground communications, navigation and surveillance.* The `Aircraft Address` is hardcoded in the aircraft and is commonly called Mode S Address.

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

## Number of Aircraft

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
