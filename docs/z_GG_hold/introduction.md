# FIXM Encoding Guidance

This section describes general encoding guidance for FIXM Core that is always applicable, whatever the implementation context. Click on the FIXM Core packages, classes or properties below to open the corresponding encoding guidance. Alternatively, you can use the Search box in the side bar to find relevant user manual entries.

*Note: links are provided below only when encoding guidance is available. The FIXM User Manual is being gradually enriched to cover all FIXM Core properties.*

## `fx:Flight`

---
Package [`fx:Aircraft`]
- **Aircraft:** [aircraftAddress], aircraftApproachCategory, [aircraftType], [capabilities], coloursAndMarkings, [registration], wakeTurbulence
- **AircraftType:** [aircraftCount], icaoAircraftTypeDesignator, otherAircraftType
---
Package [`fx:Arrival`]
- **Arrival:** actualTimeOfArrival, [airportSlotIdentification], arrivalAerodrome, destinationAerodrome, destinationAerodromeAlternate, [destinationAerodromePrevious], reclearanceInFlight, runwayDirection
---
Package [`fx:Capability`]
- **Capability:** [communication], navigation, standardCapabilities, surveillance, survival
- **CommunicationCapabilities:** communicationCapabilityCode, datalinkCommunicationCapabilityCode, otherCommunicationCapabilities, otherDatalinkCapabilities, [selectiveCallingCode]
- **NavigationCapabilities:** navigationCapabilityCode, otherNavigationCapabilities, performanceBasedCode, requiredRunwayVisualRange
- **SurveillanceCapabilities:** otherSurveillanceCapabilities, surveillanceCapabilityCode
- **SurvivalCapabilities:** carriedEltHexIdentifier, dinghyInformation, emergencyRadioCapabilityType, lifeJacketType, survivalEquipmentRemarks, survivalEquipmentType
---
Package [`fx:Cargo`]
- **DangerousGoods:** aircraftLimitation, airWaybillNumber, onboardLocation, packageGroup, shippingInformation
<!-- - **fx:DangerousGoodsPackageGroup:** dangerousGoodsPackage, shipmentDimensions -->
<!-- - **fx:DangerousGoodsPackage:** allPackedInOne, compatibilityGroup, dangerousGoodsLimitation, dangerousGoodsQuantity, hazardClass, packingGroup, properShippingName, radioactiveMaterials, shipmentDimensions, subsidiaryHazardClass, unNumber -->
---
Package [`fx:Departure`]
- **Departure:** actualTimeOfDeparture, [airfileIndicator], [airportSlotIdentification], [departureAerodrome], [departureAerodromePrevious], [departurePoint], [departurePointPrevious], [estimatedOffBlockTime], [estimatedOffBlockTimePrevious], [estimatedRouteStartTime], [estimatedRouteStartTimePrevious], runwayDirection, takeoffAlternateAerodrome
---
Package [`fx:Emergency`]
- **FlightEmergency:** actionTaken, emergencyDescription, lastContact, originator, otherInformation, phase
<!-- - **fx:LastContactType:** lastContactFrequency, lastContactTime, lastContactUnit, position -->
- **RadioCommunicationFailure:** contact, radioFailureRemarks, remainingComCapability
---
Package [`fx:EnRoute`]
- **EnRoute:** alternateAerodrome, boundaryCrossingCoordination, currentModeACode
- **BoundaryCrossing:** altitudeInTransition, clearedLevel, crossingPoint, crossingTime
---
Package [`fx:FlightData`]
- **Flight:** [aircraft], [arrival], [dangerousGoods], [departure], [emergency], [enRoute], flightConstraint, [flightIdentification], flightPlanOriginator, flightPlanSubmitter, flightRulesCategory, flightType, operator, radioCommunicationFailure, remarks, routeTrajectoryGroup, specialHandling, supplementaryInformation
- **FlightIdentification:** [aircraftIdentification], [aircraftIdentificationPrevious], [gufi], [gufiLegacy], iataFlightDesignator
- **RouteTrajectoryGroupContainer:** agreed, current, desired, negotiating
---
Package [`fx:RouteChanges`]
- **RouteChange:** cruiseClimbStart, level, speed 
---
Package [`fx:RouteTrajectory`]
- **RouteTrajectoryGroup:** [climbProfile], climbSchedule, [descentProfile], descentSchedule, element, [routeInformation], takeoffMass
- **FlightRouteInformation:** [airacReference], cruisingLevel, cruisingSpeed, estimatedElapsedTime, routeText, totalEstimatedElapsedTime
- **PerformanceProfile:** [profilePoint]
- **RouteTrajectoryElement:** alongRouteDistance, [constraint], elementStartPoint, flightRulesChange, modified, modifiedRouteItemReference, plannedDelay, [point4D], [routeChange], routeDesignatorToNextElement, routeTruncationIndicator, [seqNum]
- **TrajectoryPoint4D:** altimeterSetting, level, metData, [pointProperty], position, predictedAirspeed, predictedGroundspeed, time, verticalRange
- **TrajectoryPointProperty:** description, [propertyType], reference
---
Package [`fx:Constraints`]
- **RouteTrajectoryConstraint:** departureOrArrivalIndicator, description, level, restrictionReference, speed, time
---

