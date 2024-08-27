# General Guidance

This section describes general guidance that is always applicable, whatever the implementation context.  The guidance presented here includes a variety of topics including:  encoding advice and examples, data plausibility rules, rules for absent data, advice on using FIXM in conjunction with other standards, etc.  

<details>
  <summary>fx:Aircraft</summary>

- **fx:Aircraft:** [aircraftAddress], aircraftApproachCategory, aircraftType, [capabilities], coloursAndMarkings, [registration], wakeTurbulence
- **fx:AircraftType:** [aircraftCount], icaoAircraftTypeDesignator, otherAircraftType
  
</details>

<details>
  <summary>fx:Arrival</summary>

- **fx:Arrival:** actualTimeOfArrival, airportSlotIdentification, arrivalAerodrome, destinationAerodrome, destinationAerodromeAlternate, destinationAerodromePrevious, reclearanceInFlight, runwayDirection
- **fx:ActualTimeOfArrival:** position, time, type
  
</details>



[aircraftAddress]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftaddress
[registration]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=registration
[capabilities]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Capability
[aircraftCount]: https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fx_Aircraft?id=aircraftcount
