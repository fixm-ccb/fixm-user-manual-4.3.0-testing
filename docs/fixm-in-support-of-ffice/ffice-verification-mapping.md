# FF-ICE Verification and Mapping

The FF-ICE application is designed to support operational implementation of the FF-ICE concept. As a result, it is essential that all of the requirements in the 
FF-ICE Implementation Guidance are satisfied. To ensure that this is the case, the FIXM CCB has developed a verification methodology that maps the 
FF-ICE requirements as defined in Appendices B and C of the FF-ICE Implementation Guidance to the corresponding fields in the FIXM model. This mapping is then 
compared against the FF-ICE message templates to ensure that all required fields are in fact included in the templates. This methodology will be applied during 
the development phase of all future versions of the FF-ICE message templates.

The key artifact from this verification approach is a spreadsheet that:

- Documents the FF-ICE requirements from Appendix C of the Implementation Guidance and then maps those requirements to the corresponding Xpaths in the FIXM model 
that **SHOULD BE** used to represent each requirement.
- Documents all the Xpaths that **ARE** in each of the FF-ICE message templates.
- Compares what **IS** in each FF-ICE message template to what **SHOULD BE** in each FF-ICE message to identify any missing or unnecessary fields.

The spreadsheet from the most recent verification effort can be found [here](.//assets/downloads/FficeVerificationAndMapping.xlsx).

This verification spreadsheet was generated after the release of v1.1.0 of the FF-ICE templates. Careful examination of the document shows it would have 
successfully identified the fields [erroneously left out][MaintenanceRelease] of the templates as well as a number of additional fields not called for in d0.99 of the Implementation
Guidance (that were added as [forward-looking changes][ForwardLooking] in coordination with the ATMRPP).

?> Though created as a verification document, users may find the mappings between FF-ICE requirements and FIXM Xpaths provided in the spreadsheet useful as a general reference document, showing the corresponding FIXM fields for each FF-ICE data item in Appendix C.

[MaintenanceRelease]: fixm-in-support-of-ffice/message-templates?id=maintenance-release
[ForwardLooking]: fixm-in-support-of-ffice/message-templates?id=forward-looking
