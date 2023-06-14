# Introduction

Typically, the development of data exchange standards are based on
Logical and Physical Model best practices. Logical Models use UML best
practices to show the relationships between key concepts whereas the
Physical Model use schema best practices to develop the data exchange
standard. The development of different standards deviate from best
practices to accommodate unique use cases required by stakeholders.
Although it is not the responsibility of exchange models to be
“compatible” with various development tools, compatibility is indeed
critical for stakeholder and industry adoption making an analysis of
Development Tool Compatibility essential.

To this end, a compatibility analysis was run using two approaches:
- Approach #1 utilized FIXM Core 4.3.0 and FF-ICE Message 1.1.0 Schema
- Approach #2 utilized FIXM Core 4.3.0 and FF-ICE Message 1.1.0 Test WSDL

For each approach testing involved
- a variety of technologies (e.g., SOAP, REST, JMS)
- several common development tools.  

The result of this compatibility analysis was the creation of the FIXM
support matrix. The section [Platform Support Matrix](fixm-development-tool-compatibility/compatibility-analysis-results.md)
supplies a list of the supported tools and technologies. This list of
currently supported software versions is also located on the FIXM work
area.
