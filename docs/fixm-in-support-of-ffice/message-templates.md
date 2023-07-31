# FF-ICE Message Templates

## Overview

The FF-ICE Message templates are the representations of the individual
FF-ICE messages that are exchanged by the FF-ICE Services. Thirteen
message templates are defined in the FF-ICE Application v1.1.0.
They correspond to the thirteen FF-ICE Messages described in the
FF-ICE/R1 Implementation Guidance Manual, Appendix C. The following
table provides the correspondence between the FF-ICE message templates
from the application and their corresponding description in the FF-ICE
Implementation Guidance Manual, Appendix C.

Table 1: Correspondences between FF-ICE Message templates and their ICAO Doc 9965 Volume II<sup>[[I-06]](#references)</sup> description

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

The FF-ICE Message templates concretely define the restricted subsets of the FF-ICE Message data elements and the FIXM Core flight elements that are relevant for each FF-ICE message transaction. They explicitly
declare which elements are mandatory, optional, or irrelevant in each case and enforce stricter content patterns as appropriate.

## Example of the FF-ICE ‘Flight Cancellation’ Message

The following table is a simplified version of table C-8 from the FF-ICE Implementation Guidance Manual, Appendix C. It describes the content of the FF-ICE Flight Cancellation Message and indicates which fields are mandatory (highlighted **in bold** in this document) or optional (highlighted in *in italics*).

Table 2: Example of the FF-ICE Flight Cancellation Message

| **Data Category**          | **Data Item**                            | **Requirement** |
|-|-|-|
| Message Information        | **List of Recipients**                   | **Mandatory**   |
|                            | **Message Originator**                   | **Mandatory**   |
|                            | *Request for Translation and Delivery*   | *Optional*      |
|                            | *Requested Recipients*                   | *Optional*      |
|                            | *Request for Fowarding*                  | *Optional*      |
|                            | **Relevant ASPs**                        | **Mandatory**   |
|                            | **Message Date-Time**                    | **Mandatory**   |
|                            | **Message Identifier**                   | **Mandatory**   |
|                            | **Type of Request/Response**             | **Mandatory**   |
|                            | *AFTN Address*                           | *Optional*      |
|                            | *Contact Information*                    | *Optional*      |
| Flight Identification      | **GUFI**                                 | **Mandatory**   |
|                            | **Aircraft Identification**              | **Mandatory**   |
| Departure/Destination Data | **Departure Aerodrome**                  | **Mandatory**   |
|                            | **Destination Aerodrome**                | **Mandatory**   |
|                            | **Estimated Off-Block Time**             | **Mandatory**   |

The FF-ICE Application translates this table into an implementable message template. This is illustrated by the picture
below. 

![Explanations](.//media/image35.png "Explanations")

### Explanations

**XSD complex type restrictions** are used to pare down the Core and
the FF-ICE Message data structures to just those fields that are
applicable to the Flight Cancellation Message, as well as to enforce
stricter optionality. Additionally, **XSD simple type restrictions** 
are used to adjust content patterns where appropriate.

These XSD restrictions are implemented by creating a new
class that generalizes the class to be restricted and then applying the
`<<XSDrestriction>>` stereotype to the generalization
connector, as shown in brown on the picture below.

![Explanations](.//media/image32.png  ':size=50%')

XML elements that are irrelevant in the context of the message template are
eliminated by removing them from the model, as shown in red on the
picture below. Elements that are mandatory in the context of the message
template have their cardinality set to (at least) 1 in the restriction,
as shown in blue.

![Explanations](.//media/image33.png  ':size=50%')

In general, all optionality, cardinality, and pattern restrictions are
implemented by applying the desired changes to the restricted class.

Because XSD complex type restrictions must use the same namespace as the types they restrict, it is necessary to change their names. The
convention used in the FF-ICE Application is to prepend each
restricted class with “Ffice” plus an initialism of the message being
modeled – hence <mark>FficeFC</mark> for the FF-ICE <mark>F</mark>light
<mark>C</mark>ancellation Message.

![Explanations](.//media/image34.png "Explanations")

Restricted classes require the restricted versions of associated
sub-classes. XSD complex type restrictions are therefore linked together to form an entire restricted message. This provides clear guidance on how the FF-ICE message template is constructed.

The full message template resulting from this process is displayed below.  The section with a blue background contains the restricted classes (that is, the template itself).  The sections above and below show the FF-ICE Message and Core content these templates restrict and otherwise make use of.

![The FF-ICE Flight Cancellation Message Template](.//media/image31.png "The FF-ICE Flight Cancellation Message Template")

[FficeFFP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/filedflightplan/fficemessage/FficeFFP_FficeMessage.xsd
[FficeFS]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/filingstatus/fficemessage/FficeFS_FficeMessage.xsd
[FficeFA]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightarrival/fficemessage/FficeFA_FficeMessage.xsd
[FficeFC]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightcancellation/fficemessage/FficeFC_FficeMessage.xsd
[FficeFDRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdatarequest/fficemessage/FficeFDRQ_FficeMessage.xsd
[FficeFDRP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdataresponse/fficemessage/FficeFDRP_FficeMessage.xsd
[FficeFD]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightdeparture/fficemessage/FficeFD_FficeMessage.xsd
[FficeFPU]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/flightplanupdate/fficemessage/FficeFPU_FficeMessage.xsd
[FficePS]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/planningstatus/fficemessage/FficePS_FficeMessage.xsd
[FficePFP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/preliminaryflightplan/fficemessage/FficePFP_FficeMessage.xsd
[FficeSR]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/submissionresponse/fficemessage/FficeSR_FficeMessage.xsd
[FficeTRQ]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/trialrequest/fficemessage/FficeTRQ_FficeMessage.xsd
[FficeTRP]: https://www.fixm.aero/releases/FFICE-Msg-1.1.0/schemas/applications/fficemessage/fficetemplates/trialresponse/fficemessage/FficeTRP_FficeMessage.xsd

## Intentional Differences between the Implementation Guidance and Templates

There are a number of intentional differences between the message content as described in the FF-ICE Implementation Guidance Manual, Appendices B & C, and the FF-ICE Application v1.1.0 templates.  These discrepancies fall into two categories:  __technical__ and __forward looking__.  The __technical__ differences are present to accommodate the realities of implementing concepts in a physical model, such as including fields for backwards compatibility reasons or accommodating FF-ICE content that could preferably be represented outside of an XML payload.  The __forward looking__ differences are instances where significant, upcoming changes were incorporated into FIXM even though they were not present in the version of the Implementation Guidance the model was based on.

### Technical

Perhaps the most visible of the technical differences between the FF-ICE templates and Appendix C are the mandatory Message Information fields marked with "Note 1".  From the Implementation Guidance:

> Note 1: Can be implemented by communications infrastructure.

This is further described in the beginning of Appendix C:

> Data items identified in "Message Information" are information that should be made available to the application that processes the message; however some of the data elements could logically be implemented within the communications infrastructure, e.g. a header - analogous to the AFTN header described in Annex 10. For example, the list of relevant ANSPs for an existing flight may be obtained from existing data, possibly obtained via the communications infrastructure, and therefore does not need to be repeated in subsequent messages for that flight. Because a communications infrastructure has not been specified, only general data items can be defined at this time.

To accommodate this, the FF-ICE templates leave these fields optional, even though they described as mandatory, to allow these fields to be absent from the XML body of a message if capturing this information in the communications infrastructure's header fields is preferred. This accommodation is plainly visible in the first diagram in this section where most of the "Message Information" mandatory fields are clearly left as optional.

Another notable technical difference is the inclusion of the legacy version of the GUFI in the FF-ICE templates.  Though FF-ICE has updated the composition of the GUFI, FIXM needed to include the legacy version of the GUFI to allow for messages published using older versions to be translated to the latest version, supporting backwards compatibility.

Additionally, there are a number of other, small technical variations throughout the model, such as letting the "type" of a constraint be derived from the provided constraint value(s) (e.g., providing only a lower bound indicates a constraint type of "at or above", providing both an upper and lower bound indicates a constraint type of "between") to avoid possible points of data integrity failure.  These differences are largely considered minor enough to not need to be documented here.

### Forward Looking

The most important forward looking difference is the change between how the composition of the GUFI is described in the Implementation Guidance and how it is implemented in FIXM.  The version in FIXM incorporates the simplification of the possible namespace domains eventually adopted by the ATMRPP, leaving only `LOCATION_INDICATOR`, `OPERATING_AGENCY_DESIGNATOR`, and the newly introduced `FULLY_QUALIFIED_DOMAIN_NAME` as options.  

Other forward looking changes include the addition of fields in the FF-ICE templates that had been unintentionally left out of Appendix C:
* The addition of General Flight Constraints to the templates corresponding to C-2, C-3, C-4, C-5, C-6, C-7, and C-9.
* The addition of runway information to the templates corresponding to C-3 and C-7.

There was also an update to make `airspeed` optional for performance profile points.

## References

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 
