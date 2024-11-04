# Examples of FF-ICE Messages

The following table provides fictitious examples of FF-ICE Messages.

| FF-ICE Message | FIXM Template | FIXM XML samples |
|:-|:-|:-|
| C-1 Submission Response       | [SubmissionResponse][FficeSR]            |  [Example 1][FficeSR_Example_1]    |
| C-2 Preliminary Flight Plan   | [PreliminaryFlightPlan][FficePFP]        |  Coming soon                       |
| C-3 Planning Status           | [PlanningStatus][FficePS]                |  Coming soon                       |
| C-4 Filed Flight Plan         | [FiledFlightPlan][FficeFFP]              |  [Example 1][FficeFFP_Example_1]   |
| C-5 Filing Status             | [FilingStatus][FficeFS]                  |  [Example 1][FficeFS_Example_1]    |
| C-6 Trial Request             | [TrialRequest][FficeTRQ]                 |  [Example 1][FficeTRQ_Example_1]   |
| C-7 Trial Response            | [TrialResponse][FficeTRP]                |  [Example 1][FficeTRP_Example_1]   |
| C-8 Flight Cancellation       | [FlightCancellation][FficeFC]            |  [Example 1][FficeFC_Example_1]    |
| C-9 Flight Plan Update        | [FlightPlanUpdate][FficeFPU]             |  [Example 1][FficeFPU_Example_1]   |
| C-10 Flight Data Request      | [FlightDataRequest][FficeFDRQ]           |  [Example 1][FficeFDRQ_Example_1]  |
| C-11 Flight Data Response     | [FlightDataResponse][FficeFDRP]          |  [Example 1][FficeFDRP_Example_1] *(a response to a request of type FLIGHT_PLAN. It also illustrates the use of the bugfix for exchanging element flightRulesCategory.)* <br> [Example 2][FficeFDRP_Example_2] *(a response to a request of type FLIGHT_STATUS.)* |
| C-12 Flight Departure         | [FlightDeparture][FficeFD]               |  [Example 1][FficeFD_Example_1]    |
| C-13 Flight Arrival           | [FlightArrival][FficeFA]                 |  [Example 1][FficeFA_Example_1]    |


[FficeFFP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/filedflightplan/FiledFlightPlan.xsd
[FficeFS]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/filingstatus/FilingStatus.xsd
[FficeFA]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightarrival/FlightArrival.xsd
[FficeFC]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightcancellation/FlightCancellation.xsd
[FficeFDRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdatarequest/FlightDataRequest.xsd
[FficeFDRP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdataresponse/FlightDataResponse.xsd
[FficeFD]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdeparture/FlightDeparture.xsd
[FficeFPU]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightplanupdate/FlightPlanUpdate.xsd
[FficePS]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/planningstatus/PlanningStatus.xsd
[FficePFP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/preliminaryflightplan/PreliminaryFlightPlan.xsd
[FficeSR]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/submissionresponse/SubmissionResponse.xsd
[FficeTRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/trialrequest/TrialRequest.xsd
[FficeTRP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/trialresponse/TrialResponse.xsd

[FficeFFP_Example_1]: .//assets/downloads/C-4_Filed_Flight_Plan_EXAMPLE_001.xml
[FficeFS_Example_1]: .//assets/downloads/C-5_Filing_Status_EXAMPLE_001.xml
[FficeFA_Example_1]: .//assets/downloads/C-13_Flight_Arrival_EXAMPLE_001.xml
[FficeFC_Example_1]: .//assets/downloads/C-8_Flight_Cancellation_EXAMPLE_001.xml
[FficeFDRQ_Example_1]: .//assets/downloads/C-10_Flight_Data_Request_EXAMPLE_001.xml
[FficeFDRP_Example_1]: .//assets/downloads/C-11_Flight_Data_Response_EXAMPLE_001.xml
[FficeFDRP_Example_2]: .//assets/downloads/C-11_Flight_Data_Response_EXAMPLE_002.xml
[FficeFD_Example_1]: .//assets/downloads/C-12_Flight_Departure_EXAMPLE_001.xml
[FficeFPU_Example_1]: .//assets/downloads/C-9_Flight_Plan_Update_EXAMPLE_001.xml
[FficeSR_Example_1]: .//assets/downloads/C-1_Submission_Response_EXAMPLE_001.xml
[FficeTRQ_Example_1]: .//assets/downloads/C-6_Trial_Request_EXAMPLE_001.xml
[FficeTRP_Example_1]: .//assets/downloads/C-7_Trial_Response_EXAMPLE_001.xml







