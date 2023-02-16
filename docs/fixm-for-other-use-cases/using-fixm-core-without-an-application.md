# Using FIXM Core without an Application

In some cases, the nature of the messaging infrastructure employed for a
particular data exchange makes the use of [FIXM Applications](general-guidance/applications.md) unnecessary or irrelevant (perhaps due to the infrastructure’s robust metadata/messaging header support) or the nature of the exchange itself does not require any accompanying message data structures (perhaps due to the exchange’s simplicity). In these situations, the use of [FIXM Core](general-guidance/fixm-core.md) alone should be sufficient.

FIXM Core is the repository in which all globally applicable flight data
structures reside. The root field of the entire flight information
hierarchy is the `Flight` class (in the physical model, the `Flight`
element).

![Using FIXM Core without an Application](.//media/other-using-fixm-fixm-core-without-an-application-library-01.PNG "Using FIXM Core without an Application")

When using FIXM Core for data representation, all XML documents must
begin with this `Flight` element. Similarly, the `Fixm.xsd` schema file is
the root schema of FIXM Core. Whether validating FIXM Core XML documents
or using automated code generation utilities (such as JAXB), this is the
schema file that should be referenced.

## Example: Departure/Arrival Alerts

Our fictitious user `XAS` begins their use of FIXM wanting to publish
departure and arrival alerts for flights they monitor. XAS sets up a
publishing service with which they send out arrival and departure
messages to a single endpoint their consumers can monitor to receive the
alerts. Due to the simplicity of their service, the use of FIXM Core
alone is sufficient for their needs. XAS constructs XML messages
starting with the `Flight` element to convey their data and instructs
their consumers to validate these messages against FIXM Core’s `Fixm.xsd`
schema file. Below is an example of how the XML payload of a departure
alert coming from this service may appear.

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<fx:Flight xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:fb="http://www.fixm.aero/base/4.2">
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
</fx:Flight>
```
