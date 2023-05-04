# Aircraft Data

### Aircraft Registration

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

--- 

- Aircraft Registration = `9M-MRO` for the aircraft operated during flight `MAS370`

![Image](.//media/MH370_aircraft_reg.png "Example of aircraft registration - 9MMRO")

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

### 
