# Flight Identification

## GUFI

### What is it?

> The Globally Unique Flight Identifier (GUFI) is intended to provide a unique reference to a specific flight, civil or military.
> Its purpose is to assist in associating a message to the correct flight and to help in distinguishing between similar flights.

> For the purpose of GUFI allocation “a flight” is considered to be the operation of an aircraft with a specified aircraft identification, at a specified departure aerodrome, at a specified date and time, from first submission of the flight plan (Preliminary or Filed) until in-blocks at an arrival aerodrome.

> The operator, or its designated representative, is required to generate and allocate a GUFI to its FF-ICE flight plan.

More information in chapter 3.7 GUFI & FLIGHT PLAN ASSOCIATION of the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#references)</sup>.

### Encoding a GUFI in FIXM Core 4.3.0

`FIXM Core 4.3.0` supports the representation of the GUFI as specified in the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#references)</sup>. The GUFI consists of a version 4 UUID, as standardised by IETF RFC 4122 <sup>[[O-07]](#references)</sup> and ISO/IEC 9834-8:2014 <sup>[[O-08]](#references)</sup>, supplemented with a namespace identifying the originator of the GUFI and a creation timestamp. For further details, browse APPENDIX G – GUFI Construction of the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#references)</sup>.

#### Encoding the UUID v4

Here is a list of off-the-shelf IT libraries whose use is recommended for the UUID 4 generation:

|Language|URL|Notes|
|:-|:-|:-|
|Java|https://docs.oracle.com/en/java/javase/19/docs/api/java.base/java/util/UUID.html#randomUUID()||
|.NET|https://learn.microsoft.com/en-us/dotnet/api/system.guid.newguid?view=net-7.0#system-guid-newguid||
|Python|https://docs.python.org/3/library/uuid.html#uuid.uuid4||

#### Encoding the Namespace

The namespace is encoded using two fields: the `namespace domain` and the `namespace identifier`. The `namespace domain` identifies the particular type of namespace that is encoded, while the `namespace identifier` holds the actual namespace value. There are three options for the encoding of the namespace:
- `namespace domain` = `FULLY_QUALIFIED_DOMAIN_NAME` when the `namespace identifier` is a domain name from either the organisation's email or from the organisation's website.
- `namespace domain` = `OPERATING_AGENCY_DESIGNATOR` when the `namespace identifier` is a three-letter Operating Agency Designator (as per ICAO Doc. 8585 <sup>[[I-15]](#references)</sup>).
- `namespace domain` = `LOCATION_INDICATOR` when the `namespace identifier` is a four-letter Location Indicator (as per ICAO Doc. 7910 <sup>[[I-07]](#references)</sup>). 

It is up to each GUFI originator to choose the most suitable option for the namespace, but keep in mind that the intent is for the namespace chosen to uniquely identify the GUFI originator. It is also recommended that the GUFI originator use a single consistent namespace whenever possible to allow namespace uniqueness to be testable for that organisation.

?> Note: The GUFI originator is not necessarily the flight plan or message originator, although they may be the same entity. For example, it is possible that an independent GUFI creation service could be used by flight plan originators that do not wish to create their own GUFIs. The namespace associated with these GUFIs would be that of the creation service and would have no connection to the flight plan originator.


#### Encoding the Creation Timestamp

The creation timestamp is expressed as a `DateTimeUTC`. For more guidance, see [this section](general-guidance/date-time-specification.md).


#### Examples of GUFI Encoding

- Example of GUFI encoding whereby the originator of the GUFI is an airline that has been allocated a 3-letter code listed in ICAO Doc 8585 <sup>[[I-15]](#references)</sup>.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="OPERATING_AGENCY_DESIGNATOR" namespaceIdentifier="AIB">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```

---

- Example of GUFI encoding whereby the originator of the GUFI is an ATM unit that has been allocated a 4-letter location indicator listed in ICAO Doc 7910 <sup>[[I-07]](#references)</sup>.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="LOCATION_INDICATOR" namespaceIdentifier="KZDC">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```

---

- Example of GUFI encoding whereby the originator of the GUFI is an organisation identified by its registered, specific internet Fully Qualified Domain Name.

```xml
<!-- xmlns:fx="http://www.fixm.aero/flight/4.3" -->
<fx:flight>
  <fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid" creationTime="2022-12-01T12:18:36Z" namespaceDomain="FULLY_QUALIFIED_DOMAIN_NAME" namespaceIdentifier="example.com">dd056de9-0ba9-4d55-82cf-7b976b0b6d29</fx:gufi>
```

---

### Compatibility with FIXM Core 4.2.0

GUFIs are encoded in FIXM Core 4.2.0 as version 4 UUID only, with no namespace and no creation timestamp. In order to preserve compatibility with FIXM Core 4.2.0, `FIXM Core 4.3.0` introduces a property `gufiLegacy` which should only be used when the GUFI assigned to a flight is in Core 4.2.0 format but there is a need to publish information about the flight in FIXM Core 4.3.0 format.

#### Example

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

## Aircraft Identification

The `Aircraft Identification`, abbreviated ACID (or ARCID in the [ADEXP specification](https://www.eurocontrol.int/publication/eurocontrol-specification-ats-data-exchange-presentation-adexp)), is defined by ICAO as *A group of letters, figures or a combination thereof which is either identical to, or the coded equivalent of, the aircraft call sign to be used in air-ground communications, and which is used to identify the aircraft in ground-ground air traffic services communications.* 
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

## References

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 

[I-07]: [ICAO Doc 7910](https://www.icao.int/safety/OPS/OPS-Tools/Pages/location-indicator.aspx) - Location Indicators

[I-15]: [ICAO Doc 8585](https://www.icao.int/safety/OPS/OPS-Tools/Pages/3LD.aspx) - Designators for Aircraft Operating Agencies, Aeronautical Authorities and Services

### Other References

[O-07]: [IETF RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122)

[O-08]: [ISO/IEC 9834-8:2014](https://www.iso.org/obp/ui#iso:std:iso-iec:9834:-8:ed-3:v1:en)
