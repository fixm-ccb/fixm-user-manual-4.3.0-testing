# General Guidance

This section describes general guidance that is always applicable, whatever the implementation context.  The guidance presented here includes a variety of topics including:  encoding advice and examples, data plausibility rules, rules for absent data, advice on using FIXM in conjunction with other standards, etc.  

---
Package [`fx:Aircraft`]
- **fx:Aircraft:** [aircraftAddress], aircraftApproachCategory, aircraftType, [capabilities], coloursAndMarkings, [registration], wakeTurbulence
- **fx:AircraftType:** [aircraftCount], icaoAircraftTypeDesignator, otherAircraftType
---
Package `fx:Arrival`
- **fx:Arrival:** actualTimeOfArrival, [airportSlotIdentification], arrivalAerodrome, destinationAerodrome, destinationAerodromeAlternate, [destinationAerodromePrevious], reclearanceInFlight, runwayDirection
---
Package `fx:Capability`
- **fx:Capability:** [communication], navigation, standardCapabilities, surveillance, survival
- **fx:CommunicationCapabilities:** communicationCapabilityCode, datalinkCommunicationCapabilityCode, otherCommunicationCapabilities, otherDatalinkCapabilities, [selectiveCallingCode]
- **fx:NavigationCapabilities:** navigationCapabilityCode, otherNavigationCapabilities, performanceBasedCode, requiredRunwayVisualRange
- **fx:SurveillanceCapabilities:** otherSurveillanceCapabilities, surveillanceCapabilityCode
- **fx:SurvivalCapabilities:** carriedEltHexIdentifier, dinghyInformation, emergencyRadioCapabilityType, lifeJacketType, survivalEquipmentRemarks, survivalEquipmentType
---
Package `fx:Cargo`
- **fx:DangerousGoods:** aircraftLimitation, airWaybillNumber, onboardLocation, packageGroup, shippingInformation
<!-- - **fx:DangerousGoodsPackageGroup:** dangerousGoodsPackage, shipmentDimensions -->
<!-- - **fx:DangerousGoodsPackage:** allPackedInOne, compatibilityGroup, dangerousGoodsLimitation, dangerousGoodsQuantity, hazardClass, packingGroup, properShippingName, radioactiveMaterials, shipmentDimensions, subsidiaryHazardClass, unNumber -->
---
Package `fx:Departure`
- **fx:Departure:** actualTimeOfDeparture, [airfileIndicator], airportSlotIdentification, [departureAerodrome], [departureAerodromePrevious], [departurePoint], [departurePointPrevious], [estimatedOffBlockTime], [estimatedOffBlockTimePrevious], [estimatedRouteStartTime], [estimatedRouteStartTimePrevious], runwayDirection, takeoffAlternateAerodrome
---
Package `fx:Emergency`
- **fx:FlightEmergency:** actionTaken, emergencyDescription, lastContact, originator, otherInformation, phase
<!-- - **fx:LastContactType:** lastContactFrequency, lastContactTime, lastContactUnit, position -->
- **fx:RadioCommunicationFailure:** contact, radioFailureRemarks, remainingComCapability
---
Package `fx:EnRoute`
- **fx:EnRoute:** alternateAerodrome, boundaryCrossingCoordination, currentModeACode
- **fx:BoundaryCrossing:** altitudeInTransition, clearedLevel, crossingPoint, crossingTime
---
Package `fx:FlightData`
- **fx:Flight:** [aircraft], [arrival], [dangerousGoods], [departure], [emergency], [enRoute], flightConstraint, [flightIdentification], flightPlanOriginator, flightPlanSubmitter, flightRulesCategory, flightType, operator, radioCommunicationFailure, remarks, routeTrajectoryGroup, specialHandling, supplementaryInformation
- **fx:FlightIdentification:** [aircraftIdentification], [aircraftIdentificationPrevious], [gufi], [gufiLegacy], iataFlightDesignator
- **fx:RouteTrajectoryGroupContainer:** agreed, current, desired, negotiating
---
Package `fx:RouteChanges`
- **fx:RouteChange:** cruiseClimbStart, level, speed 
---
Package `fx:RouteTrajectory`
- **fx:RouteTrajectoryGroup:** [climbProfile], climbSchedule, [descentProfile], descentSchedule, element, [routeInformation], takeoffMass
- **fx:FlightRouteInformation:** [airacReference], cruisingLevel, cruisingSpeed, estimatedElapsedTime, routeText, totalEstimatedElapsedTime
- **fx:PerformanceProfile:** [profilePoint]
- **fx:RouteTrajectoryElement:** alongRouteDistance, [constraint], elementStartPoint, flightRulesChange, modified, modifiedRouteItemReference, plannedDelay, [point4D], [routeChange], routeDesignatorToNextElement, routeTruncationIndicator, [seqNum]
- **fx:TrajectoryPoint4D:** altimeterSetting, level, metData, [pointProperty], position, predictedAirspeed, predictedGroundspeed, time, verticalRange
- **fx:TrajectoryPointProperty:** description, [propertyType], reference
---
Package `fx:RouteTrajectoryConstraint`
- **fx:RouteTrajectoryConstraint:** departureOrArrivalIndicator, description, level, restrictionReference, speed, time
---
Package `fb:Address`
- [ContactInformation], [OnlineContact], [PostalAddress], TelephoneContact
---
Package `fb:AeronauticalReference`
- [AerodromeReference], [AirspaceDesignator], [AtcUnitReference], [DesignatedPoint], [GeographicalPosition], [Navaid], [RelativePoint], [RouteDesignator], [RunwayDirectionDesignator]
---
Package `fb:Measures`
- [Altitude], AltitudeWithSource, Angle, Bearing, [FlightLevel], Frequency, GroundSpeed, [Height], IndicatedAirspeed, Length, Mass, Pressure, Speed, Temperature, TrueAirspeed, [VerticalDistance], VerticalRate, Volume, Weight, WindDirection, WindSpeed
---
Package `fb:Organization`
- AircraftOperator, PersonOrOrganisation
---
Package `fb:RangesAndChoices`
- [TimeRange], [TrueAirspeedRange], [VerticalRange]
---
Package `fb:Types`
- [Count], [DateTimeUtc], [DateTimeUtcHighPrecision], DateUtc, Duration, [HyperTextReference]
---

