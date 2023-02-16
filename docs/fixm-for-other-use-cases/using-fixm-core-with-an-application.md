# Using FIXM Core with a FIXM Application

## Basic Message Application

The `Basic Message Application` is intended to enhance FIXM Core
by providing basic messaging support for users, including message types
and timestamps, as well as the ability to batch multiple flight messages
together into a single aggregate message. It also provides extension
hooks for users who wish to add their own custom messaging fields. Users
who only require this basic level of message support are encouraged to
use the `Basic Message Application`.

This FIXM Application contains two root fields that can be used as an
entry point: `Message` and `MessageCollection`.

![Basic Message Application](.//media/other-using-fixm-core-with-an-application-library-01.PNG "Basic Message Application")

When using Basic Message for data representation, all XML documents must
begin with one of these two elements. Similarly, like `Fixm.xsd` for Core,
the `BasicMessage.xsd` schema file is the root schema of the Basic Message
Application and is the file that should be referenced for
validation or use with any XML utilities.

Unlike FF-ICE Message, the Basic Message Application focuses
only on providing users with generic and reusable message data
structures. It does not provide any message template since it is not
linked to any particular operational use of FIXM.

Users who wish to include additional message data structures beyond what
is provided in Basic Message (but who do not wish to create templates
for a pre-defined set of messages) are encouraged to do so via creating
an Extension to Basic Message (see [Creating a new Extension](fixm-for-other-use-cases/using-fixm-core-with-an-extension?id=creating-a-new-extension) and [Using an Extension together with an Application](fixm-for-other-use-cases/using-fixm-core-with-an-extension?id=using-an-extension-together-with-an-application)
for more on this). Users who wish to create message templates for their
systems are encouraged to do so via creating their own FIXM Application
 (see [Creating a FIXM Application](fixm-for-other-use-cases/using-fixm-core-with-an-application?id=creating-a-fixm-application) for details).

### Example: Batch Updates

Returning to our fictitious user, `XAS` has launched a successful
departure and arrival alert service using FIXM Core alone but is now
interested in expanding their capabilities. Some of XAS’s consumers
suffer from network outages and have requested an additional service
which they could use to invoke a bulk update containing all the alerts
they might have missed during such an outage.

XAS determines that Basic Message should be sufficient to meet the needs
of this new service. The `MessageCollection` element allows XAS to batch
together as many alerts as needed for the update, and the timestamp
associated with each message provides the additional benefit of letting
the consumer know exactly when the alert had originally been sent. XAS
decides to construct all updates using `MessageCollection` as the root
element to make parsing the updates more consistent and instructs
recipients of these updates to validate the XML against
`BasicMessage.xsd`. Below is a snippet of what the XML payload of such an
update may look like.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<msg:MessageCollection xmlns:msg="http://www.fixm.aero/app/msg/1.0" xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:fb="http://www.fixm.aero/base/4.2">
  <msg:message>
    <msg:flight>
      <fx:departure>
        <fx:actualTimeOfDeparture>2020-01-01T00:03:00Z</fx:actualTimeOfDeparture>
        <fx:aerodrome>
          <fb:locationIndicator>KBOS</fb:locationIndicator>
        </fx:aerodrome>
      </fx:departure>
      <fx:flightIdentification>
        <fx:aircraftIdentification>ABC1234</fx:aircraftIdentification>
      </fx:flightIdentification>
      <fx:gufi codeSpace="urn:uuid">3e7f6a63-6c3b-4f0f-844b-4b84338ed103</fx:gufi>
    </msg:flight>
    <msg:timestamp>2020-01-01T00:03:01Z</msg:timestamp>
    <msg:type>DEPARTURE</msg:type>
  </msg:message>
  .
  .
  .
  <msg:message>
    <msg:flight>
      <fx:arrival>
        <fx:actualTimeOfArrival>2020-01-01T23:58:00Z</fx:actualTimeOfArrival>
        <fx:arrivalAerodrome>
          <fb:locationIndicator>KLAX</fb:locationIndicator>
        </fx:arrivalAerodrome>
      </fx:arrival>
      <fx:flightIdentification>
        <fx:aircraftIdentification>XYZ1234</fx:aircraftIdentification>
      </fx:flightIdentification>
      <fx:gufi codeSpace="urn:uuid">3808e010-3c24-4a04-afd2-f62ba9ec43f6</fx:gufi>
    </msg:flight>
    <msg:timestamp>2020-01-01T23:58:01Z</msg:timestamp>
    <msg:type>ARRIVAL</msg:type>
  </msg:message>
  <msg:timestamp>2020-01-02T00:05:00Z</msg:timestamp>
  <msg:type>BULK_UPDATE</msg:type>
</msg:MessageCollection>

```

## Creating a FIXM Application

If the organization of Basic Message does not suit the user’s data
exchange or if the user wants to create message templates to more fully
lock down and describe their message structures and content, they should
consider creating their own custom FIXM Application.

As described in [FIXM Applications](general-guidance/applications), FIXM Applications enhance FIXM Core by adding context specific message data structures and provides
stricter validation rules via message templates. An Application should
define its own namespace to distinguish it from FIXM Core as well as
creating one or more root elements to be used as an entry point into the
Application. If the Application includes message templates, it may have more
than one root schema: one for using the Application alone with
no further restrictions and one (or more) for use with the templates.
[The FF-ICE Application](fixm-in-support-of-ffice/ffice-application-for-fixm) is a good example of this, with
users referencing FficeMessage.xsd for unrestricted use of the Application,
`FficeTemplates.xsd` for making use of all thirteen templates used to
represent the FF-ICE messages, or one of the thirteen template-specific
schemas files corresponding to each FF-ICE message.

While the content and organization of a FIXM Application depends
entirely on the needs of the data exchange it is intended to support,
the FF-ICE and Basic Message Applications should
provide a useful set of examples for how to build an Application with and
without associated templates. To supplement this, [How to create a FIXM Application](how-to-create-application/initial-download-and-setup)
provides step-by-step instructions on how to create a simple
Application.

### Example: Upgraded Alerts

At this point, our fictitious user XAS has decided to upgrade their
original alert service to be able to send departure and arrival messages
to specific recipients (rather than maintaining a single, common
endpoint for all consumers) as well as making use of templates to
clearly lockdown the expected format of the alert messages. To
accomplish this, XAS decides to create their own FIXM Application.

This custom FIXM Application defines its own namespace
`http://www.fixm.aero/app/example/1.0` and root
element (`ExampleMessage`) as well as a number of header fields needed to
represent data XAS wants to exchange with each alert (`sender`,
`recipient`, `timestamp`, and `type`).

?> The namespace of the custom FIXM Application does not have to be tied to www.fixm.aero.

XAS then goes on to create two
templates: one that locks down the content of a departure alert and
another for the arrival alert. Details on how to build this FIXM Application along with more specifics as to its content are supplied below
in [How to create a FIXM Application](how-to-create-application/initial-download-and-setup).

With the Application built, XAS instructs consumers to make use
of the `ExampleTemplates.xsd` file described in [How to create a FIXM Application](how-to-create-application/initial-download-and-setup) when validating
the new alert messages. Below is an example of how the XML payload of
one of the new arrival alert messages coming from this service may
appear.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xmg:ExampleMessage xsi:type="xmg:ExampleDA_ExampleMessageType" xmlns:xmg="http://www.fixm.aero/app/example/1.0" xmlns:fb="http://www.fixm.aero/base/4.2" xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xmg:flight>
    <fx:departure>
      <fx:actualTimeOfDeparture>1903-12-17T03:35:00Z</fx:actualTimeOfDeparture>
      <fx:aerodrome>
        <fb:name>KILL DEVIL HILL</fb:name>
        <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>36.019970 -75.668760</fb:pos>
        </fb:referencePoint>
      </fx:aerodrome>
    </fx:departure>
    <fx:flightIdentification>
      <fx:aircraftIdentification>WRF01</fx:aircraftIdentification>
    </fx:flightIdentification>
    <fx:gufi codeSpace="urn:uuid">18611e54-52b8-4fb5-a2fa-12173b1d39db</fx:gufi>
  </xmg:flight>
  <xmg:recipient>
    <fb:name>HISTORY</fb:name>
  </xmg:recipient>
  <xmg:sender>
    <fb:name>ORVILLE WRIGHT</fb:name>
  </xmg:sender>
  <xmg:timestamp>2020-01-15T17:20:33Z</xmg:timestamp>
  <xmg:type>DEPARTURE</xmg:type>
</xmg:ExampleMessage>
```
