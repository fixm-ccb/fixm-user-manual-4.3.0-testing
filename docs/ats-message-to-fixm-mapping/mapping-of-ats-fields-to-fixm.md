# Mapping of ATS Fields to FIXM

This section provides a mapping between the fields in PANS-ATM ATS
messages and the FIXM Logical Model, one ATS message field per
subsection. The columns in the mapping tables are defined in Table 8.

Table 8: Column Definitions

  |Column   | Description|
  |:-|:-|
  |PANS-ATM Field     |The field number as defined in ICAO Doc 4444 \[PANS-ATM\]<sup>[[I-04]](#references)</sup>.|
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
type. Refer to section [Varieties of Route](/ats-message-to-fixm-mapping/translating-ffice-fixm-messages-to-ats-messages?id=varieties-of-route) for a mapping between the
message type and the kind of route information.

The mapping below lists each ATS field with the corresponding FIXM field
from which its content can be extracted. While no
internationally-applicable use cases have been identified for
translating ATS content into FIXM, FF-ICE has a requirement to create
ATS messages from FIXM content.

## Field 3

Field 3 in an ATS message denotes the message type. FIXM Core is concerned with modelling information that may be included in a message but does not 
define messages itself. As such, there is no equivalent of ATS field 3 in FIXM Core. When translating FF-ICE messages to ATS format, Field 3 will be 
based on which type of FF-ICE message is being translated.

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
  |8a    |                Flight.FlightData |  FlightRulesCategory  | flightRulesCategory|
  |8b             |       Flight.FlightData        |                      TypeOfFlight     |     flightType|

## Field 9


| ICAO 4444 Field   | Package    | Class      | Path from Flight   |
|:----------------|:-|:-|:-|
| 9a     | Base.Types | CountPositive | aircraft.aircraftType.aircraftCount<br><br>Use the sum of all of the individual FIXM aircraftCounts to determine field 9a. If the sum is greater than 99, set field 9a to 99. |
| 9b             | Base.Types     | AircraftTypeDesignator      | \[9b≠ZZZZ\]     aircraft.aircraftType.icaoAircraftTypeDesignator |
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
| 13a            | Base.AeronauticalReference | LocationIndicator            | \[13a≠AFIL ∧ 13a≠ZZZZ\] departure.departureAerodrome.locationIndicator |
| |   Flight.Departure | AirfileIndicator|\[13a=AFIL\] departure.airfileIndicator = AIRFILE| 
| 13b| Base.Types   |DateTimeUtc |\[13a≠AFIL ∧ message∈{FPL,ARR,CHG,CNL,DLA,RQS,RQP}\] departure.estimatedOffBlockTime| 
| | | | \[13a≠AFIL ∧ message∈{ALR,DEP,SPL}\] departure.actualTimeOfDeparture.time|
| | | |\[13a=AFIL\] departure.estimatedRouteStartTime | 

## Field 14

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
 | 14a   |                Base.AeronauticalReference   |SignificantPointChoice    |    enroute.boundaryCrossingCoordination.crossingPoint|
 | 14b |                  Base.Types     |              DateTimeUtc           |               enroute.boundaryCrossingCoordination.crossingTime|
 | 14c |                  Base.RangesAndChoices   |     FlightLevelOrAltitudeChoice  | enroute.boundaryCrossingCoordination.clearedLevel|
 | 14d  |                 Base.RangesAndChoices |              FlightLevelOrAltitudeChoice  | enroute.boundaryCrossingCoordination.altitudeInTransition.level|
 | 14e  |                 Flight.EnRoute   |            BoundaryCrossingCondition   |  enroute.boundaryCrossingCoordination.altitudeInTransition.crossingCondition|

## Field 15

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
| 15a            | Base.Measures  | TrueAirspeed   | routeTrajectoryGroup.〈kind〉.routeInformation.cruisingSpeed           |
| 15b            | Base.RangesAndChoices        | FlightLevelOrAltitudeOrVfrChoice  | routeTrajectoryGroup.〈kind〉.routeInformation.cruisingLevel |
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
||Base.RangesAndChoices|FlightLevelOrAltitudeChoice|routeTrajectoryGroup.〈kind〉.element.routeChange.cruiseClimbStart.lowerLevel|
||Flight.FlightRouteTrajectory.RouteTrajectory.RouteChanges|UpperLevelChoice|routeTrajectoryGroup.〈kind〉.element.routeChange.cruiseClimbStart.upperLevel|
|15c7|Base.AeronauticalReference|SidStarReference|routeTrajectoryGroup.〈kind〉.element.routeDesignatorToNextElement.standardInstrumentArrival|

## Field 16
|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
|16a|Base.AeronauticalReference|LocationIndicator|\[16a≠ZZZZ\] arrival.destinationAerodrome.locationIndicator |
|16b|Base.Types|Duration|routeTrajectoryGroup.〈kind〉.routeInformation.totalEstimatedElapsedTime|
|16c|Base.AeronauticalReference|LocationIndicator|\[16c≠ZZZZ\] arrival.destinationAerodromeAlternate.locationIndicator If there are more than two FIXM destination alternates, only the first two are used when translating to field 16c.|

## Field 17

|ICAO 4444 Field|Package|Class|Path from Flight|
|:-|:-|:-|:-|
|17a|Base.AeronauticalReference|LocationIndicator|\[17a≠ZZZZ\] arrival.arrivalAerodrome.locationIndicator|
|17b|Base.Types|DateTimeUtc|arrival.actualTimeOfArrival.time|
|17c|Base.AeronauticalReference|AerodromeName|\[17a=ZZZZ\] arrival.arrivalAerodrome.name |

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
<p>If there are more than eight FIXM PBN codes, apply the rules defined in FF-ICE Implementation Guidance section 12.2.3 v) when translating to field 18 PBN.</p></td>
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
<td>Base.AeronauticalReference</td>
<td>AerodromeReference</td>
<td><p>[13a=ZZZZ]</p>
<p>departure.departureAerodrome.name</p>
<p>departure.departureAerodrome.referencePoint<br>or<br>departure.departureAerodrome.referenceRelativePoint</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.AeronauticalReference</td>
<td>AtcUnitReference</td>
<td><p>[13a=AFIL]</p>
<p>supplementaryInformation.supplementaryInformationSource.unit.locationIndicator</p>
<p>supplementaryInformation.supplementaryInformationSource.unit.atcUnitNameOrAlternate</p></td>
</tr>
<tr class="odd">
<td>DEST</td>
<td>Base.AeronauticalReference</td>
<td>AerodromeReference</td>
<td><p>[16a=ZZZZ]</p>
<p>arrival.destinationAerodrome.name</p>
<p>arrival.destinationAerodrome.referencePoint<br>or<br>arrival.destinationAerodrome.referenceRelativePoint</p></td>
</tr>
<tr class="even">
<td>DOF</td>
<td>Base.Types</td>
<td>DateTimeUtc</td>
<td><p>[13a≠AFIL]</p>
<p>departure.estimatedOffBlockTime</p>
<p>[13a=AFIL]</p>
<p>departure.estimatedRouteStartTime</p>
<p>Note: DOF is not modelled as a distinct attribute in FIXM, it is a component of the FIXM date/time fields</p></td>
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
<td>LocationIndicator</td>
<td><p>[EstimatedElapsedTime airspace boundary specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.region</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.AeronauticalReference</td>
<td>SignificantPointChoice</td>
<td><p>[EstimatedElapsedTime significant point specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.point</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.AeronauticalReference</td>
<td>Longitude</td>
<td><p>[EstimatedElapsedTime longitude specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.location.longitude</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.AeronauticalReference</td>
<td>SignificantPointType</td>
<td><p>[4DT point specified]</p>
<p> If a 4DT point has a Trajectory Point Property of PRESCRIBED_EET_POINT, the EET entry can be extracted from the associated elementStartPoint (if present) or the point4D.position otherwise</p>
<p>routeTrajectoryGroup.〈kind〉.element.elementStartPoint</p>
<p>routeTrajectoryGroup.〈kind〉.element.point4D.position</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.Types</td>
<td>Duration</td>
<td><p>[EstimatedElapsedTime duration specified]</p>
<p>routeTrajectoryGroup.〈kind〉.routeInformation.estimatedElapsedTime.elapsedTime</p></td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Duration</td>
<td><p>[4DT point specified]</p>
<p>routeTrajectoryGroup.〈kind〉.element.point4D.time.relativeTimeFromInitialPredictionPoint</p></td>
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
<td>CountPositive</td>
<td><p>[9b=ZZZZ]</p>
<p>aircraft.aircraftType.aircraftCount</p></td>
</tr>
<tr class="even">
<td></td>
<td>Base.Types</td>
<td>CharacterString</td>
<td><p>[9b=ZZZZ]</p>
<p>aircraft.aircraftType.otherAircraftType</p></td>
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
<td>routeTrajectoryGroup.〈kind〉.element.elementStartPoint</td>
</tr>
<tr class="odd">
<td></td>
<td>Base.Types</td>
<td>Duration</td>
<td>routeTrajectoryGroup.〈kind〉.element.plannedDelay.delayValue</td>
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
<td>Base.AeronauticalReference</td>
<td>AerodromeReference</td>
<td><p>[ZZZZ∈16c]</p>
<p>arrival.destinationAerodromeAlternate.name</p>
<p>arrival.destinationAerodromeAlternate.referencePoint<br>or<br>arrival.destinationAerodromeAlternate.referenceRelativePoint</p></td>
</tr>
<tr class="odd">
<td>RALT</td>
<td>Base.AeronauticalReference</td>
<td>AerodromeReference</td>
<td>enRoute.alternateAerodrome (locationIndicator or name and referencePoint/referenceRelativePoint)</td>
</tr>
<tr class="even">
<td>TALT</td>
<td>Base.AeronauticalReference</td>
<td>AerodromeReference</td>
<td>departure.takeOffAlternateAerodrome (locationIndicator or name and referencePoint/referenceRelativePoint)</td>
</tr>
<tr class="odd">
<td>RIF</td>
<td>Base.Types</td>
<td>CharacterString</td>
<td>arrival.reclearanceInFlight.routeToRevisedDestination</td>
</tr>
<tr class="even">
<td></td>
<td>Base.AeronauticalReference</td>
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
<td>supplementaryInformation.fuelEndurance</td>
</tr>
<tr class="even">
<td>19b</td>
<td>Base.Types</td>
<td>Count</td>
<td>supplementaryInformation.personsOnBoard</td>
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
<td>supplementaryInformation.pilotInCommand.name</td>
</tr>
</tbody>
</table>

## Field 20   

  |ICAO 4444 Field|Package|Class|Path from Flight|
  |:--------------|:------|:----|:---------------|
  |20a<sup>[[1]](#notes)</sup>|Base.Organization|AircraftOperatorDesignator|<p>[ICAO designator specified]</p><p>operator.designatorIcao</p>|
  ||Base.Types|TextName|<p>[ICAO designator not specified]</p><p>operator.operatingOrganization.name</p>|
  |20b|Base.AeronauticalReference|AtcUnitName|emergency.lastContact.lastContactUnit|
  |20c|Base.Types|DateTimeUtc|emergency.lastContact.lastContactTime|
  |20d|Base.Measures|Frequency|emergency.lastContact.lastContactFrequency|
  |20e|Base.AeronauticalReference|SignificantPointChoice|emergency.lastContact.position.position|
  ||Base.Types|DateTimeUtc|emergency.lastContact.position.timeAtPosition|
  |20f|Base.Types|CharacterString|emergency.lastContact.position.determinationMethod|
  |20g|Base.Types|CharacterString|emergency.actionTaken|
  |20h|Base.Types|CharacterString|emergency.otherInformation|

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
<td>DateTimeUtc</td>
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
<td>DateTimeUtc</td>
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
if *NEWACID* appeared in field 7.

The only caveat to this is that, if field 22 is used to provide new values
for the flight's ACID, EOBT, departure point, or destination point, FIXM also captures 
the previous values for these fields in `aircaftIdentificationPrevious`, 
`estimatedOffBlockTimePrevious` (or `estimatedRouteStartTimePrevious`), 
`departureAerodromePrevious` (or `departurePointPrevious`), and/or 
`destinationAerodromePrevious`, respectively.

## Notes

[1]: Field 20a maps to the same FIXM field as field 18 OPR. An ALR can
include field 18 and field 20 with potentially conflicting values.
Further consideration of this is required.

## References

### ICAO References

[I-04]: [ICAO Doc 4444, 16th Edition, 2016](https://portal.icao.int/icao-net/ICAO%20Documents/4444_cons_en.pdf) - PANS-ATM: Procedures for Air Navigation Services: Air Traffic Management
