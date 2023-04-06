# Flight capabilities

## Communication capabilities

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
