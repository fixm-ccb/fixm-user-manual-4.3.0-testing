# Using FIXM Core with an Extension

## Creating a new Extension

If a FIXM user requires additional fields beyond what is available in
[FIXM Core](general-guidance/fixm-core) or a [FIXM Application](general-guidance/applications), [Extensions](general-guidance/extensions) can be used to meet this
need. Similar to Applications, Extensions should define their own
namespaces to distinguish them from FIXM Core, FIXM Applications,
and each other. Extensions should also provide a root schema file (that
will import FIXM Core and/or the FIXM Application the Extension works
with) for use with XML validators and utilities. Unlike Applications,
Extensions should not define their own root elements but, rather, make
use of the root elements defined in whatever schemas they extend.

As noted in [Extensions](general-guidance/extensions), there are a number of general guidelines for
constructing FIXM Extensions (e.g., make use extension hooks, don’t
duplicate Core fields, etc.). Apart from that, the content and
organization of an Extension is largely dependent on the data set the
user wishes to represent. [How to create a FIXM extension](how-to-create-fixm-extension/initial-download-and-setup) provides a detailed,
step-by-step example of how to create a simple Extension that should
help guide any users interested in creating their own.

### Example: Position Reports

Our fictitious user XAS next decides to branch out beyond just providing
departure and arrival alerts. A number of consumers have been asking if
periodic position reports are available for the flights XAS monitors.
While XAS has this data, there are currently no fields present in FIXM
Core for representing an active flight’s current position. To address
this, XAS decides so create their own FIXM Extension.

This new Extension defines its own namespace
`http://www.fixm.aero/ext/example/1.0` as well as a number of fields
XAS wishes to add to what is currently available in FIXM
(`sequenceNumber` and `position`). Based on lessons learned during their
work with departure and arrival alerts, XAS choses to apply the
Extension to Basic Message as well as Core to take advantage of Basic
Message’s existing `MessageCollection` element. This allows XAS the option
of using Message as a root element if they wish to send single position
reports or `MessageCollection` if they wish to send many at once. Details
on how to build this Extension along with more specifics as to its
content are supplied below in [How to create a FIXM extension](how-to-create-fixm-extension/initial-download-and-setup).

With the Extension built, XAS instructs consumers to make use of the
`Example.xsd` file described in [How to create a FIXM extension](how-to-create-fixm-extension/initial-download-and-setup) when validating position
reports. Below is an example of how the XML payload of one of these
position reports may appear.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<msg:Message xmlns:xmp="http://www.fixm.aero/ext/example/1.0" xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:fb="http://www.fixm.aero/base/4.2" xmlns:msg="http://www.fixm.aero/app/msg/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <msg:extension xsi:type="xmp:ExampleMessageType">
    <xmp:sequenceNumber>1</xmp:sequenceNumber>
  </msg:extension>
  <msg:flight>
    <fx:enRoute>
      <fx:extension xsi:type="xmp:ExampleEnRouteType">
        <xmp:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>36.019970 -75.668760</fb:pos>
        </xmp:position>
      </fx:extension>
    </fx:enRoute>
    <fx:flightIdentification>
      <fx:aircraftIdentification>WRF01</fx:aircraftIdentification>
    </fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid">6964698b-2074-4fef-868f-ebe65f47a105</fx:gufi>
  </msg:flight>
  <msg:timestamp>1903-12-17T03:35:00Z</msg:timestamp>
  <msg:type>POSITION_REPORT</msg:type>
