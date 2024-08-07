# Departure Information

There are three use cases associated with departure points that can be represented in FIXM:
 
    1.	Flights that depart from aerodromes.
    2.	Flights that file non-aerodrome departure points.
    3.	Flights that file a flight plan that begins at an en route point (a so called airfile or AFIL flight).

The first of these is by far the most common use case, and, while the second two cases are infrequent, 
they are also required. 

Per the PANSATM <sup>[[I-04]](#references)</sup>, see the final clause of the DEP/ indicator under the Field Type 18 
section of Appendix 3 for the specific need to provide representation for a non-aerodrome departure point:  

> “The first point of the route (name or LAT/LONG) or the marker radio beacon, if the aircraft has not taken 
off from an aerodrome.”


## FIXM Representation

For most flights, i.e., flights departing from aerodromes, the departure aerodrome will be represented in `departureAerodrome`, and the estimated off block time will be represented in `estimatedOffBlockTime`.

Flights that file non-aerodrome departure points will represent the departure point in `departurePoint`, and will use `estimatedRouteStartTime` for the estimated departure time.

Airfile flights will represent the route start point in `departurePoint`, and will use `estimatedRouteStartTime` for the the airfile route start time. In addition, airfile flights will set the `airFileIndicator` to `AIRFILE`.

### Logical Model

The figure below illustrates how both common aerodrome and less common non-aerodrome departures are represented in FIXM.<sup><a href="#general-guidance/non-aerodrome-departures?id=notes">[note 1]</a></sup>

![Image](.//media/non-aerodrome-departures-02.png)

UML Class `Departure` (and relevant, associated classes) in package `FIXM.Flight.Departure`

### XML Schema

```xml
<xs:complexType name="DepartureType">
    <xs:annotation>
        <xs:documentation>Groups information pertaining to the flight's departure.</xs:documentation>
    </xs:annotation>
    <xs:sequence>
        ...
        <xs:element name="airfileIndicator" type="fx:AirfileIndicatorType" minOccurs="0" maxOccurs="1" nillable="true">
        </xs:element>
        ...
        <xs:choice minOccurs="0" maxOccurs="1">
            <xs:element name="departureAerodrome" type="fb:AerodromeReferenceType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
            <xs:element name="departurePoint" type="fx:DeparturePointChoiceType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
        </xs:choice>
        <xs:choice minOccurs="0" maxOccurs="1">
            <xs:element name="departureAerodromePrevious" type="fb:AerodromeReferenceType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
            <xs:element name="departurePointPrevious" type="fx:DeparturePointChoiceType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
        </xs:choice>
        <xs:choice minOccurs="0" maxOccurs="1">
            <xs:element name="estimatedOffBlockTime" type="fb:DateTimeUtcType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
            <xs:element name="estimatedRouteStartTime" type="fb:DateTimeUtcType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
        </xs:choice>
        <xs:choice minOccurs="0" maxOccurs="1">
            <xs:element name="estimatedOffBlockTimePrevious" type="fb:DateTimeUtcType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
            <xs:element name="estimatedRouteStartTimePrevious" type="fb:DateTimeUtcType" minOccurs="1" maxOccurs="1" nillable="true">
            </xs:element>
        </xs:choice>
        ...
    </xs:sequence>
</xs:complexType>
```

Edited [DepartureType][DepartureType] in file [Departure.xsd][Departure.xsd]

## Examples

### Aerodrome Departure Example

```xml
<fx:departure>
    <fx:departureAerodrome>KDFW</fx:departureAerodrome>
    <fx:estimatedOffBlockTime>2023-01-13T15:18:00Z</fx:estimatedOffBlockTime>
</fx:departure>
```
### Non-Aerodrome Departure Example

```xml
<fx:departure>
    <fx:departurePoint>
        <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>59.0 -30.0</fb:pos>
        </fb:position>
    </fx:departurePoint>
    <fx:estimatedRouteStartTimeTime>2023-01-13T15:18:00Z</fx:estimatedRouteStartTimeTime>
</fx:departure>
```
### AirFile Example

```xml
<fx:departure>
    <fx:departurePoint>
        <fb:navaid>
              <fb:designator>FAM<fb:designator>
              <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
                  <fb:pos>37.6734614 -90.2340597</fb:pos>
              </fb:position>
        </fb:navaid>
    </fx:departurePoint>
    <fx:estimatedRouteStartTime>2023-01-13T20:05:00Z</fx:estimatedRouteStartTime>
    <fx:airfileIndicator>AIRFILE</fx:airfileIndicator>
</fx:departure>
```

[DepartureType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_DepartureType.html
[Departure.xsd]: https://www.fixm.aero/releases/FIXM-4.3.0/schemas/core/flight/departure/Departure.xsd

## Special case - Use of the `...Previous` elements

The process of associating FF-ICE Messages with flights, although faciliated by the gufi, can still involve several key fields, 
including the aircraft identification, the departure airport, the departure time and the destination aerodrome. 

The departure time, commonly the EOBT, may not always be fixed and may for instance be changed by a Flight Plan Update. 
FIXM enables the exchange of the key fields as they were initially (i.e. prior to any change) using the fields `...Previous` 
(`estimatedOffBlockTimePrevious`, `estimatedRouteStartTimePrevious`, ...), so that the traditional message/flight matching remains 
easily doable, and also so that translation to an ATS message (e.g. CHG or DLA) remains possible.

```xml
<fx:departure>
    <fx:departureAerodrome>KDFW</fx:departureAerodrome>
    <fx:estimatedOffBlockTime>2023-01-13T15:21:30Z</fx:estimatedOffBlockTime>
    <fx:estimatedOffBlockTimePrevious>2023-01-13T15:18:00Z</fx:estimatedOffBlockTimePrevious>
</fx:departure>
```


## Notes
[1]: To create the logical model, four new embedded choice classes using the <\<XSDchoice\>> stereotype were created named DepartureLocationChoice, DepartureLocationPreviousChoice, DepartureTimeChoice, and DepartureTimePreviousChoice. This approach was used to retain the explicit representation for the departure aerodrome as its own field with non-aerodrome departure points collected under a second field.


## References

### ICAO References

[I-04]: [ICAO Doc 4444, 16th Edition, 2016](https://portal.icao.int/icao-net/ICAO%20Documents/4444_cons_en.pdf) - PANS-ATM: Procedures for Air Navigation Services: Air Traffic Management


