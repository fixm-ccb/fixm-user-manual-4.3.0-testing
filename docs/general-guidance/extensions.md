# Extensions

## What is it?

An extension designates a supplement to FIXM that supports additional
(commonly local or regional) requirements from a particular organisation
or community of interest. An extension may supplement FIXM Core by
defining additional flight data structures exchanged locally or
regionally, and/or may supplement an existing FIXM Application by
defining additional messaging data structure exchanged locally or
regionally.

Examples:

- The US extension to FIXM defines additional flight identification data structures based on the types of domestic systems that support ATM in the USA (e.g. TFMS...). This is an example of an extension enriching FIXM Core with supplementary flight data being exchanged for domestic purposes.

- The EUROCONTROL Network Manager is able to exchange structured IFPS errors to serve as FF-ICE Filing Status explanation. This error information is specific to the EUROCONTROL Network Manager and exemplifies what could be modelled as part of a EUROCONTROL extension to the FF-ICE Message data structures provided by the FF-ICE Application.

## What is a valid use of an extension?

A number of rules are established in order to ensure that extensions are
not developed as a replacement of FIXM Core or a subset thereof.

The requirements on FIXM extensions are provided below. They are equally
applicable to verified and non-verified extensions, but are enforceable
only for verified extension. Non-verified extensions satisfying the
requirements below will be recognised as a valid usage of the FIXM
extension mechanism.

-----

### Requirement on extension design

| | | |
|-|-|-|
| **Requirement**       | To qualify for a valid FIXM extension, an extension shall be designed in accordance with the modelling principles described in [this chapter](how-to-create-fixm-extension/initial-download-and-setup.md)|
| **Rationale**         | The successful development of an extension, and its successful integration with the FIXM Core packages, requires rules on extension design to be followed consistently by all implementers.|
| **How to check this** | Checking that an extension satisfies this requirement cannot be automated and requires manual analysis of the extension content by the FIXM community. As a general principle, extensions to FIXM Core that are proposed for online publication on the FIXM web site should be checked against this requirement. |


-----

### Requirement on extension content

| | | |
|-|-|-|
| **Requirement**       | To qualify as a valid FIXM extension, an extension shall never contain a model element that would redefine, or supersede, a model element that is already defined in FIXM Core.|
| **Rationale**         | FIXM Core is an information exchange model capturing flight information that is globally harmonised. Redefining or superseding the FIXM Core content in an extension would amount to diverging from this globally harmonised content and would go against the fundamental harmonisation objectives of FF-ICE and FIXM. |
| **How to check this** | Checking that an extension satisfies this requirement cannot be automated and requires manual analysis of the extension content by the FIXM community. As a general principle, extensions to FIXM Core that are proposed for online publication on the FIXM web site should be checked against this requirement.       |

#### Example of FIXM extension satisfying the requirement on extension
content

![Image](.//media/fixm-US-extension.png "Example of FIXM extension satisfying the requirement on extension content")

This example is an extract from the draft FIXM US Extension 4.3.0 - Copyright (c) US Federal Aviation Administration (FAA). This extract features a class named `NasEnRoute` (shown in cyan in the diagram) that extends FIXM Core's `EnRouteExtension` class and defines content that supplements FIXM Core's `EnRoute` class. Note that the content of the `NasEnRoute` class does not replace or supersede any of the existing properties of FIXM Core's `EnRoute` class. The example, therefore, qualifies as valid usage of the extension mechanism.  

#### Example of FIXM extension NOT satisfying the requirement on extension content

![Image](.//media/general-guidance-extensions-02.png "Example of FIXM extension NOT satisfying the requirement on extension content")

This example features a fictitious extension to FIXM Core which models
one class entitled “WrongFlight” (in blue on the diagram). This class
defines a property named “gufi” that is typed using CharacterString. The
extension essentially redefines the “gufi” property from the FIXM Core
model element “Flight” and loosens its format, allowing any type of
character string to be populated. This is an example of a FIXM extension
redefining content from FIXM Core. It does NOT qualify as valid usage of
the FIXM extension mechanism.

## How to build an extension?

The FIXM extension mechanism distributes class-specific extension hooks
throughout the model that implementers can leverage to define their
specific data structures.

![Image](.//media/general-guidance-extensions-03.png)

The key benefits of the approach are the following:

1. ability to allow Extension validation

2. multiple co-existing Extensions

3. co-location of Extension data with the Core data it extends

4. ability to easily remove extensions and pare down the model

This permissive approach enables FIXM users to enrich the core FIXM
datasets with as many information elements as necessary, as required by
the applicable implementation context.

[This chapter](how-to-create-fixm-extension/initial-download-and-setup.md) provides a rulebook and detailed guidance for creating
extensions.

## Ignoring extension data

Consumers of FIXM information may not need, and/or may not be able to
process and interpret extension data supplementing a core FIXM dataset.

Using XSLTs is one approach for removing unwanted Extension data (known
or unknown) from a FIXM XML dataset, as appropriate. An example of an
XSLT that removes all Extension content is provided below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="@*|node()">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:template>
    <xsl:template match="*:extension"/>
</xsl:stylesheet>
```