</msg:Message>
```

## Using Multiple Extensions

There are times when a FIXM user may wish to create an XML document that
makes use of more than one Extension at the same time. Assuming the
Extensions are built following FIXM best practices, this should present
no difficulties.

FIXM encourages users to attach their Extensions to Core or an
Application via the built-in extension hooks located throughout the
models. The primary reason for this is to allow FIXM to support multiple
Extensions simultaneously. Each Extension hook has a high multiplicity
(standardly 0..2000) that allows many different Extensions to target the
same areas of FIXM without interfering with each other.

The simplest way to allow multiple Extensions to work together in a
single XML document is to create a new schema file that imports all the
needed components (Core, Application, and Extensions) into one
place<sup><a href="#fixm-for-other-use-cases/using-fixm-core-with-an-extension?id=notes">[note 1]</a></sup>. This new schema can be used as the root schema file for XML
validators and utilities. Each Extension can then be applied to its own
extension hook, and the multiple Extensions can used together as needed.

### Example: Multiple Extensions

As XAS’s FIXM operations expand, they begin exchanging data with other
systems that have created their own Extensions. One such system has an
Extension which supplies enhanced handoff data used when flights
transition from one controller to another.

XAS wishes to create a new position report service that contains this
additional handoff data. They decide to pursue this by creating a new
schema that allows the two Extensions to be used at the same time by
importing all the needed components into one place and then instructing
consumers to use this as the root schema file when validating these new
reports. Below is an example of what that schema file may look like.

```xml
<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:fb="http://www.fixm.aero/base/4.2" xmlns:msg="http://www.fixm.aero/app/msg/1.0" xmlns:xmp="http://www.fixm.aero/ext/example/1.0" xmlns:hdf="http://www.fixm.aero/ext/handoff/1.0" elementFormDefault="qualified" version="1.0.0">
  <xs:import namespace="http://www.fixm.aero/base/4.2" schemaLocation="../../core/base/Base.xsd"/>
  <xs:import namespace="http://www.fixm.aero/flight/4.2" schemaLocation="../../core/flight/Flight.xsd"/>
  <xs:import namespace="http://www.fixm.aero/app/msg/1.0" schemaLocation="../../applications/basicmessage/BasicMessage.xsd"/>
  <xs:import namespace="http://www.fixm.aero/ext/example/1.0" schemaLocation="../example/Example.xsd"/>
  <xs:import namespace="http://www.fixm.aero/ext/handoff/1.0" schemaLocation="../handoff/Handoff.xsd"/>
</xs:schema>
```

## Using an Extension together with an Application

In principle, as can be seen in detail in [How to create a FIXM extension](how-to-create-fixm-extension/initial-download-and-setup), applying an
Extension to an Application is no different than applying one to FIXM
Core. It is just a
matter of importing the FIXM Application in question and making use
of its extension hooks. That said, there are some aspects of using
Extensions and templates together that have not yet been fully explored.

One area under active investigation is applying a FIXM Application directly to an Extension. To date, the only two FIXM Applications that have been developed are Basic Message and FF-ICE Message. Both of these Applications only apply themselves to Core. In theory, a FIXM Application could directly import an Extension just as easily as
it imports Core and apply templates to the Extension content in the same
way it does to Core fields. As practical examples of this are explored,
this section will be updated with more information about how to proceed
(or warnings as to why this is discouraged).

### Example: Position Report Template

Returning to our fictitious user one final time, XAS has created their
own Application for distributing departure and arrival alerts
but has a separate feed that makes use of a different set of schemas for
distributing their position reports. XAS would prefer to consolidate
their two feeds into one and use the same set of schemas for all of
their data.

XAS decides to update their position report Extension to target their
own Example Message Application rather than Basic Message and
add a new `POSITION_REPORT` enumeration to the Application’s type field
(see [How to create a FIXM Application](how-to-create-application/initial-download-and-setup) and [How to create a FIXM extension](how-to-create-fixm-extension/initial-download-and-setup) for details). This should be sufficient
to allow XAS to use one set of schemas for all of their data sets.
However, this creates an odd discrepancy between departure/arrival
alerts and position reports. The alerts are fully described in the
Application’s templates while position reports receive no such guidance.
Without applying the Application to the Extension as well as Core, there
does not seem to be a clear way forward to address this.

As noted above, the best way to approach this matter is currently under
investigation so this example is only provided to illustrate the issues
involved, not detail the recommended solution. This section will be
updated as appropriate after best practices have been established.

## Notes

[1]: Note that each Extension must target the same version of FIXM Core and/or Application Library in order to be used together.  For example, you cannot combine one Extension that uses FIXM Core 4.2.0 with another Extension that uses FIXM Core 4.1.0.  