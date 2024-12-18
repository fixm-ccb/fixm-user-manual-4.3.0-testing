# Encoding guidance for fb:AeronauticalReference

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA1/EA3/EA39.png)

Describing the predicted movement of a flight commonly means indicating
which parts of the infrastructure (ATS routes, waypoints, radio
navigation aids, etc.) are expected to be used by the flight. This is
enabled in FIXM by a set of “reference” constructs. These references
are not flight-specific information; they pertain to the aeronautical
information domain.

Different formats exist for exchanging aeronautical information, whose
usages depend on specific implementation considerations and actual
context within the overall data chain. For instance:

- AIXM is developed in order to enable the provision, in digital format,
    of the aeronautical information that is in the scope of Aeronautical
    Information Services (AIS). AIXM 5.1 covers both the content of
    Aeronautical Information Publications (AIP) and of the NOTAM
    information.

- The ARINC 424 standard defines a format for navigation (and
    communication) information, including, but not limited to, aerodrome,
    runway, navaid, airway, and terminal approach procedure information,
    that is exchanged between data suppliers and avionics vendors.

- The Aerodrome Mapping Exchange Schema (AMXM XML Schema) is an
    exchange format specification for AMDB as standardized by and
    dedicated to the EUROCAE/RTCA Aeronautical Databases WG44/SC217. It
    is an XML Schema implementation of the DO-291C/ED-119C AMXM UML
    model.

**FIXM does not import any of these formats or profiles thereof.** FIXM
defines its own structures for referring to aeronautical information
that are **self-contained** but mappable to their AIXM/AMXM… equivalents
thanks to the reuse of a common semantics. FIXM also provides an
**optional** mechanism enabling these self-contained references to be
supplemented with, but not replaced by, **hypertext references** to
AIXM features.

The following sections provide guidance for correctly encoding these
references in FIXM.

---

## Hypertext References

If an AIXM 5.1 feature exists that corresponds to the element being
referred to, an **optional** hypertext reference to that AIXM feature
may be provided. This reference shall be expressed in accordance with
chapter 3.4.1 (*Abstract references using UUID*) of the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>
developed by the AIXM community.

This hypertext reference may be used - or ignored - by the receiving
system depending on its capabilities.

Example:

```xml
<fx:[FIXM element] href="urn:uuid:81e47548-9f00-4970-b641-8ff8f99098a5">
```

