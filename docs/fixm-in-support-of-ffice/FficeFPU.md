# Guidance for encoding the `FficeFPU` 

> ⚠️⚠️ !! WORK IN PROGRESS !! ⚠️⚠️

## General

A `Flight Plan Update Message` (`FficeFPU`) may be used to update all items that may be included in a `FficeFFP` or `FficePFP` except:
- The `gufi` assigned to the flight
- The `aircraftIdentification`

In order to assist in message association processes, an update to any of the departure, destination or EOBT information is achieved 
by indicating the new values that need to be applied in addition to providing the existing values (prior to the update), which are 
mandatory.

In addition to these mandatory items, an `FficeFPU` is only required to contain those items that have changed; i.e. it is not necessary 
to resend complete flight data. 

An `FficeFPU` may be also used for the removal of a previously provided flight data item(s), provided the item is not mandatory.

## Content

### Mandatory flight data items

| FF-ICE data item | FIXM data item in `FficeFPU` | Encoding rules | 
|:-|:-|:-|
| **GUFI**<br>*unchanging* | [`gufi`](general-guidance/fx_FlightData?id=gufi)[1] | MUST be the same GUFI as the FficePFP or FficeFFP to which the FficeFPU refers |
| **Aircraft Identification**<br>*unchanging* | [`aircraftIdentification`](general-guidance/fx_FlightData?id=aircraftIdentification)[1] |  MUST be the same aircraftIdentification as the FficePFP or FficeFFP to which the FficeFPU refers |
| **Departure Aerodrome**<br>*existing value* | *(if there is a change)* <br> `departureAerodromePrevious`[0..1] <br><br> *(if there is no change)* <br> `departureAerodrome`[1] | If there is a change, `departureAerodromePrevious` MUST contain the existing value, and `departureAerodrome` MUST contain the new value. <br><br> If there is no change, `departureAerodromePrevious` MUST be absent, and `departureAerodrome` MUST contain the existing value. |
| **Destination Aerodrome**<br>*existing value* | *(if there is a change)* <br> `destinationAerodromePrevious`[0..1] <br><br> *(if there is no change)* <br> `destinationAerodrome`[1] | If there is a change, `destinationAerodromePrevious` MUST contain the existing value, and `destinationAerodrome` MUST contain the new value. <br><br> If there is no change, `destinationAerodromePrevious` MUST be absent, and `destinationAerodrome` MUST contain the existing value. |
| **Estimated Off-Block Time**<br>*existing value* | *(if there is a change)* <br> `estimatedOffBlockTimePrevious`[0..1] <br><br> *(if there is no change)* <br> `estimatedOffBlockTime`[1] | If there is a change, `estimatedOffBlockTimePrevious` MUST contain the existing value, and `estimatedOffBlockTime` MUST contain the new value. <br><br> If there is no change, `estimatedOffBlockTimePrevious` MUST be absent, and `estimatedOffBlockTime` MUST contain the existing value. |
| **Operator Flight Plan Version**<br>*incremented value* | `operatorFlightPlanVersion`[1] | MUST be incremented each time a FficeFPU is submitted. |


### Flight data items to be changed

An `FficeFPU` is only required to contain those items that have changed, in addition to the mandatory items specified for the `FficeFPU`, 
i.e. it is not necessary to resend complete flight data. Data items that were included in the previous version of the flight plan and have not been 
included in the `FficeFPU` will remain unchanged. 

Flight data items to be changed should therefore be included as necessary into the `FficeFPU`. 

Individual elements within a repeating sequence of elements such as those found within a route/trajectory group 
or a climb/descent performance profile cannot be modified. The entire group must be updated.

### Removal of a previously provided item

Except for `gufi`, `aircraftIdentification`, `departureAerodrome`, `destinationAerodrome` and `estimatedOffBlockTime`, which cannot be removed, 
a nil element included in an `FficeFPU` indicates that this flight plan data item is to be deleted.

Individual elements within a repeating sequence of elements such as those found within a route/trajectory group 
or a climb/descent performance profile cannot be deleted. The entire group must be deleted as required.

## Examples

### EOBT update

This is a fictional `FficeFPU` message that updates the EOBT for flight `UFO1234` from `LFBO` to `EBBR`. 

```xml
<ffice:FficeMessage xmlns:ffice="http://www.fixm.aero/app/ffice/1.1" [...] xsi:type="ffice:FficeFPU_FficeMessageType">
  <ffice:flight>
    <fx:arrival>
      <!-- ENCODING RULE - If there is no change, destinationAerodromePrevious MUST be absent,
           and destinationAerodrome MUST contain the existing value. -->
      <fx:destinationAerodrome>
        <fb:locationIndicator>EBBR</fb:locationIndicator>
      </fx:destinationAerodrome>
    </fx:arrival>
    <fx:departure>
      <!-- ENCODING RULE - If there is no change, departureAerodromePrevious MUST be absent, 
           and departureAerodrome MUST contain the existing value. -->
      <fx:departureAerodrome>
        <fb:locationIndicator>LFBO</fb:locationIndicator>
      </fx:departureAerodrome>
      <!-- ENCODING RULE - if there is a change, estimatedOffBlockTimePrevious MUST contain 
           the existing value, and estimatedOffBlockTime MUST contain the new value. -->
      <fx:estimatedOffBlockTime>2026-05-22T15:10:00Z</fx:estimatedOffBlockTime>
      <fx:estimatedOffBlockTimePrevious>2026-05-22T15:00:00Z</fx:estimatedOffBlockTimePrevious>
    </fx:departure>
    <fx:flightIdentification>
      <!-- ENCODING RULE - MUST be the same aircraftIdentification as the FficePFP or FficeFFP
           to which the FficeFPU refers -->
      <fx:aircraftIdentification>UFO1234</fx:aircraftIdentification>
      <!-- ENCODING RULE - MUST be the same GUFI as the FficePFP or FficeFFP to which the FficeFPU refers -->
      <fx:gufi [...]>f244dbb2-2225-49a3-b542-06c3ccc2384a</fx:gufi>
    </fx:flightIdentification>
  </ffice:flight>
  <!-- ENCODING RULE - MUST be incremented each time a FficeFPU is submitted -->	
  <ffice:operatorFlightPlanVersion>2</ffice:operatorFlightPlanVersion>
  <!-- [...] -->
  <ffice:type>FLIGHT_PLAN_UPDATE</ffice:type>
</ffice:FficeMessage>
```

## Special cases 

### Enabling change of aircraft identification locally

Many ATS systems globally are unable to support a modification to the aircraft identification as it is used as a unique key in accessing the flight data. Use of FF-ICE will 
not automatically overcome these processing limitations. This is why the `aircraftIdentification` is considered unchanging for a given flight in FF-ICE.

However, nothing precludes local systems, capable of accepting aircraft identification modifications, to continue to do so for flights that are conducted entirely within their areas of responsibility.

This is achieved already in some countries / regions as outlined below:
- `TODO` - quote Skyguide example
- ...



