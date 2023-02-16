# Relative points

## FIXM representation

### Logical Model

![Image](.//media/image21.png)

UML Class `RelativePoint` in package `FIXM.Base.AeronauticalReference`

### XML schemas

```xml
<xs:complexType name="RelativePointType">
   <xs:sequence>
      <xs:element name="bearing" type="fb:BearingType" minOccurs="1" maxOccurs="1">
      </xs:element>
      <xs:element name="distance" type="fb:DistanceType" minOccurs="1" maxOccurs="1">
      </xs:element>
      <xs:element name="extension" type="fb:RelativePointExtensionType" nillable="true" minOccurs="0" maxOccurs="2000">
      </xs:element>
      <xs:element name="position" type="fb:GeographicalPositionType" nillable="true" minOccurs="0" maxOccurs="1">
      </xs:element>
      <xs:element name="referencePoint" type="fb:NavaidType" minOccurs="1" maxOccurs="1">
      </xs:element>
   </xs:sequence>
</xs:complexType>
```

Complex type [RelativePointType][RelativePointType] in file [AeronauticalReference.xsd][AeronauticalReference.xsd]

A relative point is a bearing and distance from a reference navaid.
Encoding a relative point in FIXM requires the ‘bearing’, ‘distance’ and
‘referencePoint’ properties to be provided. All of these properties
shall be provided.

FIXM enables a relative point to be supplemented with an optional
‘position’ value for storing the actual position of the relative point
if already known. The exchange of this information may prove useful in
order to save consuming systems / services from (re)computing the
position of the relative point. Whether or not to use this supplementary
information is at the discretion of the consuming system / service.

## Examples

!> This section depicts examples of FIXM encodings of relative points
that are derived from the fictitious Donlon
dataset<sup>[[12]](#references)</sup>. The
data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. **The examples shall never be used as operational data**.

### Example of relative point in FIXM without position information

```xml
<fb:relativePoint>
    <fb:bearing uom="DEG" zeroBearingType="MAGNETIC_NORTH">82.0</fb:bearing>
    <fb:distance uom="NM">2.0</fb:distance>
    <fb:referencePoint>
        <fb:designator>BOR</fb:designator>         (*)
    </fb:referencePoint>
</fb:relativePoint>
```

(*) See chapter [References to Navaid](general-guidance/references-to-published-aeronautical-information?id=references-to-navaid). All four options can be used for encoding this reference. OPTION 1 is used in this example.

### Example of relative point in FIXM with position information

```xml
<fb:relativePoint>
    <fb:bearing uom="DEG" zeroBearingType="TRUE_NORTH">180</fb:bearing>
    <fb:distance uom="NM">60.0</fb:distance>
    <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
        <fb:pos>51.36833333333333 -32.375</fb:pos>
    </fb:position>
    <fb:referencePoint>
        <fb:designator>BOR</fb:designator>         (*)
    </fb:referencePoint>
</fb:relativePoint>
```

[AeronauticalReference.xsd]: https://www.fixm.aero/releases/FIXM-4.2.0/schemas/core/base/AeronauticalReference.xsd
[RelativePointType]: https://www.fixm.aero/releases/FIXM-4.2.0/doc/schema_documentation/Fixm_RelativePointType.html

### References

[12]: [Donlon AIP data Set](https://github.com/aixm/donlon): a fictitious set of digital AIS data sets complying with the ICAO Annex 15, 16th edition and the new PANS-AIM provisions, in AIXM 5.1.1 format.
