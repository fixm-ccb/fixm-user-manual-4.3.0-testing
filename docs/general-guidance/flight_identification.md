# Flight Identification

## GUFI





## Aircraft Identification

The `Aircraft Identification`, abbreviated ACID, is defined by ICAO as *A group of letters, figures or a combination thereof which is either identical to, or the coded equivalent of, the aircraft call sign to be used in air-ground communications, and which is used to identify the aircraft in ground-ground air traffic services communications.* 
The `Aircraft Identification` is NOT an identifier of an aircraft. It is an identifier of a flight, i.e. the operation of an aircraft from A to B.

Examples of ACID: 
- ACID = `BAW1234`, pronounced as `Speedbird One-Two-Three-Four` (= the callsign)
- ACID = `MAS370`, pronounced as `Malaysia Airlines Three-Seven-Zero` (= the callsign)
- ACID = `AFR447`, pronounced as `Air France Four-Four-Seven` (= the callsign)

Encoding of ACID in `FIXM Core 4.3.0`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:flight>
  <fx:flightIdentification>
    <fx:aircraftIdentification>AFR447</fx:aircraftIdentification>
```

