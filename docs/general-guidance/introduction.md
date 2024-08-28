# General Guidance

This section describes general guidance that is always applicable, whatever the implementation context.  The guidance presented here includes a variety of topics including:  encoding advice and examples, data plausibility rules, rules for absent data, advice on using FIXM in conjunction with other standards, etc.  


---
Package `fx:Aircraft`
- **fx:Aircraft:** [aircraftAddress], aircraftApproachCategory, aircraftType, [capabilities], coloursAndMarkings, [registration], wakeTurbulence
- **fx:AircraftType:** [aircraftCount], icaoAircraftTypeDesignator, otherAircraftType
---
Package `fx:Arrival`
- **fx:Arrival:** actualTimeOfArrival, airportSlotIdentification, arrivalAerodrome, destinationAerodrome, destinationAerodromeAlternate, destinationAerodromePrevious, reclearanceInFlight, runwayDirection
---
Package `fx:Capability`
- **fx:Capability:** communication, navigation, standardCapabilities, surveillance, survival
- **fx:CommunicationCapabilities:** communicationCapabilityCode, datalinkCommunicationCapabilityCode, otherCommunicationCapabilities, otherDatalinkCapabilities, selectiveCallingCode
- **fx:NavigationCapabilities:** navigationCapabilityCode, otherNavigationCapabilities, performanceBasedCode, requiredRunwayVisualRange
- **fx:SurveillanceCapabilities:** otherSurveillanceCapabilities, surveillanceCapabilityCode
- **fx:SurvivalCapabilities:** carriedEltHexIdentifier, dinghyInformation, emergencyRadioCapabilityType, lifeJacketType, survivalEquipmentRemarks, survivalEquipmentType
---
Package `fx:Cargo`
- **fx:DangerousGoods:** aircraftLimitation, airWaybillNumber, onboardLocation, packageGroup, shippingInformation
- **fx:DangerousGoodsPackageGroup:** dangerousGoodsPackage, shipmentDimensions
- **fx:DangerousGoodsPackage:** allPackedInOne, compatibilityGroup, dangerousGoodsLimitation, dangerousGoodsQuantity, hazardClass, packingGroup, properShippingName, radioactiveMaterials, shipmentDimensions, subsidiaryHazardClass, unNumber
---
Package `fx:Departure`
- **fx:Departure:** actualTimeOfDeparture, airfileIndicator, airportSlotIdentification, departureAerodrome, departureAerodromePrevious, departurePoint, departurePointPrevious, estimatedOffBlockTime, estimatedOffBlockTimePrevious, estimatedRouteStartTime, estimatedRouteStartTimePrevious, runwayDirection, takeoffAlternateAerodrome
---
Package `fx:Emergency`
- **fx:FlightEmergency:** actionTaken, emergencyDescription, lastContact, originator, otherInformation, phase
- **fx:LastContactType:** lastContactFrequency, lastContactTime, lastContactUnit, position
- **fx:LastPositionReport:** altitude, determinationMethod, groundSpeed, heading, horizontalAccuracy, position, timeAtPosition
- **fx:RadioCommunicationFailure:** contact, radioFailureRemarks, remainingComCapability
---
Package `fx:EnRoute`
- **fx:EnRoute:** alternateAerodrome, boundaryCrossingCoordination, currentModeACode
- **fx:BoundaryCrossing:** altitudeInTransition, clearedLevel, crossingPoint, crossingTime
---
Package `fx:FlightData`
- **fx:Flight:** aircraft, arrival, dangerousGoods, departure, emergency, enRoute, flightConstraint, flightIdentification, flightPlanOriginator, flightPlanSubmitter, flightRulesCategory, flightType, operator, radioCommunicationFailure, remarks, routeTrajectoryGroup, specialHandling, supplementaryInformation
- **fx:FlightIdentification:** aircraftIdentification, aircraftIdentificationPrevious, gufi, gufiLegacy, iataFlightDesignator
- **fx:RouteTrajectoryGroupContainer:** agreed, current, desired, negotiating
---
Package `fx:RouteChanges`
- **fx:RouteChange:** cruiseClimbStart, level, speed 
---
Package `fx:RouteTrajectory`
- **fx:RouteTrajectoryGroup:** climbProfile, climbSchedule, descentProfile, descentSchedule, element, extension, routeInformation, takeoffMass
- **fx:FlightRouteInformation:** airacReference, cruisingLevel, cruisingSpeed, estimatedElapsedTime, routeText, totalEstimatedElapsedTime
- **fx:PerformanceProfile:** profilePoint
- **fx:RouteTrajectoryElement:** alongRouteDistance, constraint, elementStartPoint, extension, flightRulesChange, modified, modifiedRouteItemReference, plannedDelay, point4D, routeChange, routeDesignatorToNextElement, routeTruncationIndicator, seqNum
- **fx:TrajectoryPoint4D:** altimeterSetting, level, metData, pointProperty, position, predictedAirspeed, predictedGroundspeed, time, verticalRange
- **fx:TrajectoryPointProperty:** description, propertyType, reference
---
Package `fx:RouteTrajectoryConstraint`
- **fx:RouteTrajectoryConstraint:** departureOrArrivalIndicator, description, level, restrictionReference, speed, time
---



[aircraftAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftaddress
[registration]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=registration
[capabilities]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability
[aircraftCount]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftcount
