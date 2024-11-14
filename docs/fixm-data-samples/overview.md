# List of FIXM Data samples

## Fictitious FIXM data
The following examples are fictitious samples. They represent valid FIXM data and can be used for training purposes or for initial testing.
These samples shall never be used operationally.

|Example|Description|
|:-|:-|
| [Route/Trajectory Example Data](/fixm-in-support-of-ffice/example_data.md)   |  Explains how the route/trajectory example from the FF-ICE/R1 Implementation Guidance Manual (Appendix E-3.7) is concretely encoded in FIXM 4.3.0.|
| [Examples of FF-ICE Messages](/fixm-in-support-of-ffice/example_messages.md) |  Provides examples for all 13 FF-ICE messages specified by the the FF-ICE/R1 Implementation Guidance Manual (Appendix C) |

All samples are available in [github][GIHUB_SAMPLES_REPOSITORY].


## Real world FIXM data

The following table provides an inventory of information services from which real world FIXM data may be retrieved. This list is non-exhaustive. 
Access to, and use of, this FIXM data may be subject to particular access and use conditions specified by the information service provider.

| Information Service | Information Service Provider | Description | Type of FIXM data served | Access conditions |
|:-|:-|:-|:-|:-|
|Flight Data Request Service|EUROCONTROL NM|See [European SWIM Registry][EUROCONTROL_FLIGHT_DATA_REQUEST_SERVICE_DESCRIPTION] |eFPLs and filing statuses encoded in FF-ICE Message 1.1.0 / FIXM Core 4.3.0 format | See [here][EUROCONTROL_NM_B2B_SERVICES] |
|Publication Service|EUROCONTROL NM|See [European SWIM Registry][EUROCONTROL_PUBLICATION_SERVICE_DESCRIPTION]|Flight data including agreed eFPLs and converted FPL in FIXM Core 4.3.0 format | See [here][EUROCONTROL_NM_B2B_SERVICES] |
|...|...|...|...|...|


## FIXM Data "Skeletons"

The following examples provide a structured, comprehensive listing of all the XML elements and attributes that can be present in:  
- FIXM Core (starting with the Flight root element)
- The FF-ICE Message application (starting with the FficeMessage root element)
- The 13 FF-ICE Message templates (starting with the FficeMessage root element with an xsi:type attribute containing the appropriate value (e.g., "FficeFFP_FficeMessageType") added to it)

These XML documents contain only the underlying elements and attributes themselves, not fleshed out with any actual data values - hence the term "skeleton".  The skeletons follow FIXM's validation rules for structure, organization, and content with three exceptions:  
1. No data-bearing elements or attributes contain values (which many fields require)
2. In order to provide a listing of all possible XML elements, every option available under FIXM's xsd:choice elements are present (only one option can be present in schema-valid messages)
3. A handful of templates require at least two instances of a repeating element, but the skeletons only provide one (the goal was not to create schema-valid messages but rather to show the structure and organization of FIXM and what fields are available within it - showing the same sets of fields twice for a small subset of repeating elements does not advance that goal)

Due to these exceptions, the skeletons are not themselves schema-valid messages but, again, this was not the goal.  Rather they are intended to provide an easy way to see the organized content of FIXM messages (without the need for tools such as schema visualizers) as well as supplying simple, structured listings of all available fields for each type of message.