Important note: FIXM does not import the W3C XML Linking Language<sup>[[O-02]](#references)</sup>
(xlink) v1.1 schemas in order to represent the hypertext references.
FIXM mimics the xlink Locator attribute named “href” but defines it
within the FIXM (Base) namespace.

---

## `AerodromeReference`

#### OPTION 1 - Minimum Reference

The minimum aerodrome reference shall consist of the aerodrome location
indicator, if provided by ICAO Doc 7910 <sup>[[I-07]](#references)</sup>. If the aerodrome has no
ICAO Doc 7910 location indicator, the minimum aerodrome reference shall
consist of the name of the aerodrome and its geographical location,
namely the aerodrome reference point or relative reference point.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#####  Examples (NOT for OPERATIONAL USE)

The table below depicts examples of FIXM references to fictitious
aerodrome “DONLON” that is ‘published’ in AIXM 5.1 as part of the
fictitious Donlon
dataset<sup>[[O-01]](#references)</sup>. The
data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. The examples shall NEVER BE USED AS OPERATIONAL DATA.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of aerodrome references in FIXM</strong></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td><strong>CASE 1 – The Aerodrome has an ICAO Doc 7910 location indicator</strong></td>
<td><strong>CASE 2 – The Aerodrome has no ICAO Doc. 7910 location indicator</strong></td>
</tr>
<tr class="even">
<td><p><strong>OPTION 1</strong></p>
<p>minimum</p></td>
<td><p>

```xml
<fx:destinationAerodrome>
  <fb:locationIndicator>EADD</fb:locationIndicator>
</fx:destinationAerodrome>
```

</p></td>
<td><p>

```xml
<fx:destinationAerodrome>
   <fb:name>DONLON</fb:name>
   <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>52.3716666666667 -31.9494444444444</fb:pos>
   </fb:referencePoint>
</fx:destinationAerodrome>
```

</p></td>
</tr>
<tr class="odd">
<td><p><strong>OPTION 2</strong></p>
<p>with href</p></td>
<td><p>

```xml
<fx:destinationAerodrome href="urn:uuid:1b54b2d6-a5ff-4e57-94c2-f4047a381c64">
   <fb:locationIndicator>EADD</fb:locationIndicator>
</fx:destinationAerodrome>
```

</p></td>
<td><p>

```xml
<fx:destinationAerodrome href="urn:uuid:1b54b2d6-a5ff-4e57-94c2-f4047a381c64">
   <fb:name>DONLON</fb:name>
   <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>52.3716666666667 -31.9494444444444</fb:pos>
   </fb:referencePoint>
</fx:destinationAerodrome>
```

</p></td>
</tr>
</tbody>
</table>

Important note: FIXM enables the encoding of “richer” aerodrome
reference structures, such as

```xml
 <fx:destinationAerodrome href="urn:uuid:1b54b2d6-a5ff-4e57-94c2-f4047a381c64">
   <fb:iataDesignator>DLN</fb:iataDesignator>
   <fb:locationIndicator>EADD</fb:locationIndicator>	
   <fb:name>DONLON</fb:name>
   <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>52.3716666666667 -31.9494444444444</fb:pos>
   </fb:referencePoint>
</fx:destinationAerodrome>
```
The above example includes all fields from both varieties of option 1 and option 2 as well as providing the aerodrome's IATA designator. This implementation practice only
aims to provide consumers with richer information about the aerodrome
being referred to. Whether or not to use this supplementary information
is at the discretion of the consuming system / service.

---

## `AirspaceDesignator`

#### OPTION 1 - Minimum Reference

The minimum airspace reference shall consist of the airspace location
indicator, if provided by ICAO Doc 7910 <sup>[[I-07]](#references)</sup>. If the airspace has no
ICAO Doc 7910 location indicator, the minimum airspace reference shall
consist of the coded designator of the airspace as published in the AIP.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### Examples (NOT for OPERATIONAL USE)

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of Airspace references in FIXM</strong></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td><strong>CASE 1 – The Airspace has an ICAO Doc 7910 location indicator</strong></td>
<td><strong>CASE 2 – The Airspace has no ICAO Doc. 7910 location indicator</strong></td>
</tr>
<tr class="even">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td><p>

```xml
<fb:controlSectorDesignator>KZLC</fb:controlSectorDesignator>
```

</p></td>
<td><p>

```xml
<fb:controlSectorDesignator>AMSWELL</fb:controlSectorDesignator>
```

</p></td>
</tr>
<tr class="odd">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td>

```xml
<fb:controlSectorDesignator href="urn:uuid:...">KZLC</fb:controlSectorDesignator>
```

</td>
<td><p>

```xml
<fb:controlSectorDesignator href="urn:uuid:...">AMSWELL</fb:controlSectorDesignator>
```

</p>
<p><em>(from DONLON dataset)</em></p></td>
</tr>
</tbody>
</table>

---

## `AtcUnitReference`

#### OPTION 1 - Minimum Reference

The minimum ATC unit reference shall consist of the location indicator
of the unit, if provided by ICAO Doc 7910 <sup>[[I-07]](#references)</sup>. If the unit has no
ICAO Doc 7910 location indicator, the minimum reference shall
consist of the name of the unit or any alternate name, as published in
the AIP.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### Examples (NOT for OPERATIONAL USE)

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of Unit references in FIXM</strong></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td><strong>CASE 1 – The Unit has an ICAO Doc 7910 location indicator</strong></td>
<td><strong>CASE 2 – The Unit has no ICAO Doc. 7910 location indicator</strong></td>
</tr>
<tr class="even">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td><p>

```xml
<fx:originator>
   <fb:locationIndicator>EBBU</fb:locationIndicator>
</fx:originator>
```

</p></td>
<td><p>&lt;fx:originator&gt;</p>
<p>

```xml
<fx:originator>
   <fb:atcUnitNameOrAlternate>MILITARY DONLON TWR</fb:atcUnitNameOrAlternate>
</fx:originator>
```

</p></td>
</tr>
<tr class="odd">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td><p>

```xml
<fx:originator href="urn:uuid:...">
   <fb:locationIndicator>EBBU</fb:locationIndicator>
</fx:originator>
```

</p></td>
<td><p>

```xml
<fx:originator href="urn:uuid:...">
   <fb:atcUnitNameOrAlternate>MILITARY DONLON TWR</fb:atcUnitNameOrAlternate>
</fx:originator>
```

</p></td>
</tr>
</tbody>
</table>

---

## `DesignatedPoint`

#### OPTION 1 - Minimum Reference

As a minimum, the coded designator of waypoint shall be provided, as
published in the AIPs.

```xml
<fb:designatedPoint>
   <fb:designator>TEMPO</fb:designator>
</fb:designatedPoint>
```

This is the minimum reference that SHALL be provided.

#### OPTION 2 - Unambiguous Reference

*(OPTION 2 = OPTION 1 + supplementary position information)*

The coded designator of a waypoint is not always sufficient for
unambiguously referring to that element. The 5-letter coded designator
of a waypoint is supposed to be unique world-wide (according to ICAO
Annex 11) but, in reality, is not. There are at least 5%
duplicates/triplicates/even more…

FIXM adds an optional property 'position' which may be used as a
complement to the 'designator' information in order to remove any
ambiguity on the designator.

```xml
<fb:designatedPoint>
   <fb:designator>TEMPO</fb:designator>
   <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>56.84 -29.860000000000003</fb:pos>
   </fb:position>
</fb:designatedPoint>
```

?> Important note: the combinations of fields \[designator + position\]
shall not be interpreted as a natural key uniquely identifying the
waypoint, in so far as producing and consuming systems/services may use
different aeronautical information sources with different degree of
precisions for latitude/longitude, leading to small variations of the position
information. The supplementary fields shall be used for disambiguation
purposes only (i.e. plausibility checks based on position) in case of
duplicates/triplicates/…

### OPTION 3 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 3 = OPTION 1 + supplementary hypertext reference)*

Option 3 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

```xml
<fb:designatedPoint href="urn:uuid:81e47548-9f00-4970-b641-8ff8f99098a5">
   <fb:designator>TEMPO</fb:designator>
</fb:designatedPoint>
```

Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.

#### OPTION 4 - Complete Reference

*(OPTION 4 = OPTION 2 + OPTION 3)*

Option 4 corresponds to the combination of Option 2 and Option 3. See
explanations above.

```xml
<fb:designatedPoint href="urn:uuid:81e47548-9f00-4970-b641-8ff8f99098a5">
   <fb:designator>TEMPO</fb:designator>
   <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>56.84 -29.860000000000003</fb:pos>
   </fb:position>
</fb:designatedPoint>
```

?> The code blocks above depicts examples of FIXM references to fictitious
Waypoint “TEMPO” that is ‘published’ in AIXM 5.1 as part of the
fictitious Donlon dataset<sup>[[O-01]](#references)</sup>. The data is entirely fictitious, located somewhere in the middle of the Atlantic Ocean. The examples shall NEVER BE USED AS OPERATIONAL DATA.

#### Note about the pattern constraint for waypoint designators

FIXM supports waypoint designators of 1 to 5 characters. This design is
intentional. In most cases, waypoints have a 5-letter designator, as
prescribed by ICAO. However, these designators might be shorter in some
particular cases. Examples of shorter waypoint designators could be
found in various sources:

- **In chapter 7 of the ARINC 424 specification.**

This chapter provides rules for forming the designators of waypoints in the absence of published designators. These rules can lead to designators of less than 5 characters. The following extracts from ARINC 424-19 provide some examples, which are <mark>highlighted</mark>.

Examples:

> - 3.0 NM from DOOTY should be expressed as <mark>3NM</mark>.
>
> - 2.8 NM from CHASS should be expressed as <mark>28NM</mark>.
>
> - 11.0 NM from BACUP should be expressed as <mark>NM11</mark>.
>
> - 13.8 NM from KITTY should be expressed as <mark>NM138</mark>.


>    Fix Ident:  <mark>AB13</mark>
>
>    Fix Name:   AB180013 AB 180.3 degrees 12.8

- **In the [US FAA’s publication of Instrument Flight Procedures encodings in ARINC 424-18 format]**

For instance:

<details>
  <summary>Localizer only approach on RWY06 at KFOD</summary>

> SUSAP KFODK3FL06 AFOD 010FOD K3D 0V IF 18000 0 NS 854081209
>
> SUSAP KFODK3FL06 AFOD 020<mark>FF06</mark> K3PC0E TF + 02800 0 NS 854091209
>
> SUSAP KFODK3FL06 AFOD 030<mark>FF06</mark> K3PC0EE AR PI IFODK3 2430006119800100PI + 02800 0 NS 854101209
>
> SUSAP KFODK3FL06 AHIMSU 010HIMSUK3PC0E A IF FOD K3 15000140 D 18000 0 NS 854111310
>
> SUSAP KFODK3FL06 AHIMSU 020SHRLAK3PC0EE BR AF FOD K3 216501401500 D + 02800 0 NS 854121310
>
> SUSAP KFODK3FL06 ALESFI 010LESFIK3PC0E A IF FOD K3 25400140 D 18000 0 NS 854131310
>
> SUSAP KFODK3FL06 ALESFI 020SHRLAK3PC0EE BL AF FOD K3 216501402540 D + 02800 0 NS 854141310
>
> SUSAP KFODK3FL06 L 010SHRLAK3PC0E I IF IFODK3 24300163 PI + 02800 18000 0 NS 854151310
>
> SUSAP KFODK3FL06 L 020<mark>FF06</mark> K3PC0E F CF IFODK3 2430006106300101PI + 02800 FO K3PN0 NS 854161209
>
> SUSAP KFODK3FL06 L 021ATLOJK3PC0E S CF IFODK3 2430003406300028PI + 01820 -324 0 NS 854171310
>
> SUSAP KFODK3FL06 L 030RW06 K3PG0GY M CF IFODK3 2430001306300021PI 01134 -324 0 NS 854181209
>
> SUSAP KFODK3FL06 L 040 0 M CA 0630 + 02800 0 NS 854191209
>
> SUSAP KFODK3FL06 L 050FOD K3D 0VY L DF + 02800 0 NS 854201209
>
> SUSAP KFODK3FL06 L 060FOD K3D 0VE R HM 1204T010 + 02800 0 NS 854211209    
    
</details>

<details>
  <summary>GPS approach on RWY29 at KFOT</summary>

> SUSAP KFOTK2FP29 ADINSE 010DINSEK2EA0E A IF 18000 P PS 857251211
>
> SUSAP KFOTK2FP29 ADINSE 020JEWPEK2PC0E TF + 06000 P PS 857261310
>
> SUSAP KFOTK2FP29 ADINSE 030SPHERK2PC0EE TF + 04700 P PS 857271310
>
> SUSAP KFOTK2FP29 AKNEES 010KNEESK2EA0E IF 18000 P PS 857281211
>
> SUSAP KFOTK2FP29 AKNEES 020YAGERK2EA0E A TF + 06800 P PS 857291211
>
> SUSAP KFOTK2FP29 AKNEES 030SPHERK2PC0EE TF + 04700 P PS 857301310
>
> SUSAP KFOTK2FP29 APLYAT 010PLYATK2EA0E A IF 18000 P PS 857311211
>
> SUSAP KFOTK2FP29 APLYAT 020JEVGYK2PC0E TF + 06000 P PS 857321310
>
> SUSAP KFOTK2FP29 APLYAT 030SPHERK2PC0EE TF + 04700 P PS 857331310
>
> SUSAP KFOTK2FP29 P 010SPHERK2PC0E I IF + 04700 18000 P PS 857341310
>
> SUSAP KFOTK2FP29 P 011JEVSYK2PC0E S TF + 03700 P PS 857351310
>
> SUSAP KFOTK2FP29 P 020ELLYSK2PC0E F TF + 02700 IZPUH K2PCP PS 857361310
>
> SUSAP KFOTK2FP29 P 021<mark>SP29</mark> K2PC0E A TF + 01840 -356 P PS 857371211
>
> SUSAP KFOTK2FP29 P 030IZPUHK2PC0EY M TF 00617 -356 P PS 857381310
>
> SUSAP KFOTK2FP29 P 040 0 M CA 2757 + 01500 P PS 857391211
>
> SUSAP KFOTK2FP29 P 050FOT K2D 0VY R DF + 03000 P PS 857401211
>
> SUSAP KFOTK2FP29 P 060FOT K2D 0VE R HM 1610T010 + 03000 P PS 857411510
    
</details>


- **In the European AIS Database (EAD).** 

A query on the EAD helped identify the following:
  - 40 occurrences of designated points with a 1-letter designator
  - 190 occurrences of designated points with a 2-letters designator
  - 356 occurrences of designated points with a 3-letters designator
  - 3046 occurrences of designated points with a 4-letters designator

Most of the designated points with 2, 3 or 4-letter designators
actually correspond to designated points formed after the position of
a navaid or an aerodrome. However, some occurrences cannot be related
to these cases. 

<details>
  <summary>The following table quotes a few random examples.</summary>

| **Designator**        | **Lat**      | **Long**      | **Type** |
|-----------------------|--------------|---------------|----------|
| *1-letter designator* |              |               |          |
| N                     | 503241N      | 0042718E      | ADHP     |
| E                     | 502941N      | 0044206E      | ADHP     |
| A                     | 475826.0000N | 0161445.0000E | OTHER    |
| B                     | 475202.0000N | 0161514.0000E | OTHER    |
| B                     | 475734.0000N | 0161614.0000E | OTHER    |
| *2-letter designator* |              |               |          |
| S1                    | 460217N      | 0142702E      | OTHER    |
| S2                    | 460552N      | 0142748E      | OTHER    |
| S3                    | 460845N      | 0142452E      | OTHER    |
| W1                    | 461846N      | 0141449E      | OTHER    |
| W2                    | 461744N      | 0142049E      | OTHER    |
| A1                    | 453243N      | 0181709E      | OTHER    |
| A2                    | 423842N      | 0175651E      | ADHP     |
| A3                    | 434049N      | 0155502E      | ADHP     |
| *3-letter designator* |              |               |          |
| PJ1                   | 544005N      | 0253057E      | OTHER    |
| PJ2                   | 554243N      | 0211434E      | OTHER    |
| PJ3                   | 561350N      | 0221534E      | OTHER    |
| TP1                   | 481018.5959N | 0113540.1135E | ADHP     |
| TP2                   | 481314.6479N | 0113003.5398E | ADHP     |
| 13A                   | 512900.0000N | 0185100.0000E | OTHER    |
| 17A                   | 520800.0000N | 0174500.0000E | OTHER    |
| 20A                   | 514400.0000N | 0160800.0000E | OTHER    |
| 21A                   | 521300.0000N | 0162800.0000E | OTHER    |
| 27A                   | 523500.0000N | 0160500.0000E | OTHER    |
| ME1                   | 462338N      | 0155433E      | OTHER    |
| ME2                   | 463440N      | 0155009E      | OTHER    |
| DX1                   | 481323.7979N | 0122604.5443E | ADHP     |
| DX1                   | 505951.6149N | 0141519.3372E | ADHP     |
| DX2                   | 505625.7259N | 0141418.8105E | ADHP     |
| *4-letter designator* |              |               |          |
| SJ91                  | 000224S      | 1044205E      | OTHER    |
| FF36                  | 375713.7253S | 1751802.2481E | ADHP     |
| SM01                  | 464002.55N   | 0170535.52E   | ADHP     |
| SM02                  | 464750.28N   | 0165926.87E   | ADHP     |
| LDD5                  | 514138.7284N | 0191615.9435E | ADHP     |
| PG23                  | 545132N      | 0230742E      | OTHER    |
| IF09                  | 431021.1N    | 0252819.1E    | ADHP     |
| MAPT                  | 492818.3679N | 0083229.2734E | ADHP     |
| SDF2                  | 495218.7277N | 0112216.9347E | ADHP     |
| FF16                  | 513503.7055N | 1124320.1363W | ADHP     |
| ECHO                  | 504818N      | 0051950E      | ADHP     |
| ECHO                  | 482129.75N   | 0703422.93W   | OTHER    |
    
</details>

---

## `GeographicalPosition`

FIXM captures the concept of Geographical Position as defined by ICAO
Annex 15.

*Position (geographical). Set of coordinates (latitude and longitude)
referenced to the mathematical reference ellipsoid which define the
position of a point on the surface of the Earth.*

This model element maps to the ISO 19107 “Point” construct, defined as a
single location given by a direct position.

A geographic location consists of a co-ordinate reference system and
geographic co-ordinates.

### Co-Ordinate Reference System

ICAO Annex 11 chapter 2.29.1 states that World Geodetic System — 1984
(WGS-84) shall be used as the horizontal (geodetic) reference system for
air navigation. The Coordinate Reference System reference is critical
for the correct encoding and processing of FIXM positions. 

>*This is because a CRS not only indicates the geodetic datum and ellipsoid for
which point coordinates are expressed but also the order of the
coordinate axes in which coordinate values are provided, e.g. latitude
before longitude – which is an important convention for the aviation
domain.*
>
> -- <cite>OGC 12-028r1 <sup>[[O-03]](#references)</sup></cite>

The EPSG:4326 CRS is the recommended choice for AIXM 5.1 data sets that
use the WGS-84 reference datum.

FIXM implements a fixed co-ordinate reference system: `urn:ogc:def:crs:EPSG::4326`.

### Geographic Co-Ordinates

The EPSG:4326 CRS has latitude as the primary axis, which indicates that
**the order of the values in the fb:pos element is** **first latitude**,
**second longitude**. This ordering convention is the one applied to the
aviation domain.

The co-ordinates are represented in FIXM by a two-valued sequence,
the first being the latitude and the second being the longitude, each of
which is a floating point number (the decimal value in degrees). The
direction is determined by the sign of the value, as specified in the
next table.

| Sign     | Latitude | Longitude |
|----------|----------|-----------|
| Positive | N        | E         |
| Negative | S        | W         |

Note the latitude and longitude values are encoded as double in FIXM.
Imposition of range restriction (-90≤latitude≤90, -180≤longitude≤180)
does not appear in the model since different elements of the sequence of
values have different constraints.

### Examples

#### Example

```xml
<fb:position srsName="urn:ogc:def:crs:EPSG::4326">
    <fb:pos>59.0 -30.0</fb:pos>
</fb:position>
```

#### Example


```xml
<fx:point4D srsName="urn:ogc:def:crs:EPSG::4326">
    <fb:pos>50.03330555555556 8.570455555555556</fb:pos>
```

On EXAMPLE 1 above, number `59.0` represents the latitude and number
`-30.0` represents the longitude.

### Miscellaneous

The W3C XML schema 1.0 specification defines three special values for
float/double: positive infinity, negative infinity and not-a-number. In
this context, a `pos` element expressed as `<fb:pos>INF -INF</fb:pos>` or `<fb:pos>NaN NaN</fb:pos> ` would be syntactically correct; it would validate against the core FIXM XML
schemas. However, it would not represent any plausible location. The use
of these special values is therefore not accepted when exchanging
geographical positions in FIXM.

### Why FIXM does not use the Geography Markup Language (GML)

FIXM does not adopt the GML standard for the representation of
geospatial data. The reasons for not adopting GML are the following:

-   Wherever a GML dependency is introduced, there would be a need for
    users to use the GML schemas and therefore to understand GML, which
    increases implementation costs.

-   The Flight Planning community is not traditionally familiar with
    geospatial concepts. The introduction of GML would become an
    important drawback for FIXM adoption in support of FF-ICE/R1.

-   Introducing a dependency on GML would make FIXM more difficult to
    implement particularly in certain environments. For instance, .NET
    technologies have been identified as *incompatible* with the GML
    usage.



### Notes
[1]: FIXM does not use GML but mimics it for geographic positions. GML encodes geographic locations as sequences of values since it employs the same construct to represent polygons.

--- 

## `Navaid`

#### OPTION 1 - Minimum Reference

As a minimum, the coded designator of a navaid shall be provided, as
published in the AIPs.

#### OPTION 2 - Unambiguous Reference

*(OPTION 2 = OPTION 1 + supplementary position & navaidServicetype
information)*

The coded designator of a navaid is not always sufficient for
unambiguously referring to that element. The en-route navaids (VOR, DME,
NDB) designator is supposed to be unique (according to ICAO Annex 11)
within 600 NM. This means that these designators are not unique
world-wide. For airport navaids, there is no limitation.

FIXM adds two optional properties 'position' and 'navaidServiceType'
which may be used as a complement to the 'designator' information in
order to remove any ambiguity on the designator.

Important note: the combination of fields \[designator + position +
navaid service type\] shall not be interpreted as a natural key uniquely
identifying the navaid, in so far as producing and consuming
systems/services may use different aeronautical information sources with
different degree of precisions for lat/long, leading to small variations
of the position information. The supplementary fields shall be used for
disambiguation purposes only (i.e. plausibility checks based on position
and navaid service type) in case of duplicates/triplicates/…

#### OPTION 3 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 3 = OPTION 1 + supplementary hypertext reference)*

Option 3 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### OPTION 4 - Complete Reference

*(OPTION 4 = OPTION 2 + OPTION 3)*

Option 4 corresponds to the combination of Option 2 and Option 3. See
explanations above.

#### Examples (NOT for OPERATIONAL USE)

The table below depicts examples of FIXM references to fictitious VOR
DME “BOR” that is ‘published’ in AIXM 5.1 as part of the fictitious
Donlon dataset<sup>[[O-01]](#references)</sup>.
The data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. The examples shall NEVER BE USED AS OPERATIONAL DATA.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of Navaid references in FIXM</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td><p>

```xml
<fb:navaid>
   <fb:designator>BOR</fb:designator>
</fb:navaid>
```

</p></td>
<td>This is the minimum reference that SHALL be provided.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+position<br />
+navaidServiceType</p></td>
<td>

```xml
<fb:navaid>
   <fb:designator>BOR</fb:designator>
   <fb:navaidServiceType>VOR_DME</fb:navaidServiceType>
   <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>52.36833333333333 -32.375</fb:pos>
   </fb:position>
</fb:navaid>
```

</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><strong>OPTION 3</strong></p>
<p>designator<br />
+href</p></td>
<td><p>

```xml
<fb:navaid href="urn:uuid:08a1bbd5-ea70-4fe3-836a-ea9686349495">
   <fb:designator>BOR</fb:designator>
</fb:navaid>
```

</p></td>
<td>Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 4</strong></p>
<p>designator<br />
+position<br />
+navaidServiceType<br />
+href</p></td>
<td><p>

```xml
<fb:navaid href="urn:uuid:08a1bbd5-ea70-4fe3-836a-ea9686349495">
   <fb:designator>BOR</fb:designator>
   <fb:navaidServiceType>VOR_DME</fb:navaidServiceType>
   <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
      <fb:pos>52.36833333333333 -32.375</fb:pos>
   </fb:position>
</fb:navaid>
```

</p></td>
<td></td>
</tr>
</tbody>
</table>



## `RunwayDirectionDesignator`

#### OPTION 1 - Minimum Reference

The minimum Runway Direction reference shall consist of the Runway
Direction designator.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### Examples (NOT for OPERATIONAL USE)

The table below depicts examples of FIXM references to fictitious Runway
Direction “09L” that is ‘published’ in AIXM 5.1 as part of the
fictitious Donlon
dataset<sup>[[O-01]](#references)</sup>. The
data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. The examples shall NEVER BE USED AS OPERATIONAL DATA.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of Runway Direction references in FIXM</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td>

```xml
<fx:runwayDirection>09L</fx:runwayDirection>
```

</td>
<td>This is the minimum reference that SHALL be provided.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td>

```xml
<fx:runwayDirection href="urn:uuid:c8455a6b-9319-4bb7-b797-08e644342d64">09L</fx:runwayDirection>
```

</td>
<td>Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.</td>
</tr>
</tbody>
</table>

## `RouteDesignator`

#### OPTION 1 - Minimum Reference

The minimum Enroute ATS Route reference shall consist of the Enroute ATS
Route designator as published in the AIP. Enroute ATS Route designators
are not unique. However, the systematic pairing of an ATS route
designator with a route point (i.e. a significant point belonging to
that ATS route) in FIXM is considered sufficient for enabling
unambiguous identification of the ATS Route being referred to.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### Examples (NOT for OPERATIONAL USE)

The table below depicts examples of FIXM references to fictitious
Enroute ATS Route “UA4” that is ‘published’ in AIXM 5.1 as part of the
fictitious Donlon
dataset<sup>[[O-01]](#references)</sup>. The
data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. The examples shall NEVER BE USED AS OPERATIONAL DATA.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of EnRoute ATS Route references in FIXM</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td>

```xml
<fx:routeDesignator>UA4</fx:routeDesignator>
```

</td>
<td>This is the minimum reference that SHALL be provided.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td>

```xml
<fx:routeDesignator href="urn:uuid:a14a8751-5428-46bc-a2d1-32ef84d37b5c">UA4</fx:routeDesignator>
```

</td>
<td>Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.</td>
</tr>
</tbody>
</table>

## `SidStarReference`

#### OPTION 1 - Minimum Reference

The minimum SID or STAR reference shall consist of the SID or STAR
designator as published in the AIP.

#### OPTION 2 - Minimum Reference with Supplementary AIXM Pointer

*(OPTION 2 = OPTION 1 + supplementary hypertext reference)*

Option 2 corresponds to Option 1 with an additional hypertext reference
as described in [Hypertext References] above.

#### Examples (NOT for OPERATIONAL USE)

The table below depicts examples of FIXM references to SID “AMOLO 5B”
that is published in the French AIPs.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of SID references in FIXM</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td><p>

```xml
<fx:standardInstrumentDeparture>
   <fb:designator>AMOLO5B</fb:designator>
</fx:standardInstrumentDeparture>
```

</p></td>
<td>This is the minimum reference that SHALL be provided.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td><p>

```xml
<fx:standardInstrumentDeparture href="urn:uuid:...">
   <fb:designator>AMOLO5B</fb:designator>
</fx:standardInstrumentDeparture>
```

</p></td>
<td>Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.</td>
</tr>
</tbody>
</table>

FIXM also supports the supplementary provision of the abbreviated
designator of the SID which is commonly used in FMS
databases and in some ground automation systems. The ‘abbreviated
designator’, if provided, should be the designator obtained after
applying the rules for shortening names specified by the ARINC 424
specification, chapter 7.4. Example:

```xml
<fx:standardInstrumentDeparture>
   <fb:abbreviatedDesignator>AMOL5B</fb:abbreviatedDesignator>
   <fb:designator>AMOLO5B</fb:designator>
</fx:standardInstrumentDeparture>
```

The table below depicts examples of FIXM references to STAR “KOVUK 7D”
that is published in the Argentinian AIPs.

<table>
<thead>
<tr class="header">
<th></th>
<th><strong>Examples of STAR references in FIXM</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>OPTION 1</strong></p>
<p>designator</p></td>
<td><p>

```xml
<fx:standardInstrumentArrival>
   <fb:designator>KOVUK7D</fb:designator>
</fx:standardInstrumentArrival>
```

</p></td>
<td>This is the minimum reference that SHALL be provided.</td>
</tr>
<tr class="even">
<td><p><strong>OPTION 2</strong></p>
<p>designator<br />
+href</p></td>
<td><p>

```xml
<fx:standardInstrumentArrival href="urn:uuid:...">
   <fb:designator>KOVUK7D</fb:designator>
</fx:standardInstrumentArrival>
```

</p></td>
<td>Hypertext reference to be provided in accordance with the <a href="https://aixm.aero/sites/default/files/imce/AIXM51/aixm_feature_identification_and_reference-1.0.pdf"><em>AIXM feature Identification and Reference document</em></a>, chapter 3.4.1.</td>
</tr>
</tbody>
</table>

FIXM also supports the supplementary provision of the abbreviated
designator of the STAR which is commonly used in FMS
databases and in some ground automation systems. The ‘abbreviated
designator’, if provided, should be the designator obtained after
applying the rules for shortening names specified by the ARINC 424
specification, chapter 7.4. Example:

```xml
<fx:standardInstrumentArrival>
   <fb:abbreviatedDesignator>KOVU7D</fb:abbreviatedDesignator>
   <fb:designator>KOVUK7D</fb:designator>
</fx:standardInstrumentArrival>
```


### Notes

[1]: This design is intentional. It saves FIXM from being tied to an external standard for such a small use case and also aims to avoid potential issues or difficulties when marshalling / unmarshalling the standard xlink:href attribute.


## `RelativePoint`

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

### Examples

!> This section depicts examples of FIXM encodings of relative points
that are derived from the fictitious Donlon
dataset<sup>[[O-01]](#references)</sup>. The
data is entirely fictitious, located somewhere in the middle of the
Atlantic Ocean. **The examples shall never be used as operational data**.

#### Example of relative point in FIXM without position information

```xml
<fb:relativePoint>
    <fb:bearing uom="DEG" zeroBearingType="MAGNETIC_NORTH">82.0</fb:bearing>
    <fb:distance uom="NM">2.0</fb:distance>
    <fb:referencePoint>
        <fb:designator>BOR</fb:designator>         <!--(*)-->
    </fb:referencePoint>
</fb:relativePoint>
```

(*) See chapter [References to Navaid]. All four options can be used for encoding this reference. OPTION 1 is used in this example.

#### Example of relative point in FIXM with position information

```xml
<fb:relativePoint>
    <fb:bearing uom="DEG" zeroBearingType="TRUE_NORTH">180</fb:bearing>
    <fb:distance uom="NM">60.0</fb:distance>
    <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
        <fb:pos>51.36833333333333 -32.375</fb:pos>
    </fb:position>
    <fb:referencePoint>
        <fb:designator>BOR</fb:designator>         <!--(*)-->
    </fb:referencePoint>
</fb:relativePoint>
```


## *References* <!-- {docsify-ignore} -->

### ICAO References

[I-07]: [ICAO Doc 7910](https://www.icao.int/safety/OPS/OPS-Tools/Pages/location-indicator.aspx) - Location Indicators

### Other References

[O-01]: [Donlon AIP data Set](https://github.com/aixm/donlon) - A fictitious set of digital AIS data sets complying with the ICAO Annex 15, 16th edition and the new PANS-AIM provisions, in AIXM 5.1.1 format.

[O-02]: [W3C XML Linking Language (xlink) v1.1](https://www.w3.org/TR/xlink11/)

[O-03]: [OGC 12-028r1](https://portal.opengeospatial.org/files/?artifact_id=62061) - Use of Geography Markup Language (GML) for Aviation Data


<!-- Other Links -->
[AerodromeReferenceType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_AerodromeReferenceType.html
[AeronauticalReference.xsd]: https://www.fixm.aero/releases/FIXM-4.3.0/schemas/core/base/AeronauticalReference.xsd
[AirspaceDesignatorType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_AirspaceDesignatorType.html
[AtcUnitReferenceType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_AtcUnitReferenceType.html
[DesignatedPointType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_DesignatedPointType.html
[GeographicalPositionType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_GeographicalPositionType.html
[NavaidType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_NavaidType.html
[RunwayDirectionDesignatorType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_RunwayDirectionDesignatorType.html
[RouteDesignatorType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_RouteDesignatorType.html
[SidStarReferenceType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_SidStarReferenceType.html
[RelativePointType]: https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_RelativePointType.html


[References to Navaid]: general-guidance/fb_AeronauticalReference?id=navaid
[Hypertext References]: general-guidance/fb_AeronauticalReference?id=hypertext-references

[US FAA’s publication of Instrument Flight Procedures encodings in ARINC 424-18 format]: https://www.faa.gov/air_traffic/flight_info/aeronav/digital_products/cifp/download/
