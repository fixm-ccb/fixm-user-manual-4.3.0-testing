# Encoding guidance for fx:Arrival

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA2/EA244.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_ArrivalType.html)

---

## `actualTimeOfArrival`

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

---

## `airportSlotIdentification`

See [`airportSlotIdentification`]

---

## `destinationAerodrome` / `arrivalAerodrome`

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

---

## `destinationAerodromeAlternate`

A `destinationAerodromeAlternate` is an alternate aerodrome at which the aircraft would be able to land should it become either
impossible or inadvisable to land at the `destinationAerodrome`. Up to two `destinationAerodromeAlternate` entries may be specified for a flight.

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

---

## `destinationAerodromePrevious`

See [`aircraftIdentificationPrevious`]

[`aircraftIdentificationPrevious`]: general-guidance/fx_FlightData?id=aircraftidentificationprevious
[`airportSlotIdentification`]: general-guidance/fx_Departure?id=airportslotidentification

[AerodromeReference]: general-guidance/fb_AeronauticalReference?id=aerodromereference
[DateTimeUtc]: general-guidance/fb_Types?id=datetimeutc-datetimeutchighprecision
[GeographicalPosition]: general-guidance/fb_AeronauticalReference?id=geographicalposition
