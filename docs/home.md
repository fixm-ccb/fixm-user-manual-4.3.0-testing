# Welcome to the FIXM User Manual

The `FIXM User Manual` is the online documentation of the FIXM project. Content has been subject to FIXM Change Control Board (CCB) review and endorsement and is therefore the official recommendation of the FIXM CCB.

This edition of the `FIXM User Manual` provides guidance for [FIXM Core 4.3.0], the [FF-ICE Application 1.1.0] and the [Basic Application 1.1.0].

Guidance for previous releases is available at the following links:
- [User Manual for FIXM 4.2.0 and related Applications]
- [Implementation Guidance for FIXM 4.1.0]


## Content Overview

The `FIXM User Manual` provides access to the **strategic documents** that guide the overall FIXM development, and captures **technical guidance** for the implementation of FIXM. The official FIXM components are available on the FIXM Website<sup>[[F-01]](#references)</sup>. 

```mermaid
graph LR

FIXM((FIXM))

subgraph Strategic Documents
STRATEGY[FIXM<br>Strategy]
CHARTER[FIXM Change<br>Management Charter]
VERSIONING[FIXM<br>Versioning Policy]
end

subgraph Technical Guidance
FIXM_COMPONENTS[FIXM<br>Components]
GENERAL_GUIDANCE[General<br>Guidance]
FIXM_FOR_FFICE[Using FIXM<br>for FF-ICE]
FIXM_FOR_OTHER_USE[Using FIXM<br>for other use cases]
HOW_TO[How to...<br>sections]
FIXM_DEV_TOOLS_COMPATIBILITY[Development tools<br>compatibility]
end

FIXM -. defines<br>strategic requirements for .- STRATEGY
FIXM -.  formalizes<br>change management and<br>operating procedures for .- CHARTER
FIXM -.  details method<br>for versioning .- VERSIONING


FIXM_COMPONENTS-. provides explanations<br>about the components of .- FIXM
GENERAL_GUIDANCE-. describes general<br>encoding rules for .- FIXM
FIXM_FOR_FFICE-. provides guidance<br>in support of<br>FF-ICE implementation<br>using .- FIXM
FIXM_FOR_OTHER_USE-. provides guidance<br>for non-ICAO use cases<br>using.- FIXM
HOW_TO-. provides guidance for<br>creating 3rd party's<br>Applications/Extensions of .- FIXM
FIXM_DEV_TOOLS_COMPATIBILITY-. reports about software<br>compatibility of.- FIXM

style FIXM stroke-width:3px

click STRATEGY "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/strategic-docs/strategy" "Browse the FIXM Strategy"
click CHARTER "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/strategic-docs/charter" "Browse the FIXM Change Management Charter"
click VERSIONING "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/strategic-docs/versioning_policy" "Browse the FIXM Versioning Policy"

click FIXM_COMPONENTS "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/fixm-components-introduction" "Explanations about the main FIXM components"
click GENERAL_GUIDANCE "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/general-guidance/introduction" "The general rules always  applicable to FIXM"
click FIXM_FOR_FFICE "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/fixm-in-support-of-ffice/ffice-application-for-fixm" "Guidance about the use of FIXM for FF-ICE"
click FIXM_FOR_OTHER_USE "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/fixm-for-other-use-cases/using-fixm-core-without-an-application" "Guidance about the usage of FIXM in other contexts"
click HOW_TO "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/how-to-create-application/introduction" "The How to section for FIXM"
click FIXM_DEV_TOOLS_COMPATIBILITY "https://fixm-ccb.github.io/fixm-user-manual-4.3.0-testing/#/fixm-development-tool-compatibility/introduction" "Information about the compatibility of FIXM with mainstream development tools"
```

Note: The content of the FIXM User Manual is informative. The use of the words *shall* or *required* indicates a requirement to be strictly followed in order to conform to this guidance. The use of the words *should* or *recommended* indicates that there may may be valid reasons, in particular circumstances, to ignore a particular aspect of the guidance.


| Your FIXM use case | Chapters relevant to you |
|:-|:---|
| I want to use FIXM to implement ICAO FF-ICE Service(s) without local/regional arrangements | [FIXM COMPONENTS](general-guidance/fixm-components-introduction), [GENERAL GUIDANCE](general-guidance/introduction), [FIXM DEVELOPMENT TOOL COMPATIBILITY](fixm-development-tool-compatibility/introduction), [USING FIXM IN SUPPORT OF FF-ICE](fixm-in-support-of-ffice/ffice-application-for-fixm) |
| I want to use FIXM to implement ICAO FF-ICE Service(s) with local/regional arrangements | [FIXM COMPONENTS](general-guidance/fixm-components-introduction), [GENERAL GUIDANCE](general-guidance/introduction), [FIXM DEVELOPMENT TOOL COMPATIBILITY](fixm-development-tool-compatibility/introduction), [USING FIXM IN SUPPORT OF FF-ICE](fixm-in-support-of-ffice/ffice-application-for-fixm), [HOW TO CREATE A FIXM APPLICATION](how-to-create-application/introduction), [HOW TO CREATE A FIXM EXTENSION](how-to-create-fixm-extension/introduction), [HOW TO GENERATE XML SCHEMAS ...](how-to-generate-xml-schemas/introduction)|
| I want to use FIXM to exchange flight data based on my own organisation's needs | [FIXM COMPONENTS](general-guidance/fixm-components-introduction), [GENERAL GUIDANCE](general-guidance/introduction), [FIXM DEVELOPMENT TOOL COMPATIBILITY](fixm-development-tool-compatibility/introduction), [USING FIXM FOR OTHER USE CASES](fixm-for-other-use-cases/using-fixm-core-without-an-application), [HOW TO CREATE A FIXM APPLICATION](how-to-create-application/introduction), [HOW TO CREATE A FIXM EXTENSION](how-to-create-fixm-extension/introduction), [HOW TO GENERATE XML SCHEMAS ...](how-to-generate-xml-schemas/introduction) |

## Contribute

This sites aims to build a "community knowledge" about the implementation of FIXM. You can contribute to its evolution by submitting content and by supporting the technical exchanges of the FIXM Community using the FIXM Work Area.

- [SUBMIT CONTENT][SUBMIT CONTENT]
- [ACCESS THE FIXM WORK AREA][FIXM Work Area]

### How to get Access to the FIXM Work Area

First-time users should follow these [instructions](https://www.fixm.aero/content/accessing-the-fixm-work-area) to register for a free account.


## How to use this Web Site

- Use the side bar opposite to access the various sections of the FIXM User Manual;
- Use the search engine to look for a specific entry;
- Use the buttons *< Previous* and *Next >* at the bottom of each page to navigate across the different sections of the manual.

## References

### FIXM References

[F-01]: [FIXM Web Site](https://fixm.aero/)

[F-02]: [FIXM Strategy](strategic-docs/strategy.md)

[F-03]: [FIXM Change Management Charter](strategic-docs/charter.md)

[F-04]: [FIXM Work Area](https://eurocontrol.sharepoint.com/sites/coll-FIXM/)

### ICAO References

[I-01]: [ICAO Doc 9854 - Global Air Traffic Management Operational Concept (First Edition - 2005)](https://www.icao.int/Meetings/anconf12/Document%20Archive/9854_cons_en[1].pdf)

[I-02]: [ICAO Doc 9882 - Manual on Air Traffic Management System Requirements (First Edition – 2007)](https://www.icao.int/airnavigation/IMP/Documents/Doc%209882%20-%20Manual%20on%20ATM%20Requirements.pdf)

[I-03]: [Global Air Navigation Plan](https://www4.icao.int/ganpportal/)

[I-04]: [ICAO Doc 4444, 16th edition - PANS-ATM: Procedures for Air Navigation Services: Air Traffic Management](https://portal.icao.int/icao-net/ICAO%20Documents/4444_cons_en.pdf)

[I-05]: [ICAO Doc 9965, 1st edition - Manual on Flight and Flow Information for a Collaborative Environment](http://www.icao.int/Meetings/anconf12/Documents/9965_cons_en.pdf)

[I-06]: DRAFT ICAO Doc 9965, 2nd edition, Volume II "FF-ICE/R1 Implementation Guidance Manual" v0.99

[I-07]: [ICAO Doc 7910 - Location Indicators](https://www.icao.int/safety/OPS/OPS-Tools/Pages/location-indicator.aspx)

[I-08]: [ICAO Doc 8643 - Aircraft Type Designators](https://www.icao.int/publications/DOC8643/Pages/default.aspx)

[I-09]: [PAN AIDC ICD: PAN Regional (NAT and APAC) Interface Control Document for ATC Interfacility Data Communications (PAN AIDC ICD), version 1.0](https://www.icao.int/APAC/Documents/edocs/PAN_ICD_AIDC_v1%200.pdf)

[I-10]: ICAO Doc 10039, Advanced Edition 2015 - Manual on System Wide Information Management (SWIM) Concept

[I-11]: ATMRPP-WG/24-WP/564: Flight Plan Filing Provisions for FF-ICE

[I-12]: [ICAO Doc 9883, 1st edition - Manual on Global Performance of the Air Navigation System](https://portal.icao.int/icao-net/ICAO%20Documents/9883_cons_en.pdf)

[I-13]: [ICAO Doc 9971, 3st edition - Manual on Collaborative Air Traffic Flow Management](https://portal.icao.int/icao-net/ICAO%20Documents/9971_cons_en.pdf)

[I-14]: ASBU Working Document, Edition 2, Version 3

### Other References

[O-01]: [Donlon AIP data Set](https://github.com/aixm/donlon): a fictitious set of digital AIS data sets complying with the ICAO Annex 15, 16th edition and the new PANS-AIM provisions, in AIXM 5.1.1 format.

[O-02]: [W3C XML Linking Language (xlink) v1.1](https://www.w3.org/TR/xlink11/)

[O-03]: [OGC 12-028r1](https://portal.opengeospatial.org/files/?artifact_id=62061): Use of Geography Markup Language (GML) for Aviation Data

[O-04]: Introduction to Aeronautical Information Exchange Model (AIXM) / Weather Information Exchange Model (WXXM) / FIXM Extensions, ICAO ATMRPP WP520

[O-05]: [ATM Information Reference Model](https://airm.aero/)

[O-06]: [EUROCONTROL Specification on SWIM Information Definition](https://www.eurocontrol.int/publication/eurocontrol-specification-swim-information-definition)

[O-07]: [IETF RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122)

[O-08]: [ISO/IEC 9834-8:2014](https://www.iso.org/obp/ui#iso:std:iso-iec:9834:-8:ed-3:v1:en)



## Acronyms

| **Acronym** |                                                                          |
|-------------|--------------------------------------------------------------------------|
| ACID              | Aircraft Identification |
| AFTN              | Aeronautical Fixed Telecommunication Network |
| AIDC              | ATS Interfacility Data Communications |
| AIP               | Aeronautical Information Publication |
| AIRM              | ATM Information Reference Model |
| AIS               | Aeronautical Information Services |
| AIXM              | Aeronautical Information Exchange Model |
| AMDB              | Aerodrome Mapping Database |
| AMXM              | Aerodrome Mapping Exchange Model |
| ARINC             | Aeronautical Radio, Incorporated |
| ATC               | Air Traffic Control |
| ATM               | Air Traffic Management |
| ATMRPP            | ATM Requirements and Performance Panel |
| ATS               | Air Traffic Services |
| CCB               | Change Control Board |
| DME               | Distance measuring equipment |
| EA                | Enterprise Architect |
| EAD               | European AIS Database |
| EET               | Estimated Elapsed Time |
| EOBT              | Estimated Off-Block Time |
| FAA               | Federal Aviation Administration |
| FF-ICE            | Flight and Flow Information for a Collaborative Environment |
| FF-ICE/R1         | FF-ICE Release 1 |
| FIR               | Flight Information Region |
| FIXM              | Flight Information Exchange Model |
| FPL               | Filed Flight Plan |
| GML               | Geography Markup Language |
| GUFI              | Globally unique flight identifier |
| IAS               | Indicated Airspeed |
| IATA              | International Air Transport Association |
| ICAO              | International Civil Aviation Organisation |
| IDE               | Integrated development environment |
| IFPS              | Integrated initial flight plan processing system |
| IFR               | Instrument flight rules |
| ISO               | International Organization for Standardization |
| JMS               | Java Message Service |
| MSL               | Mean sea level |
| NAS (US)          | (US) National Airspace System |
| Navaid            | Navigational aid |
| NDB               | Non-directional radio beacon |
| NM (EUROCONTROL)  | (EUROCONTROL) Network Manager |
| OGC               | Open Geospatial Consortium |
| PANSATM           | Procedures for Air Navigation Services - Air Traffic Management |
| PBN               | Performance-based navigation |
| REST              | Representational state transfer |
| SID               | Standard instrument departure |
| SITA              | Société Internationale de Télécommunications Aéronautiques |
| SOAP              | Simple Object Access Protocol |
| SSR               | Secondary surveillance radar |
| STAR              | Standard instrument arrival |
| SWIM              | System Wide Information Management |
| UML               | Unified Modeling Language |
| UPR               | User Preferred Route |
| URL               | Uniform Resource Locator |
| UTC               | Coordinated Universal Time |
| UUID              | Universally unique identifier |
| VFR               | Visual flight rules |
| VOR               | VHF omnidirectional radio range |
| W3C               | World Wide Web Consortium |
| WGS-84            | World Geodetic System - 1984 |
| WSDL              | Web Services Description Language |
| XML               | Extensible Markup Language |
| XSD               | XML Schema Definition |
| XSLT              | Extensible Stylesheet Language Transformations |

[FIXM Core 4.3.0]: https://fixm.aero/release.html?rel=FIXM-4.3.0&ret=core
[FF-ICE Application 1.1.0]: https://fixm.aero/release.html?rel=FFICE-Msg-1.1.0&ret=app
[Basic Application 1.1.0]: https://fixm.aero/release.html?rel=Basic-Msg-1.1.0&ret=app
[FIXM.aero]: https://www.fixm.aero
[FIXM Strategy v1.1]: https://fixm.aero/documents/FIXM%20Strategy.pdf

[FIXM Work Area]: https://eurocontrol.sharepoint.com/sites/coll-FIXM

[User Manual for FIXM 4.2.0 and related Applications]: https://fixm-ccb.github.io/FIXM-Core-4.2.0/#/
[Implementation Guidance for FIXM 4.1.0]: https://www.fixm.aero/documents/FIXM%20Implementation%20Guidance_FIXM%20v4.1.0.zip

[SUBMIT CONTENT]: https://fixm.aero/contact.pl?category=Technical&version=Other&versionOther=FIXM%20User%20Manual&details=Describe%20proposed%20content%20here
