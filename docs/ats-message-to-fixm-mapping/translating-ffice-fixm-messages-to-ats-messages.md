# Translating FF-ICE FIXM Messages to ATS Messages

## Target Audience

This chapter targets FIXM implementers who want to realise a conversion from FF-ICE Messages to ATS message content.

## Overview

The transition from present day practices to FF-ICE operations is likely to be somewhat protracted. This is recognised by the ICAO  ATMRPP in the FF-ICE/R1 Provisions <sup>[[I-11]](#references)</sup> and the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#references)</sup>, and by the ICAO IMP in in the System Wide Information Management (SWIM) Manual <sup>[[I-10]](#references)</sup>. During that transition period, there will be stakeholders who are able to send and receive flight plan information employing FIXM, while others will employ ICAO ATS messages. In such a hybrid environment, it is expected that a significant effort will be expended translating between the FIXM format and the ATS message format. It is critical for interoperability purposes, and to ensure meaning is not lost in translation, that the conversion between FIXM and ATS message content is precisely defined, and that all stakeholders employ the same translation rules.

There is not a direct correspondence between ATS messages and FIXM, though there is a close association. At the message level, the association is with the FF-ICE messages described in [this chapter](fixm-in-support-of-ffice/message-templates?id=overview). The mapping from FF-ICE Messages to ATS messages focuses on the individual ATS message fields (7, 8, etc.) rather than the messages themselves. In general, the mapping is independent of the message type: regardless of which ATS message field 7 appears in, the aircraft identification always maps to the same FIXM element. In the cases where an ATS message field item maps to different FIXM elements based on the message type (e.g. field 13b is estimated off block time in a FPL, but actual take off time in a DEP), that difference is made explicit in the mapping rule.

## ATS Message Content to FIXM Logical Model Map

### Purpose & Scope

This chapter provides a mapping between the FIXM Logical Model v4.3.0
and International Civil Aviation Organisation (ICAO) Air Traffic
Services (ATS) message content as defined in ICAO Doc 4444
\[PANS-ATM\] <sup>[[I-04]](#references)</sup>.
Within the context of FF-ICE, translation between FIXM and ATS is
uni-directional from FIXM into ATS. However, the mapping presented here
provides traceability *from* ATS message content *to* FIXM content for
better readability and to ensure complete coverage of the ATS messages.
It also provides symmetric mapping guidelines as needed between ICAO Doc
4444 \[PANS-ATM\] ATS message fields and FIXM Logical Model elements. It
is believed this additional mapping detail will aid users familiar with
the PANS-ATM but new to FIXM in their understanding of the FIXM model.

The scope of this chapter covers all message content defined in appendix
3 of PANS-ATM <sup>[[I-04]](#references)</sup>.
Supporting descriptions are provided where the mapping from ATS message
content to the FIXM Logical Model is not clear. The reader is assumed to
be familiar with ICAO ATS messages and the FIXM Logical Model.

This chapter does not address the FIXM Extensible Markup Language (XML)
schemas. The mapping from the FIXM Logical Model to the XML schemas is
relatively straightforward.

### Guidelines

[Section (Mapping of ATS Fields to FIXM)](ats-message-to-fixm-mapping/mapping-of-ats-fields-to-fixm) provides
the mapping between the individual data elements in ATS messages and the
corresponding elements in the FIXM Logical Model. However, it is not
always obvious how the structural aspects of an ATS message and a FIXM
object correlate. This section provides explanation and guidelines where
the translation is not clear.

The ATS message format consists of a mixture of structured and free
text. The free text components create problems when decoding ATS
messages. The format of ATS messages is, in part, dictated by the need for
such messages to be readable by a human (presentation is a concern),
whereas FIXM focuses mainly on content and structure (presentation
is less of a concern). Those free text aspects of ATS messages that cause
difficulties when decoding are highlighted and discussed.

#### Emergency Message Originator

ATS field 5b is the originator of the emergency message. It consists of
eight letters: location indicator (4), ATS unit designator (3), and
either X or a letter identifying the ATS unit division.

-   When creating a FIXM object from ATS message content, the first four
    letters from 5b will be placed in `locationIndicator` and the
    remainder in `atcUnitNameOrAlternate`.

-   When creating ATS message content from a FIXM object, it is only
    possible to create a valid ATS message field 5b from FIXM if the
    `locationIndicator` attribute is present and the 
    `atcUnitNameOrAlternate` attribute is three or four upper case
    letters. If it is three letters, add an X to the end.

#### SSR Mode

ATS field 7b is Secondary Surveillance Radar (SSR) mode. PANS-ATM
restricts this to mode A only. FIXM supports SSR codes but does not
include explicitly a field for mode (that mode A alone is supported is
implicit in the class name:` ModeACode`).

When creating ATS message content from a FIXM object, set the SSR mode
(field 7b) to A.

#### Number of Aircraft

ATS field 9a is the total number of aircraft (if more than one). This field is only used in the case of formation flights. The PANS-ATM restricts this value to be in the range 2 through 99. FIXM does not represent this number directly. Rather, it can be derived by adding up the individual values for each `aircraftCount` field.

When creating ATS message content from a FIXM object, the sum of all of the individual `aircraftCount` fields is used for field 9a. If the sum is greater than 99, truncate to 99.

A similar comment applies to other ATS message fields that contain counts where FIXM is less restrictive:

-   Field 19b (range 1..999);

-   Field 19f (range 1..99 for number of dinghies, 1..999 for dinghy capacity).

#### Wake Turbulence Category

PANS-ATM supports wake turbulence categories `L`, `M` and `H` (field 9c).
However, aircraft operators who operate A380's often specify a wake
turbulence category of `J`. FIXM supports the value `J`.

Since `J` is in common use, when creating ATS message content from a FIXM
object, if wake turbulence category `J` is specified, include that value
in the ATS message.

#### Navigation/Communication Capabilities

##### No or Unserviceable Equipment

The value N in field 10a of an ATS messages indicates, "no
COM/NAV/approach aid equipment for the route to be flown is carried, or
the equipment is unserviceable". FIXM does not explicitly model the
field 10a code `N`. Rather it leaves that code implicit to avoid
redundancy. The relevant items in the FIXM Logical Model are
class `FlightCapabilities` and its associations `navigation`, 
`communication` and `standardCapabilities`.

-   When creating a FIXM object from ATS message content, ignore
    code `N` in field 10a <sup>[[note 1]](#notes)</sup>.

-   When creating ATS message content from a FIXM object, insert `N` in
    field 10a if an instance of class `FlightCapabilities` is absent, or
    it is present and associations `navigation`, `communication` and 
    `standardCapabilities` are all absent.

##### Standard Equipment

The value `S` in field 10a of an ATS message indicates, "Standard
COM/NAV/approach aid equipment for the route to be flown is carried and
serviceable". `S` is not specific to navigation or communication
capabilities. As such, FIXM represents standard equipment and
capabilities via the class `StandardCapabilitiesIndicator` that is 
associated with `FlightCapabilities`.

##### PBN Approved

The value `R` in field 10a of an ATS message indicates performance based
navigation (PBN) capability codes are included in field 18 PBN. FIXM
does not explicitly model the field 10a code `R`. Rather it leaves that
code implicit to avoid redundancy.

-   When creating a FIXM object from ATS message content, ignore
    code `R` in field 10a <sup>[[note 2]](#notes)</sup>.

-   When creating ATS message content from a FIXM object, insert `R` in
    field 10a if one or more PBN codes are present in the navigation
    capabilities.

##### Other Equipment and Capabilities

The value `Z` in field 10a of an ATS message indicates that other
communication/navigation capabilities are defined in field 18 (NAV, COM,
DAT). FIXM does not explicitly model field 10a code `Z`. Rather, it leaves
that code implicit to avoid redundancy.

-   When creating a FIXM object from ATS message content, ignore
    code `Z` in field 10a <sup>[[note 3]](#notes)</sup>.

-   When creating ATS message content from a FIXM object, insert `Z` in
    field 10a if at least one of the "other navigation, communication or
    datalink capabilities" fields is present in the FIXM object.

PANS-ATM states: *If the letter `G` is used, the types of external GNSS
augmentation, if any, are specified in item 18 following the indicator
NAV/*. An ATS message may have content in field 18 NAV/ with `G` in field
10a but not `Z`. The above rule always inserts `Z` in field 10a if there is
content in field 18 NAV/. Consequently, an ATS-FIXM-ATS round trip may
insert a `Z` in field 10a that was not in the original ATS message.

##### Equipment/Capabilities Example

The following code block presents a flight plan in ICAO 4444 format,
with equipment and capabilities related to navigation and communication
highlighted.

> (FPL-QFA8-IS<br>
> -B744/H-<mark>SDE2E3FGHIJ3J5M1RWYZ</mark>/LB1D1<br>
> -KDFW0400<br>
> -N0501F280 DCT ABI J4 INK/N0504F300 J50 ELP J26 HMO V2 GRN<br>
> 2704N11627W 26N119W 2544N12000W 24N126W/M084F320 22N133W 19N139W<br>
> 16N144W/M084F340 11N152W 06N159W/M084F360 01N166W 01S169W<br>
> 0500S17435W 06S176W 12S176E/M084F380 18S168E 2125S16300E GUXIB R587<br>
> HARVS Q21 SAVER G329 BN DCT<br>
> -YBBN1519<br>
> -<mark>PBN/A1B1D1L1S1 NAV/GPSRNAV RNVD1A1</mark> DOF/191003 REG/VHOEG<br>
> DLE/INK0100 26N119W0200 SEL/MQDE<br>
> PER/D RIF/GUXIB R587 MEPAB G591 LTO NWWW)<br>

The image below presents the equipment/capabilities portion of the
flight plan as a FIXM object model. Only the highlighted items in the
code block above are included in the diagram.

![Image](.//media/translating-ffice-image1.png)

#### Surveillance Capabilities

The value `N` in field 10b of an ATS messages indicates, "no surveillance
equipment for the route to be flown is carried, or the equipment is
unserviceable". FIXM does not explicitly model the field 10b code `N`.
Rather it leaves that code implicit to avoid redundancy. The relevant
items in the FIXM Logical Model are class `FlightCapabilities` and its
association `surveillance`.

-   When creating a FIXM object from ATS message content, ignore
    code `N` in field 10b <sup>[[note 4]](#notes)</sup>.

-   When creating ATS message content from a FIXM object, insert `N` in
    field 10b if an instance of class `FlightCapabilities` is absent, or
    it is present but no surveillance capability codes are present.

#### Date/Time/Duration Specification

##### UTC

Date/time values in ATS messages are always expressed in Coordinated
Universal Time (UTC). Likewise, FIXM requires times to be expressed in
UTC.

A constraint is placed on class `Base.Types.DateTimeUtc`, the class used 
to represent most date/time values in FIXM, such that only UTC times can 
be expressed. The constraint mandates that the time zone is `Z`.

Example: 20<sup>th</sup> July 1969 at 20:18UTC is expressed as

`1969-07-20T20:18:00Z`

In ATS messages, times are expressed in hours and minutes only, while
FIXM supports seconds and, in some cases, fractions of seconds. When 
converting FIXM to ATS message content, times should be truncated to 
only include hours and minutes.

##### Date of Flight

The flight departure time is encoded in field 13b of an ATS message, and
is expressed as a four digit UTC value (HHMM). The date on which the
flight departs optionally appears in field 18 DOF (YYMMDD). FIXM encodes
such values as a full date/time, not as distinct date and time values.
As such, the full and unambiguous departure date/time of a flight is
composed from fields 13b and 18 DOF <sup>[[note 5]](#notes)</sup>.

The image below presents the object model corresponding to highlighted
parts of the following flight plan fragment.

> -YSSY<mark>2315</mark><br>
> -N0501F280 ...<br>
> -YBBN0115<br>
> -<mark>DOF/210403</mark><br>

![Image](.//media/translating-ffice-image2.png)

##### Estimated Flight Time

ATS field 16b is the total estimated elapsed time from take-off to
landing, consisting of four digits in HHMM format. FIXM models this as a
duration which may be of arbitrary length. Consequently, a FIXM flight
may include a duration that is not expressible in an ATS message.

The same comments applies to other ATS message fields that contain
durations:

-   Field 18 EET;

-   Field 18 DLE;

-   Field 19a.

#### Route

An ATS message route description (field 15) is captured in FIXM by
class `RouteTrajectoryGroup` in
package `Flight.FlightRouteTrajectory.RouteTrajectory`.

The initial cruising speed (field 15a) and level (field 15b) are
captured in class `FlightRouteInformation`. Field 15b of an ATS route may
contain the token VFR instead of a level. In that case, the 
`cruisingLevel` attribute of `FlightRouteInformation` should make use of
the `visualFlightRules` association between 
`FlightLevelOrAltitudeOrVfrChoice` and `VisualFlightRulesLevel` to 
indicate this.

The route is modelled as a series of route elements
(class `RouteTrajectoryElement`), each consisting of a route point and 
the designator of the ATS route to the next point, together with 
associated information such as delays or speed/level changes.

Note this package also accommodates 4D trajectories. Hence, it is far
richer in content than is required for ATS message routes. When mapping
from ATS messages to FIXM there is no requirement to create a
corresponding 4D trajectory.

##### Varieties of Route

The mapping from field 15 to FIXM is complicated by the fact that the FIXM
`Flight` class can be associated with up to four route/trajectories. The 
associations are:

-   desired (by the eAU)

-   negotiating (exchanged between eASP and eAU during the Planning and/or 
    Filing Phase)

-   agreed (by the eASP and eAU during the Planning and/or Filing Phase)

-   current (latest known information)

When mapping ATS message content to FIXM, it must be decided which of
the associations is employed to model the route information. Such a
decision cannot be made with respect to field 15 in isolation. The
decision is dependent on the message type in which the route occurs.
Table 1 presents the mapping between kinds of route and the message
types that contain field 15 (including those where field 15 is
incorporated in field 22).

Table 1: Messages Types Supporting Field 15

  | Message Type    | Route Association |
  |:----------------|:------------------|
  |ALR              |current            |
  |FPL              |desired            |
  |CHG              |desired            |
  |CPL              |current            |   
  |CDN              |current            |

##### Route Text

The primary purpose of FIXM is to provide a structured representation of
flight information, with individual elements clearly delineated to
ensure the intent of the route is communicated unambiguously. The
attribute `routeText` in class `FlightRouteInformation` allows the text of a
route description, namely the content of field 15c in the ATS message,
to be recorded in the model. This is provided to support legacy systems,
and to support stakeholders who may not be in full possession of all
necessary aeronautical resource information. When translating from field
15c of an ATS message to FIXM the route structure should be decoded and
made explicit.

-   When creating a FIXM object from ATS message content, whenever
    possible decode the route and populate the FIXM route structure.

-   When the FIXM route structure is populated, population of the route
    text is optional.

-   For legacy systems where it is not possible to decode the route, the
    route text only may be populated.

-   When the route text is populated, strip leading and trailing white
    space, and replace multiple contiguous white space characters by a
    single space.

-   When creating ATS message content from FIXM, if the route structure
    is available, create the field 15c text from the route structure
    (even if the route text is available).

-   Never populate the route text with anything other than a string that
    complies with the PANS-ATM field 15c route definition.

##### SID and STAR

A SID, if present in the route, is the first item in the route
description. A STAR, if present in the route, is the last item in the
route description. FIXM encodes the SID and STAR as route designators in
the route:
attributes `standardInstrumentDeparture` and `standardInstrumentArrival` in
class `RouteDesignatorToNextElementChoice`.

When creating a FIXM object from ATS message content:

-   A SID, if included in a route, must appear in the first element of
    the sequence of instances of `RouteTrajectoryElement`.

-   A STAR, if included in a route, must appear in the second to last 
    element of the sequence of instances of `RouteTrajectoryElement` 
    (with the final instance containing the destination aerodrome and
    no `routeDesignatorToNextElement`).

The images below present, respectively, the object model corresponding to
the SID and STAR in the following route string.

> Route String: <mark>MRSSH2</mark> ZALEA DCT SWB DCT HRV Q105 BLVNS Y290 BAGGS <mark>SSCOT5</mark><br>
>          SID: MRSSH2<br>
>         STAR: SSCOT5<br>

![Image](.//media/translating-ffice-image14.png)

![Image](.//media/translating-ffice-image15.png)

##### Direct Route Segments

In ICAO ATS messages, the presence of DCT between two route points
indicates the aircraft will fly between the points outside a designated
ATS route. In the ICAO ATS message, it is also allowed to specify two
consecutive route points that are separated neither by an ATS route
designator nor by DCT; this is most commonly seen in User Preferred
Routes (UPR). In such a case there is an implied DCT between the route
points.

FIXM models DCT through class `OtherRouteDesignator`, related to
class `RouteDesignatorToNextElementChoice` by association
`otherRouteDesignator`.

-   When creating a FIXM object from ATS message content, indicate a
    direct route segment by setting association `otherRouteDesignator` 
    to DIRECT.

-   When creating ATS message content from a FIXM object,
    if `otherRouteDesignator` is set to DIRECT, insert "DCT" into 
    the ATS route.

-   When creating ATS message content from a FIXM object, if an instance
    of class `RouteDesignatorToNextElementChoice` is not present, or is
    present and the value of attribute `otherRouteDesignator` is
    UNSPECIFIED, do not insert any text between the current and next
    point.

Refer to [Route Changes](#route-changes) for an example of "DCT" in a route.

##### Route Truncation

The token T in a route description indicates the route has been
truncated. That is, the entire route through to the destination has not
been presented. When included, the route truncation indicator must be
the last item in the route description.

Route truncation is modelled by class `RouteTruncationIndicator` in
package `RouteTrajectory`, and is associated with
class `RouteTrajectoryElement`. A route is modelled by an ordered sequence
of instances of `RouteTrajectoryElement`. The truncation indicator may
only be associated with the last element in the sequence (it is
meaningless to truncate a route prior to the last element).

Refer to [Route Changes](#route-changes) for
an example of route truncation.

##### Route Changes

Route and trajectory information is captured in the FIXM Logical Model
in package `Flight.FlightRouteTrajectory`. The route itself is captured in
sub-package `RouteTrajectory`, while changes to speed and level in a route
are captured in sub-package `RouteChanges`.

This section defines how the route changes defined in PANS-ATM are
mapped to the FIXM Logical Model. There are three variants allowed in an
ATS message: speed/level change, cruise/climb, and cruise/climb with no
specific upper limit. One example of each of those changes and how they
map to the FIXM logical model is presented in Table 2.

Table 2: Route Changes

| Example       | Description   | Modelled As   |
|:-|:-|:-|
| N0430F300     | Change TAS to 430 knots and request FL300.    | `CruisingSpeedChange` and `CrusingLevelChange`    |
| N0430F300F320 | Change TAS to 430 knots and request climb from FL300 to FL320. | `CruiseClimbStart` (with specific upper level/altitude)  |
| N0430F300PLUS | Change TAS to 430 knots and request climb commencing above FL300. | `CruiseClimbStart` (with `AtOrAboveIndicator`)  |

Notes:

-   The token `C` is inserted in a flight plan to indicate a cruise climb
    phase. This does not appear in the FIXM Logical Model. The presence
    of an instance of class `CruiseClimbStart` indicates cruise climb, as
    demonstrated in the image below.

-   The token PLUS is used to indicate a cruise climb is planned to
    commence above the specified lower level. This token does not appear 
    in the FIXM logical model. PLUS is indicated by an instance of 
    `CruiseClimbStart` where the `atOrAbove` association (between class 
    `UpperLevelChoice` and `AtOrAboveIndicator`) is set to 
    `AT_OR_ABOVE_LOWER_LEVEL`, whereas a cruise/climb with a specific upper 
    limit is indicated by an instance of `CruiseClimbStart` where the 
    `altitude` or `flightLevel` attribute of `UpperLevelChoice` is 
    populated.

-   `CrusingSpeedChange` and `CruisingLevelChange` have an optional
    association `activation`. There is no equivalent to this field in ATS
    message content.

The image below presents examples of the three kinds of level
changes.

![Image](.//media/translating-ffice-image3.png)

##### Field 15 Overall Example

The image below presents the object model corresponding to the
(contrived) ATS message field 15 route

> N0430F220 GORLO2N 3910N02230W/N0430F300 DCT C/IVA/N0430F300F320 B9 ENTRA VFR T

![Image](.//media/translating-ffice-image4.png)

##### RIF

ICAO field 18 RIF, if present, contains the route details to the revised
destination, followed by the revised destination aerodrome. This is
modelled in FIXM by class `ReclearanceInFlight` in package `Flight.Arrival`.
The route component is modelled by attribute `routeToRevisedDestination` 
and the destination by attribute `filedRevisedDestinationAerodrome`.

The route component is constructed via the same rules as for field 15c.
However, in FIXM the route to revised destination is modelled as an
unstructured string.

The image below presents the object model corresponding to field 18 RIF
of the sample flight plan in [Equipment/Capabilities Example](#equipmentcapabilities-example):

> RIF/GUXIB R587 MEPAB G591 LTO NWWW

![Image](.//media/translating-ffice-image5.png)

##### DLE

ICAO field 18 DLE, if present, contains points along the route at which
delays will occur; the aircraft essentially goes 'off plan' for the
stated duration. Each DLE point must appear in the route (field 15c).
For ATS messages, this requires that a consistency check be performed on
the flight plan to ensure the DLE points are listed in the route. FIXM
avoids the need for a check and the duplication of route points by
incorporating a delay value in the corresponding route element.
Specifically, the delay duration appears in attribute `delayValue` of
class `PlannedDelay`, which is associated with class 
`RouteTrajectoryElement`.

The `PlannedDelay` class additionally has
attributes `delayReason` and `delayReference` and assocation `delayType`. 
When creating a FIXM object from ATS message content, `delayReason`, 
`delayReference` and `delayType` should be omitted.

The image below presents the object model for a fragment of the route in
the flight plan contained in [Equipment/Capabilities Example](#equipmentcapabilities-example),
incorporating the information in field 18 DLE:

> DLE/INK0100 26N119W0200

![Image](.//media/translating-ffice-image6.png)

#### Aircraft Type

When the type of aircraft that conducts a flight does not have an ICAO
aircraft type designator \[ICAO Doc 8643\] <sup>[[I-08]](#references)</sup> or
the flight is a formation, the value ZZZZ is inserted in field 9b and
the aircraft type information is inserted in field 18 TYP. The following
fragment is an example.

> -10<mark>ZZZZ</mark>/M<br>
> ...<br>
> -<mark>TYP/2F15 4K35R 3B2</mark><br>

Note the structured nature of the TYP field: two F15s, four K35Rs, and three B2s. The value in field 18 TYP may exhibit structure as in this
example above for a formation. However, this may not be so in other
cases, where the (non-designator) type of aircraft is listed, as in

> -<mark>ZZZZ</mark>/L<br>
> ...<br>
> -<mark>TYP/ECLIPSE 500</mark><br>

The images below present the object model corresponding to each of the
above flight plan fragments.

![Image](.//media/translating-ffice-image7.png)

Notes:

- If it is not possible to decode the content of field 18 TYP, create a single instance of class `AircraftType` to record the entire content of 18 TYP under `otherAircraftType`.
- The sum of the `aircraftCount` attributes in each instance of `AircraftType` is the total number of aircraft in the formation.
- When the flight is not a formation, the `aircraftCount` attribute should be omitted.

#### Aircraft Registration

The registration mark for an aircraft may include a - character, e.g.
VH-ABC. While PANS-ATM does not explicitly state that - should be
omitted when including field 18 REG, it is rare that - is included, i.e.
VHABC is the norm. FIXM does not support - in the registration.

When creating a FIXM object from an ATS message, strip the - character
if present in the registration.

FIXM supports multiple registrations. ATS messages support a single
registration. When creating a FIXM object from an ATS message, the
registration is a sequence one length one.

When creating an ATS message from a FIXM object, if the FIXM object
contains multiple registrations, select the first registration in the
sequence.

#### Departure Aerodrome

When the departure aerodrome for a flight does not have an ICAO location
indicator code \[ICAO Doc 7910\] <sup>[[I-07]](#references)</sup>,
the value `ZZZZ` is inserted in field 13a and the departure point is
inserted in field 18 DEP. According to PANS-ATM, the content of 18 DEP is
"name and location of departure aerodrome" where the location is
expressed either as a latitude/longitude or as a bearing and distance
from a designated point. In the case the aircraft did not take off from
an aerodrome, the first point of the route or the marker radio beacon
may be specified. This can be problematic when decoding 18 DEP for the
population of FIXM:

-   Analysis of flight plans received by Airservices Australia shows
    that the majority of flight plans that include 18 DEP contain only a
    latitude/longitude in 18 DEP. This is, strictly speaking, not
    compliant with PANS-ATM, yet it is common practice.

-   The name of the departure aerodrome may consist of multiple words so
    it may not be obvious how to parse the content of 18 DEP.

The image below presents two object models corresponding to the
following flight plan fragment.

> -<mark>ZZZZ</mark>1231<br>
> ...<br>
> -<mark>DEP/WESTMEAD HOSPITAL 3349S15059E</mark><br>

![Image](.//media/translating-ffice-image8.png)

The first shows the fully decoded 18 DEP. The second shows the approach
where 18 DEP cannot be decoded successfully: insert the entire content
of 18 DEP in the name attribute of `AerodromeReference`.

When creating an ATS message from a FIXM object, if the FIXM object
contains `locationIndicator` insert its value into field 13a and ignore
the name and reference fields (if present). Otherwise, insert `ZZZZ` in 
field 13a and use a combination of name and `referencePoint` or 
`referenceRelativePoint` to create 18 DEP.

#### Destination Aerodrome

When the destination aerodrome for a flight does not have an ICAO
location indicator code \[ICAO Doc 7910\] <sup>[[I-07]](#references)</sup>,
the value `ZZZZ` is inserted in field 16a and the destination point is
inserted in field 18 DEST. According to PANS-ATM the content of 18 DEST
is "name and location of destination aerodrome" where the location is
expressed either as a latitude/longitude or as a bearing and distance
from a named significant point. This can be problematic when decoding 18
DEST for the population of FIXM:

-   Analysis of flight plans received by Airservices Australia shows
    that the majority of flight plans that include 18 DEST contain only
    a latitude/longitude in 18 DEST. This is, strictly speaking, not
    compliant with PANS-ATM, yet it is common practice.

-   The name of the departure aerodrome may consist of multiple words so
    it may not be obvious how to parse the content of 18 DEST.

Refer to section [Departure Aerodrome](#departure-aerodrome) for
an equivalent example in the context of field 18 DEP.

When creating an ATS message from a FIXM object, if the FIXM object
contains `locationIndicator` insert its value into field 16a and ignore
the `name` and reference fields (if present). Otherwise, insert
`ZZZZ` in field 16a and use a combination of name and `referencePoint` or
`referenceRelativePoint` to create 18 DEST.

#### Arrival Aerodrome

An ATS arrival message records the arrival aerodrome in field 17. If the
arrival aerodrome does not have an ICAO location indicator code, the
value `ZZZZ` is inserted in field 17a and the arrival aerodrome name is
recorded in field 17c.

FIXM accommodates both a destination (intended) aerodrome and an actual
arrival aerodrome.

-   Record the actual arrival aerodrome in
    attribute `arrivalAerodrome.locationIndicator` of
    class `Arrival`;

-   If the actual arrival aerodrome does not have an ICAO location
    indicator, record the arrival aerodrome name in
    attribute `arrivalAerodrome.name` of class `Arrival`.

The image below presents an object model for destination/arrival
information assuming reception of the FPL

> (FPL-RAQ-VG<br>
> -C172/L-V/C<br>
> -YBSU0540<br>
> -N0115A035 DCT<br>
> -<mark>YRED</mark>0021<br>
> -DOF/160502 REG/RAQ)<br>

Followed by the ARR

> (ARR-RAQ-YBSU-YRED-<mark>ZZZZ</mark>0622 <mark>CABOOLTURE</mark>)

![Image](.//media/translating-ffice-image9.png)

When creating an ATS message from a FIXM object, if the FIXM object
contains `locationIndicator`, insert its value into field 17a and ignore
the `name` field (if present). Otherwise, insert `ZZZZ` in field 17a and
insert the contents of `name` into 17c.

#### Alternate Destination

When the alternate destination aerodrome for a flight does not have an
ICAO location indicator code \[ICAO Doc 7910\] <sup>[[I-07]](#references)</sup>,
the value `ZZZZ` is inserted in field 16c and the alternate destination
point is inserted in field 18 ALTN. Although similar to 18 DEP and 18
DEST there is an added complication that up to two alternates may be
specified, hence 18 ALTN could include two name/location pairs.

The alternate destination aerodromes are captured by FIXM in
attribute `destinationAerodromeAlternate` of class `Arrival`.

The following flight plan fragment presents field 16 and field 18 items
that relate to destination aerodrome and alternates.

> -<mark>ZZZZ</mark>0035 <mark>YSBK ZZZZ</mark><br>
> ...<br>
> -<mark>DEST/WESTMEAD HOSPITAL 3349S15059E ALTN/EASTERN CREEK</mark><br>

The image below presents the FIXM representation in an object model.

![Image](.//media/translating-ffice-image10.png)

Decoding is problematic if two free text names are included in ALTN. For
example, consider the flight plan fragment

> -YSBK0035 <mark>ZZZZ ZZZZ</mark><br>
> ...<br>
> -<mark>ALTN/WESTMEAD HOSPITAL EASTERN CREEK</mark><br>

where `WESTMEAD HOSPITAL` and `EASTERN CREEK` are distinct points. None of
the tokens are a latitude/longitude or a bearing and distance, so it is
very difficult to distinguish the two points. In cases such as this, create 
a single alternate location (instance of `AerodromeReference`) and set the 
name attribute to `WESTMEAD HOSPITAL EASTERN CREEK`.

When creating an ATS message from a FIXM object, if the FIXM object
contains `locationIndicator`, insert its value into field 16c and ignore
the name and reference fields (if present). Otherwise, insert `ZZZZ` in 
field 16c and use a combination of name and `referencePoint` or 
`referenceRelativePoint` to create 18 ALTN.

#### En-Route Alternate

ICAO field 18 RALT, if present, indicates the (one or more) en-route
alternates. Each alternate is one of:

-   ICAO location indicator;

-   Aerodrome name and/or geographic location as a latitude/longitude or bearing and distance from a navaid.

An en-route alternate is represented in the model by attribute 
`alternateAerodrome` of class `EnRoute` in package `Flight.EnRoute`.
Each alternate is an `AerodromeReference` (see [this chapter](general-guidance/references-to-published-aeronautical-information?id=references-to-aerodromes)).

The image below presents two possible object models that represent the en-route
alternate listed below.

> RALT/YSBK WESTMEAD HOSPITAL 3349S15059E

![Image](.//media/translating-ffice-image11.png)

As for other field 18 entries, decoding 18 RALT can be problematic.  The first 
object shows the fully decoded 18 RALT. The second shows the approach where 
18 RALT cannot be decoded successfully: inserting the entire content of 18 RALT 
in the name attribute of `AerodromeReference`.

When creating an ATS message from a FIXM object, if the FIXM object contains more 
than one viable RALT identifier, use `locationIndicator` (if available) and ignore 
the other fields.  Otherwise, use `name` and `referencePoint` or 
`referenceRelativePoint` for creating 18 RALT.

#### Take-off Alternate

ICAO field 18 TALT, if present, indicates the (one or two) take-off
alternates. Each alternate is one of:

-   ICAO location indicator;

-   Aerodrome name and/or geographic location as a latitude/longitude or bearing and distance from a navaid.

A take-off alternate is represented in the model by
attribute `takeOffAlternateAerodrome` of class `Departure` in
package `Flight.Departure`. Each alternate is
an `AerodromeReference` (see [this chapter](general-guidance/references-to-published-aeronautical-information?id=references-to-aerodromes)).

Refer to section [En-Route Alternate](#en-route-alternate) for
an equivalent example in the context of en-route alternate.

When creating an ATS message from a FIXM object, if the FIXM object contains more 
than one viable TALT identifier, use `locationIndicator` (if available) and ignore 
the other fields.  Otherwise, use `name` and `referencePoint` or 
`referenceRelativePoint` for creating 18 TALT.

#### Air Filed

When a flight plan is filed in the air, the value AFIL is inserted in field 13a and the ATS unit from which supplementary flight plan information can be obtained is specified in field 18 DEP. When creating a FIXM object from an ATS message, the following rules should be applied:

-   Populate either the `locationIndicator` or `atcUnitNameOrAlternate` attribute (whichever is appropriate given the information provided) under `Flight.supplementaryInformation.supplementaryInformationSource.unit` with the contents of field 18 DEP.

-   Populate `Flight.departure.airfileIndicator` with the constant value AIRFILE.

-   Populate `Flight.departure.estimatedRouteStartTime` with the time provided in field 13b.

-   Populate the relevant option under `Flight.departure.departurePoint` with the first significant point in the route (if available).

When creating an ATS message from a FIXM object, the presence of AIRFILE under `Flight.departure.airfileIndicator` will indicate the need to place AFIL in field 13a.  Extract the other needed information from the FIXM fields specified above to populate fields 13b and 18 DEP.

The image below presents the FIXM representation of the following air
filed flight plan (fragment) as an object model.

> -AFIL1254
> ...
> -DEP/YBBBZQZA

![Image](.//media/translating-ffice-image12.png)

#### Remarks

The remarks item (RMK/) of field 18 of a flight plan maps to
attribute `remarks` of class `Flight`. The content of remarks should not
include the RMK/ label. That is, a flight plan containing

> RMK/TCAS II EQUIPPED

results in

> remarks = TCAS II EQUIPPED

The same is true of all field 18 items. The item label is not included
in the content; it is implied by the structure.

#### Supplementary Information

Supplementary information (field 19) contains additional information
about a flight that is not transmitted in the flight plan.

Field 19b is the number of persons on board. Appendix 2 of PANS-ATM
suggests `TBN` is inserted in field 19b if the number of persons on board
is not known. Appendix 3 suggests field 19b is omitted if the value is
not known. FIXM does not allow a distinction between the absence of
field 19b and its presence with value `TBN`.

-   When converting ATS message content to FIXM, if field 19b is
    populated with `TBN`, omit the `personsOnBoard` attribute from the
    FIXM `SupplementaryInformation` class.

-   When converting a FIXM object to ATS message field 19, if
    the `personsOnBoard` attribute is absent, do not include any text for
    field 19b.

The above rule means an ATS-FIXM-ATS round trip would cause the
text `P/TBN` to be removed from the original ATS message.

The image below presents the object model corresponding to the following
field 19 example.

> --E/0745 P/6 R/VE S/M J/L D/2 8 C YELLOW A/YELLOW RED TAIL N/145E C/SMITH

![Image](.//media/translating-ffice-image13.png)

#### Alerting Search and Rescue Information

Field 20 of an ATS message, alerting search and rescue information,
consists of eight items, each of which, if not known by the originator,
is replaced by `NIL` or `NOT KNOWN`. 

-   When converting ATS message content to FIXM, if an entry is `NIL` 
    or `NOT KNOWN`, it should be omitted in the FIXM version.

-   When converting a FIXM object to ATS message field 20, if a field 
    is absent in the FIXM version, supply `NIL` or `NOT KNOWN` in the 
    ATS version.

The first five items of Field 20 are precisely defined, but the final three 
are free text fields, which leads to difficulties when decoding. It is beyond 
the scope of this chapter to address such a decoding issue.

#### Radio Failure Information

Field 21 of an ATS message, radio failure information, consists of six
items, each of which, if not known by the originator, is replaced
by `NIL` or `NOT KNOWN`. 

-   When converting ATS message content to FIXM, if an entry is `NIL` 
    or `NOT KNOWN`, it should be omitted in the FIXM version.

-   When converting a FIXM object to ATS message field 21, if a field 
    is absent in the FIXM version, supply `NIL` or `NOT KNOWN` in the 
    ATS version.

The first four items are precisely defined, but the final two are free text 
fields, which leads to difficulties when decoding. It is beyond the scope of 
this chapter to address such a decoding issue.

### Base Constructs

The ATS messages to FIXM Logical Model map in [this section](ats-message-to-fixm-mapping/mapping-of-ats-fields-to-fixm) at
times maps an ATS message field to a structured FIXM entity without
providing further detail. This occurs with 'lower level' entities that
are defined in the FIXM `Base` package. One such example is field 15a,
which is mapped to the `Base` class `TrueAirspeed`.

This section provides further detail for the mapping to `Base` classes
where those classes represent compound values.

#### FlightLevelOrAltitude

A level or altitude is captured in FIXM by the
class `FlightLevelOrAltitudeChoice` in package `Base.RangesAndChoices`. It
consists of a choice between flight level (class `FlightLevel`) or
altitude (class `Altitude`). In each case a unit of measure is specified
(respectively `UomFlightLevel` and `UomAltitude`) and a vertical distance
(inherited from, respectively, class `RestrictedVerticalDistance` or 
`VerticalDistance` in package `Base.Measures`) expressed as a
decimal number. Table 3 provides a mapping between the
level/altitude in PANS-ATM ATS messages and the level/altitude in FIXM.

Table 3: Level/Altitude Mapping

  | ATS Message Type |  ATS Message Value | FIXM FlightLevelOrAltitude |FIXM Uom |FIXM Value|
  |:-|:-|:-|:-|:-| 
  |F    |             Imperial flight level    |      FlightLevel   |          FL   |   Imperial flight level|
  |S    |             Metric flight level    |        FlightLevel    |         SM   |   Metric flight level|
  |A    |             Altitude in hundreds of feet   |Altitude    |            FT  |    Altitude in feet|
  |M   |              Altitude in tens of metres   |  Altitude    |            M    |   Altitude in metres|

Notes:

-   For ICAO flight level type `F`, the ICAO and FIXM values are the same.

-   For ICAO flight level type `S`, the ICAO and FIXM values are the same.

-   For ICAO altitude type `A`, multiply by 100 when converting to FIXM.

-   For ICAO altitude type `A`, divide by 100 and round when converting
    from FIXM.

-   For ICAO altitude type `M`, multiply by 10 when converting to FIXM.

-   For ICAO altitude type `M`, divide by 10 and round when converting
    from FIXM.

-   Since rounding is necessary when converting from FIXM, a round trip
    transformation is not guaranteed to fully preserve meaning. For
    example, the FIXM altitude `2640 feet` becomes `A026` in which if
    converted back to FIXM becomes `2600 feet`.

#### TrueAirspeed

In ATS messaging, speed is either true air speed or Mach number. This is
captured by class `TrueAirspeed` in package `Base.Measures`. It consists of
the unit of measurement (class `UomAirspeed`) and a (decimal) value. Table 
4 provides a mapping between the speed in ATS messages and the speed in 
FIXM.

Table 4: Speed Mapping

| ATS Message Type  | ATS Message Value         |FIXM UomAirspeed   |FIXM Value                 |
|:-|:-|:-|:-|
| K                 | Kilometres per hour       |  KM_H             | Kilometres per hour       |
| N                 | Nautical miles per hour   |  KT               | Nautical miles per hour   |
| M                 | Hundredths of Mach number |  MACH             | Mach number               |

Notes:

-   In an ATS message, the Mach value is represented by a three-digit
    string, which, when interpreted as a number, is 100 times greater than
    the Mach value (e.g. M080 is Mach 0.8).

-   Converting from FIXM to ATS message, multiply by 100 and round.

-   Converting from ATS message to FIXM, divide by 100.

-   Since rounding is necessary when converting from FIXM, a round trip
    transformation is not guaranteed to preserve meaning. For example,
    the FIXM Mach value of `0.841` becomes `M084` which when converted back
    to FIXM becomes `0.84`.

#### GeographicalPosition

In ATS messages, a geographic location is defined either in full
degrees, with a corresponding direct representation in decimal degrees,
or in degrees and minutes

dd<sub>1</sub>mm<sub>1</sub>\[NS\]ddd<sub>2</sub>mm<sub>2</sub>\[EW\]

which is converted by

decimal latitude = dd<sub>1</sub> + (mm<sub>1</sub>/60)

decimal longitude = ddd<sub>2</sub> + (mm<sub>2</sub>/60)

When converting from FIXM to ATS messages, the position can only be
represented to the nearest minute, resulting in a loss of precision.

A round trip starting from FIXM may not preserve meaning. Example:

FIXM latitude: 12.42 degrees

Convert to ATS: 1225N (12 degrees, 25 minutes)

Convert back to FIXM: 12.4166... degrees

#### SignificantPoint

A significant point can be a designated point, a navaid, a geographic
location (latitude/longitude), a relative point (bearing and distance
from a navaid), or an aerodrome. The five classes under 
`SignificantPointChoice` capture these options:

-   Class `DesignatedPoint` models the designated point value via a
    designator of class `DesignatedPointDesignator` along with an optional
    `position` (a `GeographicalPosition` as below).

-   Class `Navaid` models the navaid via a designator of class
    `NavaidDesignator` along with an optional `position` (a 
    `GeographicalPosition` as below).

-   Class `RelativePoint` models the relative point via a
    `referencePoint` (a `Navaid` as above), `bearing`, and `distance` along 
    with an optional `position` (a `GeographicalPosition` as below).

-   Class `GeographicalPosition` models the geographical location via
    attribute `pos` of class `LatLongPos` ([see GeographicalPosition](general-guidance/geographical-positions)).

-   Class `AerodromeReference` models the aerodrome via attributes
    `locationIndicator`, `name`, `referencePoint` (a 
    `GeographicalPosition` as above), and `referenceRelativePoint` 
    (a `RelativePoint` as above).

Examples of significant points are presented in [Field 15 Overall Example](#field-15-overall-example) 
and [DLE](#dle)

#### Frequency

Radio frequency can appear in fields 20d and 21b of an ATS message. In
all examples in PANS-ATM, this is presented as an unadorned decimal
number (e.g. 126.7). The expanded text in PANS-ATM describing the
examples always states MHz.

The global guidance for ATC Interfacility Data Communications (AIDC)
\[PAN AIDC ICD\] <sup>[[I-09]](#references)</sup> is
more specific as presented in Table 5.

Table 5: PAN AIDC ICD Frequency

|       | Range             | Units |
|:------|:------------------|:------|
| HF    |2850 to 28000      | kHz   |
| VHF   |117.975 to 137.000 | MHz   |
| UHF   |225.000 to 399.975 | MHz   |

The mapping for ATS messages follows the PAN AIDC ICD convention.

FIXM captures radio frequency in class `Frequency` of
package `Base.Measures`. This class has a mandatory associated value: the
unit of measure (class `UomFrequency`). The frequency unit is either KHZ
or MHZ. If the frequency is four or five digits without a decimal point,
set the `uom` attribute to KHZ, otherwise set the `uom` attribute to MHZ.

## Notes
\[1\]: It is assumed that validation of the flight plan ensures code 'N' 
is included in field 10a only when no other code is included, but such
validation is not part of the translation rules.

\[2\]: It is assumed that validation of the flight plan ensures the
field 10a code 'R' is always paired with field 18 PBN, but such
validation is not part of the translation rules.

\[3\]: It is assumed that validation of the flight plan ensures the
field 10a code 'Z' is always paired with at least one of field 18 NAV,
COM or DAT, but such validation is not part of the translation rules.

\[4\]: It is assumed that validation of the flight plan ensures code 'N' 
is included in field 10b only when no other code is included, but such
validation is not part of the translation rules.

\[5\]: If field 18 DOF is omitted it is necessary to apply business
rules to calculate the date of flight. Such business rules are outside
the scope of this chapter. The responsibility lies with individual
stakeholders.

## References

### ICAO References

[I-04]: [ICAO Doc 4444, 16th Edition, 2016](https://portal.icao.int/icao-net/ICAO%20Documents/4444_cons_en.pdf) - PANS-ATM: Procedures for Air Navigation Services: Air Traffic Management

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 

[I-07]: [ICAO Doc 7910](https://www.icao.int/safety/OPS/OPS-Tools/Pages/location-indicator.aspx) - Location Indicators

[I-08]: [ICAO Doc 8643](https://www.icao.int/publications/DOC8643/Pages/default.aspx) - Aircraft Type Designators

[I-09]: [PAN AIDC ICD, version 1.0](https://www.icao.int/APAC/Documents/edocs/PAN_ICD_AIDC_v1%200.pdf) - PAN Regional (NAT and APAC) Interface Control Document for ATC Interfacility Data Communications

[I-10]: [**DRAFT** ICAO Manual on System Wide Information Management (SWIM) Implementation, version September 2021](https://portal.icao.int/imp/MeetingDocs/IMP-2/Working%20Papers/Appendix%20A%20to%20IMP_2%20WP006%20%E2%80%93%20Manual%20on%20SWIM%20Implementation.pdf)

[I-11]: [ATMRPP/4-WP/922](https://portal.icao.int/atmrpp/Virtual%20ATMRPP4%201930%20April%202021/1_Working%20papers/ATMRPP4_WP_922_Updated%20FF-ICE%20R1%20Provisions_Appendix%20B_Clean.pdf) - Proposed Amendments to Annex 2, Doc 10066, and Doc 4444 concerning the initial implementation of FF-ICE Services