<!----------------------------------------------------->
<!-- Links for fx:Aircraft -->
[`fx:Aircraft`]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft
[aircraftAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftaddress
[registration]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=registration
[capabilities]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability
[aircraftCount]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftcount

<!-- Links for fx:Arrival -->
[destinationAerodromePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification

<!-- Links for fx:Capability -->
[communication]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability?id=communication
[selectiveCallingCode]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability?id=selectivecallingcode

<!-- Links for fx:Departure -->
[airfileIndicator]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=airfileindicator
[airportslotidentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=airportslotidentification
[departureAerodrome]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=departureaerodrome-departurepoint
[departureAerodromePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[departurePoint]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=departureaerodrome-departurepoint
[departurePointPrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[estimatedOffBlockTime]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=estimatedoffblocktime-estimatedroutestarttime
[estimatedOffBlockTimePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[estimatedRouteStartTime]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=estimatedoffblocktime-estimatedroutestarttime
[estimatedRouteStartTimePrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification

<!-- Links for fx:FlightData -->
[aircraft]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=encoding-guidance-for-fxaircraft
[arrival]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Arrival?id=encoding-guidance-for-fxarrival
[dangerousGoods]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Cargo?id=encoding-guidance-for-fxcargo
[departure]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Departure?id=encoding-guidance-for-fxdeparture
[emergency]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Emergency?id=encoding-guidance-for-fxemergency
[enRoute]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_EnRoute?id=encoding-guidance-for-fxenroute
[flightIdentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=flightidentification
[aircraftIdentification]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[aircraftIdentificationPrevious]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=aircraftidentification
[gufi]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=gufi
[gufiLegacy]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_FlightData?id=compatibility-with-fixm-core-420

<!-- Links for fx:RouteTrajectory -->
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

<!-- Links for fb:Address -->
[ContactInformation]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=contactinformation
[OnlineContact]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=onlinecontact
[PostalAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Address?id=postaladdress

<!-- Links for fb:AeronauticalReference -->
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
[VerticalDistance]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[Altitude]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[FlightLevel]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance
[Height]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Measures?id=verticaldistance

<!-- Links for fb:RangesAndChoices -->
[TimeRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=timerange
[TrueAirspeedRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=trueairspeedrange
[VerticalRange]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_RangesAndChoice?id=verticalrange

<!-- Links for fb:Types -->
[Count]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=count-sequence-numbers
[DateTimeUtc]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutchighprecision
[DateTimeUtcHighPrecision]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_Types?id=datetimeutchighprecision
[HyperTextReference]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fb_AeronauticalReference?id=href
<!----------------------------------------------------->
