# Flight Capabilities

## Communication Capabilities

### Selective Calling Code

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

## Absence of capabilities - no or unserviceable equipments

`FIXM Core 4.3.0` has no explicit property for expressing that the flight has no communication, navigation, or surveillance capability, which might happen when the aircraft is not equipped or has unserviceable equipments on board. The following `FIXM Core 4.3.0` encoding rules are therefore established for expressing the absence of capability: 
- when the flight has no radiocommunication / navigation / approach aid capabilities, encode the value `NO_OR_UNSERVICEABLE_EQUIPMENT` in both properties `<fx:otherCommunicationCapabilities>` and `<fx:otherNavigationCapabilities`.
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:capabilities>
  <fx:communication>
    <fx:otherCommunicationCapabilities>NO_OR_UNSERVICEABLE_EQUIPMENT</fx:otherCommunicationCapabilities>
  </fx:communication>
  <fx:navigation>
    <fx:otherNavigationCapabilities>NO_OR_UNSERVICEABLE_EQUIPMENT</fx:otherNavigationCapabilities>
  </fx:navigation>
```

- when the flight has no surveillance capability, encode the value `NO_OR_UNSERVICEABLE_EQUIPMENT` in property `<fx:otherSurveillanceCapabilities>`
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:capabilities>
  <fx:surveillance>
    <fx:otherSurveillanceCapabilities>NO_OR_UNSERVICEABLE_EQUIPMENT</fx:otherSurveillanceCapabilities>
```