## `fb:Base`
---
Package [`fb:Address`]
- [ContactInformation], [OnlineContact], [PostalAddress], TelephoneContact
---
Package [`fb:AeronauticalReference`]
- [AerodromeReference], [AirspaceDesignator], [AtcUnitReference], [DesignatedPoint], [GeographicalPosition], [Navaid], [RelativePoint], [RouteDesignator], [RunwayDirectionDesignator]
---
Package [`fb:Measures`]
- [Altitude], AltitudeWithSource, Angle, Bearing, [FlightLevel], Frequency, GroundSpeed, [Height], IndicatedAirspeed, Length, Mass, Pressure, Speed, Temperature, TrueAirspeed, [VerticalDistance], VerticalRate, Volume, Weight, WindDirection, WindSpeed
---
Package [`fb:Organization`]
- AircraftOperator, PersonOrOrganisation
---
Package [`fb:RangesAndChoices`]
- [TimeRange], [TrueAirspeedRange], [VerticalRange]
---
Package [`fb:Types`]
- [Count], [DateTimeUtc], [DateTimeUtcHighPrecision], DateUtc, Duration, [HyperTextReference]
---

<!----------------------------------------------------->
<!-- Links for fx:Aircraft -->
[`fx:Aircraft`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft
[aircraftAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftaddress
[aircraftType]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircrafttype
[registration]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=registration
[capabilities]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability
[aircraftCount]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftcount

<!-- Links for fx:Arrival -->
[`fx:Arrival`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Arrival
[destinationAerodromePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious

<!-- Links for fx:Capability -->
[`fx:Capability`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability
[communication]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability?id=communication
[selectiveCallingCode]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability?id=selectivecallingcode

<!-- Links for fx:Cargo -->
[`fx:Cargo`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Cargo

<!-- Links for fx:Departure -->
[`fx:Departure`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure
[airfileIndicator]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=airfileindicator
[airportslotidentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=airportslotidentification
[departureAerodrome]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=departureaerodrome-departurepoint
[departureAerodromePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious
[departurePoint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=departureaerodrome-departurepoint
[departurePointPrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious
[estimatedOffBlockTime]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=estimatedoffblocktime-estimatedroutestarttime
[estimatedOffBlockTimePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious
[estimatedRouteStartTime]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=estimatedoffblocktime-estimatedroutestarttime
[estimatedRouteStartTimePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious

<!-- Links for fx:Emergency -->
[`fx:Emergency`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Emergency

<!-- Links for fx:EnRoute -->
[`fx:EnRoute`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_EnRoute

<!-- Links for fx:FlightData -->
[`fx:FlightData`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData
[aircraft]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=encoding-guidance-for-fxaircraft
[arrival]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Arrival?id=encoding-guidance-for-fxarrival
[dangerousGoods]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Cargo?id=encoding-guidance-for-fxcargo
[departure]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=encoding-guidance-for-fxdeparture
[emergency]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Emergency?id=encoding-guidance-for-fxemergency
[enRoute]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_EnRoute?id=encoding-guidance-for-fxenroute
[flightIdentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=flightidentification
[aircraftIdentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[aircraftIdentificationPrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentificationprevious
[gufi]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=gufi
[gufiLegacy]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=compatibility-with-fixm-core-420

<!-- Links for fx:RouteChanges -->
[`fx:RouteChanges`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteChanges

<!-- Links for fx:RouteTrajectory -->
[`fx:RouteTrajectory`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory
[climbProfile]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=climbprofile-descentprofile
[descentProfile]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=climbprofile-descentprofile
[profilePoint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=climbprofile-descentprofile
[routeInformation]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=routeinformation
[point4D]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=point4d
[pointProperty]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=pointproperty
[propertyType]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=pointproperty
[element]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=element
[airacReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteTrajectory?id=airacreference
[constraint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Constraints?id=encoding-guidance-for-fxconstraints
[routeChange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_RouteChanges?id=encoding-guidance-for-fxroutechanges
[seqNum]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=count-sequence-numbers

<!-- Links for fx:Constraints -->
[`fx:Constraints`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Constraints

<!-- Links for fb:Address -->
[`fb:Address`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address
[ContactInformation]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=contactinformation
[OnlineContact]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=onlinecontact
[PostalAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=postaladdress

<!-- Links for fb:AeronauticalReference -->
[`fb:AeronauticalReference`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference
[AerodromeReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=aerodromereference
[AirspaceDesignator]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=airspacedesignator
[AtcUnitReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=atcunitreference
[DesignatedPoint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=designatedpoint
[GeographicalPosition]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=geographicalposition
[Navaid]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=navaid
[RelativePoint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=relativepoint
[RouteDesignator]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=routedesignator
[RunwayDirectionDesignator]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=runwaydirectiondesignator

<!-- Links for fb:Measures -->
[`fb:Measures`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures
[VerticalDistance]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[Altitude]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[FlightLevel]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[Height]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance

<!-- Links for fb:Organization -->
[`fb:Organization`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Organization

<!-- Links for fb:RangesAndChoices -->
[`fb:RangesAndChoices`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice
[TimeRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=timerange
[TrueAirspeedRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=trueairspeedrange
[VerticalRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=verticalrange

<!-- Links for fb:Types -->
[`fb:Types`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types
[Count]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=count-sequence-numbers
[DateTimeUtc]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutchighprecision
[DateTimeUtcHighPrecision]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutchighprecision
[HyperTextReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=hypertext-references
<!----------------------------------------------------->
