# Encoding guidance for fx:FlightData

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA8/EA339.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_FlightType.html)

---

## `flightIdentification`

### `aircraftIdentification`

The `Aircraft Identification`, abbreviated ACID (or ARCID in the [ADEXP specification](https://www.eurocontrol.int/publication/eurocontrol-specification-ats-data-exchange-presentation-adexp)), is defined by ICAO as *a group of letters, figures or a combination thereof which is either identical to, or the coded equivalent of, the aircraft call sign to be used in air-ground communications, and which is used to identify the aircraft in ground-ground air traffic services communications.* 
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

### `aircraftIdentificationPrevious`

The process of associating FF-ICE Messages with flights, although faciliated by the gufi, can still involve several key fields, 
including the aircraft identification, the departure airport, the departure time, and the destination aerodrome. These key fields 
may not always be fixed and may, for instance, be changed by a Flight Plan Update. 

FIXM enables the exchange of these key fields as they were initially (i.e. prior to any change) using the fields `...Previous` 
(`aircraftIdentificationPrevious`, `estimatedOffBlockTimePrevious`, `estimatedRouteStartTimePrevious`, etc.), 
so that traditional message/flight matching can still be performed, and also so that translation to an ATS message (e.g. CHG or DLA) remains possible.

Example:

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:departure>
  <fx:departureAerodrome>
    <fb:locationIndicator>KDFW</fb:locationIndicator>
  </fx:departureAerodrome>
  <fx:estimatedOffBlockTime>2023-01-13T15:21:30Z</fx:estimatedOffBlockTime>
  <fx:estimatedOffBlockTimePrevious>2023-01-13T15:18:00Z</fx:estimatedOffBlockTimePrevious>
</fx:departure>
<fx:flightIdentification>
  <fx:aircraftIdentification>UFO1234</fx:aircraftIdentification>
  <fx:aircraftIdentificationPrevious>UFO9876</fx:aircraftIdentificationPrevious>
</fx:flightIdentification>
```

### `gufi`

> The Globally Unique Flight Identifier (GUFI) is intended to provide a unique reference to a specific flight, civil or military.
> Its purpose is to assist in associating a message to the correct flight and to help in distinguishing between similar flights.

> For the purpose of GUFI allocation “a flight” is considered to be the operation of an aircraft with a specified aircraft identification, at a specified departure aerodrome, at a specified date and time, from first submission of the flight plan (Preliminary or Filed) until in-blocks at an arrival aerodrome.

> The operator, or its designated representative, is required to generate and allocate a GUFI to its FF-ICE flight plan.

More information about the GUFI can be found in chapter 3.7 GUFI & FLIGHT PLAN ASSOCIATION of the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#References)</sup>.

#### Encoding a GUFI in FIXM Core 4.3.0

`FIXM Core 4.3.0` supports the representation of the GUFI as specified in the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#References)</sup>. The GUFI consists of a version 4 UUID, as standardised by IETF RFC 4122 <sup>[[O-07]](#References)</sup> and ISO/IEC 9834-8:2014 <sup>[[O-08]](#References)</sup>, supplemented with a namespace identifying the originator of the GUFI and a creation timestamp. For further details, browse APPENDIX G – GUFI Construction of the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#References)</sup>.

**UUID**

The construction of a new GUFI always requires the generation of a new UUID (i.e. the UUID portion of the GUFI should never intentitionally be kept static while relying on the other components of the GUFI, such as the timestamp, to provide uniqueness).

Below is a list of off-the-shelf IT libraries whose use is recommended for the UUID 4 generation:

|Language|URL|
|:-|:-|
|Java|https://docs.oracle.com/en/java/javase/19/docs/api/java.base/java/util/UUID.html#randomUUID()|
|.NET|https://learn.microsoft.com/en-us/dotnet/api/system.guid.newguid?view=net-7.0#system-guid-newguid|
|Python|https://docs.python.org/3/library/uuid.html#uuid.uuid4|

**Namespace**

The namespace is encoded using two fields: the `namespace domain` and the `namespace identifier`. The `namespace domain` identifies the particular type of namespace that is encoded, while the `namespace identifier` holds the actual namespace value. There are three options for the encoding of the namespace:
- `namespace domain` = `FULLY_QUALIFIED_DOMAIN_NAME` when the `namespace identifier` is a domain name from either the organisation's email or from the organisation's website.
- `namespace domain` = `OPERATING_AGENCY_DESIGNATOR` when the `namespace identifier` is a three-letter Operating Agency Designator (as per ICAO Doc. 8585 <sup>[[I-15]](#References)</sup>).
- `namespace domain` = `LOCATION_INDICATOR` when the `namespace identifier` is a four-letter Location Indicator (as per ICAO Doc. 7910 <sup>[[I-07]](#References)</sup>). 

It is up to each GUFI originator to choose the most suitable option for the namespace, but keep in mind that the intent is for the namespace chosen to uniquely identify the GUFI originator. It is also recommended that the GUFI originator use a single consistent namespace whenever possible to allow namespace uniqueness to be testable for that organisation.

?> Note: The GUFI originator is not necessarily the flight plan or message originator, although they may be the same entity. For example, it is possible that an independent GUFI creation service could be used by flight plan originators that do not wish to create their own GUFIs. The namespace associated with these GUFIs would be that of the creation service and would have no connection to the flight plan originator.

**Timestamp**

The creation timestamp is expressed as a `DateTimeUTC`. For more guidance, see [this section](general-guidance/fb_Types?id=datetimeutc-datetimeutchighprecision).

#### Examples of GUFI Encoding

- Example of GUFI encoding whereby the originator of the GUFI is an airline that has been allocated a 3-letter code listed in ICAO Doc 8585 <sup>[[I-15]](#References)</sup>.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="OPERATING_AGENCY_DESIGNATOR" namespaceIdentifier="AIB">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```


- Example of GUFI encoding whereby the originator of the GUFI is an ATM unit that has been allocated a 4-letter location indicator listed in ICAO Doc 7910 <sup>[[I-07]](#References)</sup>.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="LOCATION_INDICATOR" namespaceIdentifier="KZDC">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```


- Example of GUFI encoding whereby the originator of the GUFI is an organisation identified by its registered, specific internet Fully Qualified Domain Name.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="FULLY_QUALIFIED_DOMAIN_NAME" namespaceIdentifier="example.com">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```


#### Compatibility with FIXM Core 4.2.0

GUFIs are encoded in FIXM Core 4.2.0 as version 4 UUID only, with no namespace and no creation timestamp. In order to preserve compatibility with FIXM Core 4.2.0, `FIXM Core 4.3.0` introduces a property `gufiLegacy` which should **only be used when the GUFI assigned to a flight is in Core 4.2.0 format but there is a need to publish information about the flight in FIXM Core 4.3.0 format**.

Example

```xml
<!-- FF-ICE Flight Plan filed in old 4.2.0 format...-->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<!-- xmlns:fx="http://www.fixm.aero/flight/4.2" -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<fx:gufi codeSpace="urn:uuid">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```

```xml
<!-- redistributed in new 4.3.0 format...-->
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:gufiLegacy codeSpace="urn:uuid">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufiLegacy>
```

### `iataFlightDesignator`

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

---

## `flightRulesCategory`

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

## `flightType`

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

---

## `remarks`

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

---

## `specialHandling`

The property `specialHandling` is used to exchange the reason for special handling of a flight by ATS. 
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

## `supplementaryInformation`

In FIXM, the property `supplementaryInformation` consists of the following fields:
- `fuelEndurance`: This is the estimated maximum length of time the aircraft can spend in the cruise phase of flight, determined by the amount of fuel at takeoff. The fuel endurance shall be expressed as hours and minutes of flying time. The encoding of a `fuelEndurance` shall therefore always start with `P0Y0M0DT`.
- `personsOnBoard`: This is the total number of persons (passengers and crew) on board the aircraft.
- `pilotInCommand`: This is the pilot designated by the operator, or in the case of general aviation, the owner, as being in command and charged with the safe conduct of a flight.

Example (based on ICAO Doc 4444)

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

## *References* <!-- {docsify-ignore} -->

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 

[I-07]: [ICAO Doc 7910](https://www.icao.int/safety/OPS/OPS-Tools/Pages/location-indicator.aspx) - Location Indicators

[I-15]: [ICAO Doc 8585](https://www.icao.int/safety/OPS/OPS-Tools/Pages/3LD.aspx) - Designators for Aircraft Operating Agencies, Aeronautical Authorities and Services

### Other References

[O-07]: [IETF RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122)

[O-08]: [ISO/IEC 9834-8:2014](https://www.iso.org/obp/ui#iso:std:iso-iec:9834:-8:ed-3:v1:en)




[Airline Coding Directory]: https://www.iata.org/en/publications/manuals/airline-coding-directory/
