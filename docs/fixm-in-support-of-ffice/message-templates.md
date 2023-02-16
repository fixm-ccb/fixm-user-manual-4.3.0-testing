# FF-ICE Message Templates

## Overview

The FF-ICE Message templates are the representations of the individual
FF-ICE messages that are exchanged by the FF-ICE Services. Thirteen
message templates are defined in the FF-ICE Application v1.0.0.
They correspond to the thirteen FF-ICE Messages described in the
FF-ICE/R1 Implementation Guidance Manual, Appendix C. The following
table provides the correspondence between the FF-ICE message templates
from the application and their corresponding description in the FF-ICE
Implementation Guidance Manual, Appendix C.

Table 1: Correspondences between FF-ICE Message templates and their ICAO Doc 9965 Volume II<sup>[[6]](#references)</sup> description

| **FF-ICE Message templates** | **Associated Requirements from the FF-ICE Implementation Guidance Manual, Appendix C** |
|-|-|
| [FiledFlightPlan][FficeFFP]              | C-4 Filed Flight Plan                                                                  |
| [FilingStatus][FficeFS]                  | C-5 Filing Status                                                                      |
| [FlightArrival][FficeFA]                 | C-13 Flight Arrival                                                                    |
| [FlightCancellation][FficeFC]            | C-8 Flight Cancellation                                                                |
| [FlightDataRequest][FficeFDRQ]           | C-10 Flight Data Request                                                               |
| [FlightDataResponse][FficeFDRP]          | C-11 Flight Data Response                                                              |
| [FlightDeparture][FficeFD]               | C-12 Flight Departure                                                                  |
| [FlightPlanUpdate][FficeFPU]             | C-9 Flight Plan Update                                                                 |
| [PlanningStatus][FficePS]                | C-3 Planning Status                                                                    |
| [PreliminaryFlightPlan][FficePFP]        | C-2 Preliminary Flight Plan                                                            |
| [SubmissionResponse][FficeSR]            | C-1 Submission Response                                                                |
| [TrialRequest][FficeTRQ]                 | C-6 Trial Request                                                                      |
| [TrialResponse][FficeTRP]                | C-7 Trial Response                                                                     |

The FF-ICE Message templates define concretely the restricted subsets of the FF-ICE Message data elements of the FIXM Core flight elements that are relevant for each FF-ICE message transaction. They explicitly
declare which elements are mandatory, optional or irrelevant in each
case, and enforce stricter content patterns as appropriate.

## Example of the FF-ICE ‘Flight Cancellation’ Message

The following table is a simplified version of table C-8 from the FF-ICE Implementation Guidance Manual, Appendix C. It describes the content of the FF-ICE Flight Cancellation Message and indicates which fields are mandatory (highlighted **in bold** in this document) or optional (highlighted in *in italic*).

Table 2: Example of the FF-ICE Flight Cancellation Message

| **Data Category**          | **Data Item**                            | **Requirement** |
|-|-|-|
| Message Information        | **List of Recipients**                   | **Mandatory**   |
|                            | **Message Originator**                   | **Mandatory**   |
|                            | *Request for Translation and Forwarding* | *Optional*      |
|                            | *Requested Recipients*                   | *Optional*      |
|                            | **Message Date-Time**                    | **Mandatory**   |
|                            | **Message Identifier**                   | **Mandatory**   |
|                            | **Type of Request/Response**             | **Mandatory**   |
|                            | *AFTN Address*                           | *Optional*      |
|                            | *Contact Information*                    | *Optional*      |
| Flight Identification      | **GUFI**                                 | **Mandatory**   |
|                            | **GUFI Originator**                      | **Mandatory**   |
|                            | **Aircraft Identification**              | **Mandatory**   |
| Departure/Destination Data | **Departure Aerodrome**                  | **Mandatory**   |
|                            | **Destination Aerodrome**                | **Mandatory**   |
|                            | **Estimated Off-Block Time**             | **Mandatory**   |

The FF-ICE Application translates this table into an implementable message template. This is illustrated by the picture
below. The message template resulting from the translation of this table is displayed with a blue background.

![The FF-ICE Flight Cancellation Message Template](.//media/image31.png "The FF-ICE Flight Cancellation Message Template")

### Explanations

![Explanations](.//media/image32.png  ':size=50%')

**XSD complex type restrictions** are used to pare down the Flight and
the FF-ICE Message data structures to just those fields that are
applicable to the Flight Cancellation Message, as well as to enforce
stricter optionality and content patterns where appropriate.

The XSD complex type restrictions are implemented by creating a new
class that generalizes the class to be restricted and then applying the
`<<XSDrestriction>>` stereotype to the generalization
connector, as shown in brown on the picture above.

![Explanations](.//media/image33.png  ':size=50%')

XML elements being irrelevant in the context of the message template are
eliminated by removing them from the model, as shown in red on the
picture opposite. Elements being mandatory in the context of the message
template have their cardinality set to (at least) 1 in the restriction,
as shown in blue.

![Explanations](.//media/image34.png "Explanations")

In general, all optionality, cardinality, and pattern restrictions are
implemented by applying the desired changes to the restricted class.

Because XSD complex type restrictions must use the same namespace as the types they restrict, it is necessary to change their names. The
convention used in the FF-ICE Application is to prepend each
restricted class with “Ffice” plus an initialism of the message being
modeled – hence **FficeFC** for the FF-ICE **F**light
**C**ancellation Message.

Restricted classes require the restricted versions of associated
sub-classes. XSD complex type restrictions are therefore linked together to form an entire restricted message. This provides clear guidance on how the FF-ICE message template is constructed.

![Explanations](.//media/image35.png "Explanations")


[FficeFFP]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/filedflightplan/fficemessage/FficeFFP_FficeMessage.xsd
[FficeFS]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/filingstatus/fficemessage/FficeFS_FficeMessage.xsd
[FficeFA]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightarrival/fficemessage/FficeFA_FficeMessage.xsd
[FficeFC]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightcancellation/fficemessage/FficeFC_FficeMessage.xsd
[FficeFDRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightdatarequest/fficemessage/FficeFDRQ_FficeMessage.xsd
[FficeFDRP]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightdataresponse/fficemessage/FficeFDRP_FficeMessage.xsd
[FficeFD]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightdeparture/fficemessage/FficeFD_FficeMessage.xsd
[FficeFPU]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/flightplanupdate/fficemessage/FficeFPU_FficeMessage.xsd
[FficePS]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/planningstatus/fficemessage/FficePS_FficeMessage.xsd
[FficePFP]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/preliminaryflightplan/fficemessage/FficePFP_FficeMessage.xsd
[FficeSR]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/submissionresponse/fficemessage/FficeSR_FficeMessage.xsd
[FficeTRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/trialrequest/fficemessage/FficeTRQ_FficeMessage.xsd
[FficeTRP]: https://www.fixm.aero/releases/FFICE-Msg-1.0.0/schemas/applications/fficemessage/fficetemplates/trialresponse/fficemessage/FficeTRP_FficeMessage.xsd

## References

[6]: [ATMRPP/3-WP/766](https://ost.eurocontrol.int/sites/FIXM/Shared%20Documents/ICAO%20ATMRPP%20inputs%20for%20FIXM/ATMRPP3_WP_766_FF-ICE1%20Implementation%20Guidance_All.pdf): “Manual on FF-ICE Implementation Guidance”
