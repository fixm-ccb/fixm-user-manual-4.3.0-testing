# Mapping of ATS Fields to FIXM

This section provides a mapping between the fields in PANS-ATM ATS
messages and the FIXM Logical Model, one ATS message field per
subsection. The columns in the mapping tables are defined in Table 8.

Table 8: Column Definitions

  |Column   | Description|
  |:-|:-|
  |PANS-ATM Field     |The field number as defined in ICAO Doc 4444 \[PANS-ATM\]<sup>[[4]](#references)</sup>.|
  |Package            |The package that contains the definition of the PANS-ATM field in the logical model.|
  |Class              |The class (in the specified package) that models the PANS-ATM field.|
  |Path from Flight   |Starting from class *Flight* in package *Flight.FlightData*, this defines the path to the location in the logical model where the field is encoded.|

Table 9 provides an explanation of an entry in the map using the flight
identifier recorded in field 7a of an ICAO ATS message (see [Field
7](#field-7)).

Table 9: Example

  |Column |        Value| Description|
  |:-------|:----------|:-|
  |PANS-ATM Field |    7a   |                                         This is the field number from PANS-ATM that represents the flight identifier, which is being mapped to the logical model.|
  |Package         |   Base.Types            |                        The flight identifier is modelled in the *Base.Types* package.|
  |Class      |        AircraftIdentification   |                     The name of the class that models a flight identifier is *AircraftIdentification*.|
  |Path from Flight |  flightIdentification.aircraftIdentification |  Starting at class *Flight*, follow the *flightIdentification* association to class *FlightIdentification*, then to the *aircraftIdentification* attribute of that class (which is of type *AircraftIdentification*).|

A PANS-ATM ATS message field may be mapped to different FIXM elements
depending on context. A simple constraint notation based on logic and
set theory is employed to specify these conditions. The notation is
described in Table 10.

Table 10: Constraint Notation

  |Notation|Description|
  |:-------|:--------|
  \[ . . . . \]   |A constraint. The field in question is only encoded in the specified FIXM element if the constraint is satisfied.|
  |A ∧ B  |         Logical conjunction: both A and B are true.|
  |A ∨ B   |        Logical disjunction: A is true or B is true.|
  |A = B   |        Equality: A and B are equal.|
  |A ≠ B   |        Inequality: A and B are not equal.|
  |A ∈ B  |         Set membership: the item A is contained in the set/list B.|
  |A ∉ B  |         Set exclusion: the item A is not contained in the set/list B.|
  |Free text     |  If the constraint is not amenable to formal specification, it is described in text.|

The term '〈kind〉' in the subsequent tables (fields 8, 13, 15, 16 and
18) is a reference to the kind of route/trajectory information to which
a field is mapped. That route information is dependent on the message
type. Refer to section Varieties of Route for a mapping between the
message type and the kind of route information.

The mapping below lists each ATS field with the corresponding FIXM field
from which its content can be extracted. While no
internationally-applicable use cases have been identified for
translating ATS content into FIXM, FF-ICE has a requirement to create
ATS messages from FIXM content.

## Field 3

Field 3 in an ATS message denotes the message type. FIXM is concerned
with modelling information that may be included in a message, but FIXM
itself does not define messages. As such, there is no equivalent of ATS
field 3 in FIXM.

## Field 5

  |ICAO 4444 Field|Package|Class|Path from Flight|
  |:--------------|:------|:----|:---------------| 
  |5a       |             Flight.Emergency |  EmergencyPhase   |   emergency.phase|
  |5b      |              Base.Types   |      LocationIndicator  | emergency.originator.locationIndicator|
  |         |           |                     TextName |           emergency.originator.atcUnitNameOrAlternate|
  |5c           |         Base.Types        | CharacterString    | emergency.emergencyDescription|

## Field 7

  |ICAO 4444 Field|Package|Class|Path from Flight|
  |:--------------|:------|:-|:-------|
  |7a             |       Base.Types |   AircraftIdentification |  flightIdentification.aircraftIdentification|
  |7b/c    |              Base.Types   | ModeACode      |          enRoute.currentModeACode|

## Field 8

  |ICAO 4444 Field|Package|Class|Path from Flight|
  |:----------------|:-|:-|:-|
  |8a    |                Flight.FlightRouteTrajectory.RouteTrajectory |  FlightRulesCategory  | routeTrajectoryGroup.〈kind〉.routeInformation.flightRulesCategory|
  |8b             |       Flight.FlightData        |                      TypeOfFlight     |     flightType|

## Field 9


| ICAO 4444 Field   | Package    | Class      | Path from Flight   |
|:----------------|:-|:-|:-|
| 9a             | Base.Types     | Count          | aircraft.formationCount If the FIXM number of aircraft is greater than 99, set field 9a to 99.      |
| 9b             | Base.Types     | AircraftTypeDesignator      | \[9b≠ZZZZ\]     aircraft.aircraftType.type.icaoAircraft TypeDesignator |
| 9c             | Flight.Aircraft              | WakeTurbulenceCategory | aircraft.wakeTurbulence |

## Field 10

  |ICAO 4444 Field|Package|Class|Path from Flight|
  |:-|:-|:-|:-|
  |10a       |            Flight.Capability  | StandardCapabilitiesIndicator |        aircraft.capabilities.standardCapabilities|
  |     |                                     |CommunicationCapabilityCode   |        aircraft.capabilities.communication.communicationCapabilityCode|
  |        |                                  |DatalinkCommunicationCapabilityCode  | aircraft.capabilities.communication.datalinkCommunicationCapabilityCode|
  |            |                              |NavigationCapabilityCode         |     aircraft.capabilities.navigation.navigationCapabilityCode|
  |10b             |      Flight.Capability   |SurveillanceCapabilityCode     |       aircraft.capabilities.surveillance.surveillanceCapabilityCode|

## Field 13

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
| 13a            | Base.Organization            | LocationIndicator            | \[13a≠AFIL ∧ 13a≠ZZZZ\] departure.aerodrome.locationIndicator |
| |   Flight.Departure | AirfileIndicator|\[13a=AFIL\] departure.airfileIndicator = AIRFILE| 
| 13b| Base.Types   |Time |\[13a≠AFIL ∧ message∈{FPL,ARR,CHG,CNL,DLA,RQS,RQP}\] departure.estimatedOffBlockTime| 
| | | | \[13a≠AFIL ∧ message∈{ALR,DEP,SPL}\] departure.actualTimeOfDeparture|
| | | |\[13a=AFIL\] routeTrajectoryGroup.〈kind〉.routeInformation.airfileRouteStartTime | 

## Field 14

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
 | 14a   |                Base.AeronauticalReference   |SignificantPointChoice    |    enroute.boundaryCrossingCoordination.crossingPoint|
 | 14b |                  Base.Types     |              Time           |               enroute.boundaryCrossingCoordination.crossingTime|
 | 14c |                  Base.RangesAndChoices   |     FlightLevelOrAltitudeChoice  | enroute.boundaryCrossingCoordination.clearedLevel|
 | 14d  |                 Flight.EnRoute |              FlightLevelOrAltitudeChoice  | enroute.boundaryCrossingCoordination.altitudeInTransition.level|
 | 14e  |                 Flight.EnRoute   |            BoundaryCrossingCondition   |  enroute.boundaryCrossingCoordination.altitudeInTransition.crossingCondition|

## Field 15

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
| 15a            | Base.Measures  | TrueAirspeed   | routeTrajectoryGroup.〈kind〉.routeInformation.cruisingSpeed           |
| 15b            | Base.RangesAndChoices        | FlightLevelOrAltitudeChoice  | \[15b≠VFR\]   routeTrajectoryGroup.〈kind〉.routeInformation.cruisingLevel |
|15c|Flight.FlightRouteTrajectory.RouteTrajectory|RouteTrajectoryElement|routeTrajectoryGroup.〈kind〉.element|
||Base.Types|CharacterString|routeTrajectoryGroup.〈kind〉.routeInformation.routeText|
|15c1|Base.AeronauticalReference|SidStarReference|routeTrajectoryGroup.〈kind〉.element.routeDesignatorToNextElement.standardInstrumentDeparture|
|15c2|Base.AeronauticalReference|RouteDesignator|routeTrajectoryGroup.〈kind〉.element.routeDesignatorToNextElement.routeDesignator|
|15c3|Base.AeronauticalReference|SignificantPointChoice|routeTrajectoryGroup.〈kind〉.element.elementStartPoint|
|15c4|Base.AeronauticalReference|SignificantPointChoice|routeTrajectoryGroup.〈kind〉.element.elementStartPoint|
||Base.Measures|TrueAirspeed|routeTrajectoryGroup.〈kind〉.element.routeChange.speed.speed|
||Base.RangesAndChoices|FlightLevelOrAltitudeChoice|routeTrajectoryGroup.〈kind〉.element.routeChange.level.level|
|15c5|Flight.FlightRouteTrajectory.RouteTrajectory|FlightRules|\[15c5=IFR ∨ 15c5=VFR\] routeTrajectoryGroup.〈kind〉.element.flightRulesChange|
||Flight.FlightRouteTrajectory.RouteTrajectory|OtherRouteDesignator|\[15c5=DCT\] routeTrajectoryGroup.〈kind〉.element.routeDesignatorToNextElement.otherRouteDesignator = DIRECT |
||Flight.FlightRouteTrajectory.RouteTrajectory|RouteTruncationIndicator|\[15c5=T\] routeTrajectoryGroup.〈kind〉.element.routeTruncationIndicator = ROUTE_TRUNCATION|
|15c6|Base.AeronauticalReference|SignificantPointChoice|routeTrajectoryGroup.〈kind〉.element.elementStartPoint|
||Base.Measures|TrueAirspeed|routeTrajectoryGroup.〈kind〉.element.routeChange.cruiseClimbStart.speed|
||Base.RangesAndChoices|VerticalRange|\[PLUS∉15c6\] routeTrajectoryGroup.〈kind〉.element.routeChange.cruiseClimbStart.level.flightLevelOrAltitudeRange|
||Base.RangesAndChoices|FlightLevelOrAltitudeChoice|\[PLUS∈15c6\] routeTrajectoryGroup.〈kind〉.element.routeChange.cruiseClimbStart.level.flightLevelOrAltitudeValue|
|15c7|Base.AeronauticalReference|SidStarReference|routeTrajectoryGroup.〈kind〉.element.routeDesignatorToNextElement.standardInstrumentArrival|

## Field 16
|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
|16a|Base.Organization|LocationIndicator|\[16a≠ZZZZ\] arrival.destinationAerodrome.locationIndicator |
|16b|Base.Types|Duration|routeTrajectoryGroup.〈kind〉.routeInformation.totalEstimatedElapsedTime|
|16c|Base.Organization|LocationIndicator|\[16c≠ZZZZ\] arrival.destinationAerodromeAlternate.locationIndicator If there are more than two FIXM destination alternates, only the first two are used when translating to field 16c.|

## Field 17

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
|17a|Base.Organization|LocationIndicator|\[17a≠ZZZZ\] arrival.arrivalAerodrome.locationIndicator|
|17b|Base.Types|Time|arrival.actualTimeOfArrival|
|17c|Base.Aerodrome|AerodromeName|\[17a=ZZZZ\] arrival.arrivalAerodrome.name |

## Field 18

<table>
<thead>
<tr class="header">
<th><strong>ICAO 4444 Field</strong></th>
<th><strong>Package</strong></th>
<th><strong>Class</strong></th>
<th><strong>Path from Flight</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>STS</td>
<td>Flight.FlightData</td>
<td>SpecialHandlingReasonCode</td>
<td>specialHandling</td>
</tr>
<tr class="even">
<td>PBN</td>
<td>Flight.Capability</td>
<td>PerformanceBasedNavigationCapabilityCode</td>
<td><p>[R∈10a]</p>
<p>aircraft.capabilities.navigation.performanceBasedCode</p>
<p>If there are more than eight FIXM PBN codes, apply the rules defined in FF-ICE Implementation Guidance section 13.2.2 s) when translating to field 18 PBN.</p></td>
</tr>
<tr class="odd">
<td>NAV</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td><p>[Z∈10a]</p>
<p>aircraft.capabilities.navigation.otherNavigationCapabilities</p></td>
</tr>
<tr class="even">
<td>COM</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td><p>[Z∈10a]</p>
<p>aircraft.capabilities.communication.otherCommunicationCapabilities</p></td>
</tr>
<tr class="odd">
<td>DAT</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td><p>[Z∈10a]</p>
<p>aircraft.capabilities.communication.otherDatalinkCapabilities</p></td>
</tr>
<tr class="even">
<td>SUR</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>aircraft.capabilities.surveillance.otherSurveillanceCapabilities</td>
</tr>
<tr class="odd">
<td>DEP</td>
<td>Base.Aerodrome</td>
<td>AerodromeReference</td>
<td><p>[13a=ZZZZ]</p>
<p>departure.aerodrome.name</p>
<p>departure.aerodrome.referencePoint</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.Types</td>
<td>TextName</td>
<td><p>[13a=AFIL]</p>
<p>flightPlanSubmitter.name</p></td>
</tr>
<tr class="odd">
<td>DEST</td>
<td>Base.Aerodrome</td>
<td>AerodromeReference</td>
<td><p>[16a=ZZZZ]</p>
<p>destination.destinationAerodrome.name</p>
<p>destination.destinationAerodrome.referencePoint</p></td>
</tr>
<tr class="even">
<td>DOF</td>
<td>Base.Types</td>
<td>Time</td>
<td><p>[13a≠AFIL]</p>
<p>departure.estimatedOffBlockTime</p>
<p>[13a=AFIL]</p>
<p>routeTrajectoryGroup.〈kind〉.route.airfileRouteStartTime</p>
<p>Note: DOF is not modelled as a distinct attribute in FIXM, it is a component of the departure or air filed start date/time (see field 13b on page 111)</p></td>
</tr>
<tr class="odd">
<td>REG</td>
<td>Flight.Aircraft</td>
<td>AircraftRegistration</td>
<td><p>aircraft.registration</p>
<p>If there is more than one FIXM registration, insert the first only in field 18 REG.</p></td>
</tr>
<tr class="even">
<td>EET</td>
<td>Base.AeronauticalReference</td>
<td>AirspaceDesignator</td>
<td><p>[Airspace boundary specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.region</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.AeronauticalReference</td>
<td>SignificantPointChoice</td>
<td><p>[Significant point specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.point</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.AeronauticalReference</td>
<td>Longitude</td>
<td><p>[Longitude specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.longitude</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Duration</td>
<td>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.elapsedTime</td>
</tr>
<tr class="even">
<td>SEL</td>
<td>Flight.Capability</td>
<td>SelectiveCallingCode</td>
<td>aircraft.capabilities.communication.selectiveCallingCode</td>
</tr>
<tr class="odd">
<td>TYP</td>
<td>Base.Types</td>
<td>Count</td>
<td><p>[9b=ZZZZ]</p>
<p>aircraft.aircraftType.numberOfAircraft</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.Types</td>
<td>CharacterString</td>
<td><p>[9b=ZZZZ]</p>
<p>aircraft.aircraftType.type.otherAircraftType</p></td>
</tr>
<tr class="odd">
<td>CODE</td>
<td>Flight.Aircraft</td>
<td>AircraftAddress</td>
<td>aircraft.aircraftAddress</td>
</tr>
<tr class="even">
<td>DLE</td>
<td>Base.AeronauticalReference</td>
<td>SignificantPoint</td>
<td>routeTrajectoryGroup.〈kind〉.element.elementStartPoint (see also field 15c3, 15c4 and 15c6)</td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Duration</td>
<td>routeTrajectoryGroup.〈kind〉.element.enRouteDelay.delayValue</td>
</tr>
<tr class="even">
<td>OPR</td>
<td>Base.Organization</td>
<td>AircraftOperatorDesignator</td>
<td><p>[ICAO designator specified]</p>
<p>operator.designatorIcao</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>TextName</td>
<td><p>[ICAO designator not specified]</p>
<p>operator.operatingOrganization.name</p></td>
</tr>
<tr class="even">
<td>ORGN</td>
<td>Base.Types</td>
<td>TextName</td>
<td>flightPlanOriginator.name</td>
</tr>
<tr class="odd">
<td>PER</td>
<td>Flight.Aircraft</td>
<td>AircraftApproachCategory</td>
<td>aircraft.aircraftApproachCategory</td>
</tr>
<tr class="even">
<td>ALTN</td>
<td>Base.Aerodrome</td>
<td>OtherReference</td>
<td><p>[ZZZZ∈16c]</p>
<p>arrival.destinationAerodromeAlternate.name</p>
<p>arrival.destinationAerodromeAlternate.referencePoint</p></td>
</tr>
<tr class="odd">
<td>RALT</td>
<td>Base.Aerodrome</td>
<td>AerodromeReference</td>
<td>enRoute.alternateAerodrome</td>
</tr>
<tr class="even">
<td>TALT</td>
<td>Base.Aerodrome</td>
<td>AerodromeReference</td>
<td>departure.takeOffAlternateAerodrome</td>
</tr>
<tr class="odd">
<td>RIF</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>arrival.reclearanceInFlight.routeToRevisedDestination</td>
</tr>
<tr class="even">
<td></td>
<td>Base.Aerodrome</td>
<td>AerodromeReference</td>
<td>arrival.reclearanceInFlight.filedRevisedDestinationAerodrome</td>
</tr>
<tr class="odd">
<td>RMK</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>remarks</td>
</tr>
</tbody>
</table>

## Field 19

<table>
<thead>
<tr class="header">
<th><strong>ICAO 4444 Field</strong></th>
<th><strong>Package</strong></th>
<th><strong>Class</strong></th>
<th><strong>Path from Flight</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>19a</td>
<td>Base.Types</td>
<td>Duration</td>
<td>supplementaryData.fuelEndurance</td>
</tr>
<tr class="even">
<td>19b</td>
<td>Base.Types</td>
<td>Count</td>
<td>supplementaryData.personsOnBoard</td>
</tr>
<tr class="odd">
<td>19c</td>
<td>Flight.Capability</td>
<td>EmergencyRadioCapabilityType</td>
<td>aircraft.capabilities.survival.emergencyRadioCapabilityType</td>
</tr>
<tr class="even">
<td>19d</td>
<td>Flight.Capability</td>
<td>SurvivalEquipmentType</td>
<td>aircraft.capabilities.survival.survivalEquipmentType</td>
</tr>
<tr class="odd">
<td>19e</td>
<td>Flight.Capability</td>
<td>LifeJacketType</td>
<td>aircraft.capabilities.survival.lifeJacketType</td>
</tr>
<tr class="even">
<td>19f</td>
<td>Base.Types</td>
<td>Count</td>
<td>aircraft.capabilities.survival.dinghyInformation.number</td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Count</td>
<td>aircraft.capabilities.survival.dinghyInformation.totalCapacity</td>
</tr>
<tr class="even">
<td></td>
<td>Flight.Capability</td>
<td>DinghyCoverIndicator</td>
<td>aircraft.capabilities.survival.dinghyInformation.covered</td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>aircraft.capabilities.survival.dinghyInformation.colour</td>
</tr>
<tr class="even">
<td>19g</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>aircraft.coloursAndMarkings</td>
</tr>
<tr class="odd">
<td>19h</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>aircraft.capabilities.survival.survivalEquipmentRemarks</td>
</tr>
<tr class="even">
<td>19i</td>
<td>Base.Types</td>
<td>TextName</td>
<td>supplementaryData.pilotInCommand.name</td>
</tr>
</tbody>
</table>

## Field 20   

<table>
<thead>
<tr class="header">
<th><strong>ICAO 4444 Field</strong></th>
<th><strong>Package</strong></th>
<th><strong>Class</strong></th>
<th><strong>Path from Flight</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>20a<a href="#notes"><sup><u>[note 1]</u></sup></a></td>
<td>Base.Organization</td>
<td>AircraftOperatorDesignator</td>
<td><p>[ICAO designator specified]</p>
<p>operator.designatorIcao</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.Types</td>
<td>TextName</td>
<td><p>[ICAO designator not specified]</p>
<p>operator.operatingOrganization.name</p></td>
</tr>
<tr class="odd">
<td>20b</td>
<td>Base.AeronauticalReference</td>
<td>AtcUnitName</td>
<td>emergency.lastContact.lastContactUnit</td>
</tr>
<tr class="even">
<td>20c</td>
<td>Base.Types</td>
<td>Time</td>
<td>emergency.lastContact.lastContactTime</td>
</tr>
<tr class="odd">
<td>20d</td>
<td>Base.Measures</td>
<td>Frequency</td>
<td>emergency.lastContact.lastContactFrequency</td>
</tr>
<tr class="even">
<td>20e</td>
<td>Base.AeronauticalReference</td>
<td>SignificantPointChoice</td>
<td>emergency.lastContact.position.position</td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Time</td>
<td>emergency.lastContact.position.timeAtPosition</td>
</tr>
<tr class="even">
<td>20f</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>emergency.lastContact.position.determinationMethod</td>
</tr>
<tr class="odd">
<td>20g</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>emergency.actionTaken</td>
</tr>
<tr class="even">
<td>20h</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>emergency.otherInformation</td>
</tr>
</tbody>
</table>

1.  Field 20a maps to the same FIXM field as field 18 OPR. An ALR can
    include field 18 and field 20 with potentially conflicting values.
    Further consideration of this is
    required.

## Field 21   

<table>
<thead>
<tr class="header">
<th><strong>ICAO 4444 Field</strong></th>
<th><strong>Package</strong></th>
<th><strong>Class</strong></th>
<th><strong>Path from Flight</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>21a</td>
<td>Base.Types</td>
<td>Time</td>
<td>radioCommunicationFailure.contact.lastContactTime</td>
</tr>
<tr class="even">
<td>21b</td>
<td>Base.Measures</td>
<td>Frequency</td>
<td>radioCommunicationFailure.contact.lastContactFrequency</td>
</tr>
<tr class="odd">
<td>21c</td>
<td>Base.AeronauticalReference</td>
<td>SignificantPointChoice</td>
<td>radioCommunicationFailure.contact.position.position</td>
</tr>
<tr class="even">
<td>21d</td>
<td>Base.Types</td>
<td>Time</td>
<td>radioCommunicationFailure.contact.position.timeAtPosition</td>
</tr>
<tr class="odd">
<td>21e</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>radioCommunicationFailure.remainingComCapability</td>
</tr>
<tr class="even">
<td>21f</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>radioCommunicationFailure.radioFailureRemarks</td>
</tr>
</tbody>
</table>

## Field 22    

In an ATS message, field 22 specifies a change to the information
associated with a flight. It does not define new information elements,
just a modification to elements that appear in other fields. As such,
there are no mapping rules for field 22. The mapping of the information
that can be specified in field 22 is captured in the other fields. For
example, the entry *-7/NEWACID* in field 22 has the same mapping as
if *--NEWACID* appeared in field 7.

## Notes

[1]: Field 20a maps to the same FIXM field as field 18 OPR. An ALR can
include field 18 and field 20 with potentially conflicting values.
Further consideration of this is required.

## References

[4]: PANS-ATM: Procedures for Air Navigation Services: Air Traffic
Management, ICAO Doc 4444, 16th edition
