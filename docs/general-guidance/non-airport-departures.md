# Non-Aerodrome Departures

There are three use cases associated with departure points that can be represented in FIXM:
 
    1.	Flights that depart from an aerodrome.
    2.	Flights that file a flight plan while en route (a so called airfile or AFIL flight).
    3.	Flights that file non-aerodrome departure points.

The first of these is by far the most common use case, and while the  second two cases are infrequent, 
they are required. 

Per the PANSATM, see the final clause of the DEP/ indicator under the Field Type 18 
section of Appendix 3 for the specific need to provide representation for a non-aerodrome departure point:  

“The first point of the route (name or LAT/LONG) or the marker radio beacon, if the aircraft has not taken 
off from an aerodrome.”

Further, the departure aerodrome/point represents a key field for traditional flight matching.

## FIXM representation

INTRODUCTION TO THE LOGICAL MODEL (AND SCHEMA) HERE.

### Logical Model

The figure below illustrates how both common aerodrome and non-aerodrome departures are represented in FIXM.

![Image](../media/non-aerodrome-departures-02.png)

### XML schema

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

[DepartureType][DepartureType] in file [Departure.xsd][Departure.xsd]

MORE EXPLANATORY TEXT HERE.

## Examples

### Example

```xml

<SCHEMA STUFF HERE>

```
[DepartureType]: https://www.fixm.aero/releases/FIXM-4.2.0/doc/schema_documentation/Departure.html

## Notes
[1]: FIXM does not use GML but mimics it for geographic positions. GML encodes geographic locations as sequences of values since it employs the same construct to represent polygons.

## References

[14]: [OGC 12-028r1](https://portal.opengeospatial.org/files/?artifact_id=62061): Use of Geography Markup Language (GML) for Aviation Data
