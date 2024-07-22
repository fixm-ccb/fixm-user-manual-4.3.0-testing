# List of FIXM Data samples

## Fictitious FIXM data
The following examples are fictitious samples. They represent valid FIXM data and can be used for training purpose, or for initial testing.
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


[EUROCONTROL_FLIGHT_DATA_REQUEST_SERVICE_DESCRIPTION]: https://eur-registry.swim.aero/services/eurocontrol-nm-flightdatarequestservice-270
[EUROCONTROL_PUBLICATION_SERVICE_DESCRIPTION]: https://eur-registry.swim.aero/services/eurocontrol-nm-publicationservice-270
[EUROCONTROL_NM_B2B_SERVICES]: https://www.eurocontrol.int/service/network-manager-business-business-b2b-web-services

[GIHUB_SAMPLES_REPOSITORY]: https://github.com/fixm-ccb/fixm-user-manual-4.3.0-testing/tree/main/docs/assets/downloads