| Example Message | Skeleton Type |
|:-|:-|
| [Flight Skeleton][FixmCore_Skeleton] | [FIXM Core v4.3.0][FixmCore] |
| [FF-ICE Message Skeleton][FficeMsg_Skeleton] | [FF-ICE Message v1.1.0][FficeMsg] |
| [Filed Flight Plan Skeleton][FficeFFP_Skeleton] | [FiledFlightPlan template for FF-ICE Message v1.1.0][FficeFFP] |
| [Filing Status Skeleton][FficeFS_Skeleton] | [FilingStatus template for FF-ICE Message v1.1.0][FficeFS] with [Bug Fix][BugFix] |
| [Flight Arrival Skeleton][FficeFA_Skeleton] | [FlightArrival template for FF-ICE Message v1.1.0][FficeFA] |
| [Flight Cancellation Skeleton][FficeFC_Skeleton] | [FlightCancellation template for FF-ICE Message v1.1.0][FficeFC] |
| [Flight Data Request Skeleton][FficeFDRQ_Skeleton] | [FlightDataRequest template for FF-ICE Message v1.1.0][FficeFDRQ] |
| [Flight Data Response Skeleton][FficeFDRP_Skeleton] | [FlightDataResponse template for FF-ICE Message v1.1.0][FficeFDRP] with [Bug Fix][BugFix] |
| [Flight Departure Skeleton][FficeFD_Skeleton] | [FlightDeparture template for FF-ICE Message v1.1.0][FficeFD] |
| [Flight Plan Update Skeleton][FficeFPU_Skeleton] | [FlightPlanUpdate template for FF-ICE Message v1.1.0][FficeFPU] |
| [Planning Status Skeleton][FficePS_Skeleton] | [PlanningStatus template for FF-ICE Message v1.1.0][FficePS] with [Bug Fix][BugFix] |
| [Preliminary Flight Plan Skeleton][FficePFP_Skeleton] | [PreliminaryFlightPlan template for FF-ICE Message v1.1.0][FficePFP] |
| [Submission Response Skeleton][FficeSR_Skeleton] | [SubmissionResponse template for FF-ICE Message v1.1.0][FficeSR] |
| [Trial Request Skeleton][FficeTRQ_Skeleton] | [TrialRequest template for FF-ICE Message v1.1.0][FficeTRQ] |
| [Trial Response Skeleton][FficeTRP_Skeleton] | [TrialResponse template for FF-ICE Message v1.1.0][FficeTRP] with [Bug Fix][BugFix] |

[EUROCONTROL_FLIGHT_DATA_REQUEST_SERVICE_DESCRIPTION]: https://eur-registry.swim.aero/services/eurocontrol-nm-flightdatarequestservice-270
[EUROCONTROL_PUBLICATION_SERVICE_DESCRIPTION]: https://eur-registry.swim.aero/services/eurocontrol-nm-publicationservice-270
[EUROCONTROL_NM_B2B_SERVICES]: https://www.eurocontrol.int/service/network-manager-business-business-b2b-web-services

[GIHUB_SAMPLES_REPOSITORY]: https://github.com/fixm-ccb/fixm-user-manual-4.3.0-testing/tree/main/docs/assets/downloads/

[FixmCore]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/core/Fixm.xsd
[FficeMsg]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/FficeMessage.xsd
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
[BugFix]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/extensions/fficemessagebugfix/FficeMessageBugFix.xsd

[FixmCore_Skeleton]: .//assets/downloads/Flight_Skeleton.xml
[FficeMsg_Skeleton]: .//assets/downloads/FficeMessage_Skeleton.xml
[FficeFFP_Skeleton]: .//assets/downloads/FiledFlightPlan_Skeleton.xml
[FficeFS_Skeleton]: .//assets/downloads/FilingStatus_Skeleton.xml
[FficeFA_Skeleton]: .//assets/downloads/FlightArrival_Skeleton.xml
[FficeFC_Skeleton]: .//assets/downloads/FlightCancellation_Skeleton.xml
[FficeFDRQ_Skeleton]: .//assets/downloads/FlightDataRequest_Skeleton.xml
[FficeFDRP_Skeleton]: .//assets/downloads/FlightDataResponse_Skeleton.xml
[FficeFD_Skeleton]: .//assets/downloads/FlightDeparture_Skeleton.xml
[FficeFPU_Skeleton]: .//assets/downloads/FlightPlanUpdate_Skeleton.xml
[FficePS_Skeleton]: .//assets/downloads/PlanningStatus_Skeleton.xml
[FficePFP_Skeleton]: .//assets/downloads/PreliminaryFlightPlan_Skeleton.xml
[FficeSR_Skeleton]: .//assets/downloads/SubmissionResponse_Skeleton.xml
[FficeTRQ_Skeleton]: .//assets/downloads/TrialRequest_Skeleton.xml
[FficeTRP_Skeleton]: .//assets/downloads/TrialResponse_Skeleton.xml
