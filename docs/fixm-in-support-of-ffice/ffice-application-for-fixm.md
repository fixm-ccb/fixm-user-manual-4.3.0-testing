# The FF-ICE Application for FIXM

The FF-ICE Application is a [FIXM Application](/general-guidance/applications)
that addresses the specific use of FIXM Core in the context of ICAO
FF-ICE. It provides harmonized FF-ICE Message data structures and the
individual FF-ICE Message templates in line with the requirements on
FF-ICE Messages defined by the ICAO FF-ICE Implementation Guidance
Manual (ICAO Doc 9965 Volume II)<sup>[[6]](#references)</sup>.

The content of the FF-ICE Application is the following:

![Overview of the FF-ICE Application content](.//media/ffice-application-library-for-fixm-01.PNG "Overview of the FF-ICE Application content")

The FF-ICE Application, together with FIXM Core, is developed and published by the FIXM CCB.

## FF-ICE Message data structures

The FF-ICE message data structures are the data elements that
specifically qualify the FF-ICE Messages. They do not describe a Flight
but are necessary for understanding the purpose and meaning of an FF-ICE
information exchange. The FF-ICE message data modelled by the FF-ICE
Application include:

- A model element representing generically an FF-ICE Message with its
  identifier, timestamp, type etc. An enumeration provides the
  possible types of FF-ICE Messages: Filed Flight Plan message,
  Submission Response message, Filing Status message etc.

- Model elements representing the different FF-ICE statuses with their
    possible values: Planning statuses `CONCUR` / `NON_CONCUR` / `NEGOTIATE`,
    Filing statuses `ACCEPTABLE` / `NOT_ACCEPTABLE`, Submission statuses
    `ACK` / `MANUAL` / `REJECT` etc.

- Model elements representing the FF-ICE participants and their
    properties, which are used for identifying the operational
    stakeholders sending and receiving FF-ICE messages, or the list of
    relevant ASPs etc.

The FF-ICE Message data structures are traceable to the FF-ICE
Implementation Guidance Manual Appendix B. For instance:

![Example of FF-ICE Message data structures tracing to the FF-ICE Implementation Guidance Manual, Appendix B](.//media/image29.png "Example of FF-ICE Message data structures tracing to the FF-ICE Implementation Guidance Manual, Appendix B")

The FF-ICE message data structures other than Choices and Enumerations are
extendable. This enables implementers to accommodate additional FF-ICE
message data structures required locally or regionally, in support of
local or regional FF-ICE requirements. Extension hooks are defined in a
similar fashion as for FIXM Core data structures.

The picture below provides an overview of the FF-ICE Message data
structures modelled in the FF-ICE Application.

![Overview of the FF-ICE Message Data Structures](.//media/image30.png "Overview of the FF-ICE Message Data Structures")

## References

[6]: [ATMRPP/3-WP/766](https://ost.eurocontrol.int/sites/FIXM/Shared%20Documents/ICAO%20ATMRPP%20inputs%20for%20FIXM/ATMRPP3_WP_766_FF-ICE1%20Implementation%20Guidance_All.pdf): “Manual on FF-ICE Implementation Guidance”
