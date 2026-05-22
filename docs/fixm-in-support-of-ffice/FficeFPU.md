# FficeFPU

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

| FF-ICE data item | FIXM data item | Encoding rules | 
|:-|:-|:-|
| **GUFI**<br>*invariant* | `gufi`[1] | MUST be the same GUFI as the FficePFP or FficeFFP to which the FficeFPU refers |
| **Aircraft Identification**<br>*invariant* | `aircraftIdentification`[1] |  MUST be the same aircraftIdentification as the FficePFP or FficeFFP to which the FficeFPU refers |
| **Departure Aerodrome**<br>*existing value* | `departureAerodromePrevious`[0..1] | MUST be present although the cardinality is [0..1]. MUST be the value before the change. |
| **Destination Aerodrome**<br>*existing value* | `destinationAerodromePrevious`[0..1]  | MUST be present although the cardinality is [0..1]. MUST be the value before the change.  |
| **Estimated Off-Block Time**<br>*existing value* | `estimatedOffBlockTimePrevious`[0..1] | MUST be present although the cardinality is [0..1]. MUST be the value before the change. | 
| **Operator Flight Plan Version**<br>*incremented value* | `operatorFlightPlanVersion`[1] | MUST be incremented each time a FficeFPU is submitted. |

### Flight data items to be changed

An `FficeFPU` is only required to contain those items that have changed, in addition to the mandatory items specified for an Update message, 
i.e. it is not necessary to resend complete flight data. Data items that were included in the previous version of the flight plan and have not been 
included in the Flight Plan Update will remain unchanged. 

Flight data items to be changed should therefore be included as necessary into the `FficeFPU`. 

The following table details specific encoding rules for some properties.

| FF-ICE data item | FIXM data item | Encoding rules | 
|:-|:-|:-|
| **Departure Aerodrome**<br>*new value* | `departureAerodrome`[1] | If there is a change of departure aerodrome, MUST contain the new value.<br><br>If there is no change of departure aerodrome, MUST be present (cardinality [1]) with a locationIndicator declared NULL. |
| **Destination Aerodrome**<br>*new value* | `destinationAerodrome`[1] | If there is a change of destination aerodrome, MUST contain the new value.<br><br>If there is no change of destination aerodrome, MUST be present (cardinality [1]) with a locationIndicator declared NULL. |
| **Estimated Off-Block Time**<br>*new value* | `estimatedOffBlockTime`[1] | If there is a change of EOBT, MUST contain the new value.<br><br>If there is no change of EOBT, MUST be present (cardinality [1]) and declared NULL. |



### Removal of a previously provided item

A nil element included in an FF-ICE Flight Plan Update message indicates that this flight plan data item is to be deleted. Individual elements within 
a repeating sequence of elements such as those found within a route/trajectory group or a climb/descent performance profile cannot be modified or deleted. 
The entire group must be updated as required.


## Examples

### EOBT update

This is a fictional `FficeFPU` message that updates the EOBT for flight `UFO1234` from `LFBO` to `EBBR`. 

```xml
<ffice:FficeMessage xmlns:ffice="http://www.fixm.aero/app/ffice/1.1" [...] xsi:type="ffice:FficeFPU_FficeMessageType">
  <ffice:flight>
    <fx:arrival>
      <-- ENCODING RULE - If there is no change of destination aerodrome, destinationAerodrome MUST
          be present (cardinality [1]) with a locationIndicator declared NULL. -->
      <fx:destinationAerodrome>
        <fb:locationIndicator xsi:nil="true"/>
      </fx:destinationAerodrome>
      <-- ENCODING RULE - destinationAerodromePrevious MUST be present although the cardinality is [0..1]. -->
      <fx:destinationAerodromePrevious>
        <fb:locationIndicator>EBBR</fb:locationIndicator>
      </fx:destinationAerodromePrevious>
    </fx:arrival>
  	<fx:departure>
      <-- ENCODING RULE - If there is no change of departure aerodrome, departureAerodrome MUST
          be present (cardinality [1]) with a locationIndicator declared NULL. -->
  		<fx:departureAerodrome>
  			<fb:locationIndicator xsi:nil="true"/>
  		</fx:departureAerodrome>
      <-- ENCODING RULE - departureAerodromePrevious MUST be present although the cardinality is [0..1]. -->
      <fx:departureAerodromePrevious>
        <fb:locationIndicator>LFBO</fb:locationIndicator>
      </fx:departureAerodromePrevious>
      <-- ENCODING RULE - If there is a change of EOBT, estimatedOffBlockTime MUST contain the new value. -->
  		<fx:estimatedOffBlockTime>2026-05-22T15:10:00Z</fx:estimatedOffBlockTime>			
      <-- ENCODING RULE - estimatedOffBlockTimePrevious MUST be present although the cardinality is [0..1].
          MUST be the value before the change. -->
      <fx:estimatedOffBlockTimePrevious>2026-05-22T15:00:00Z</fx:estimatedOffBlockTimePrevious>
  	</fx:departure>
  	<fx:flightIdentification>
       <-- ENCODING RULE - MUST be the same aircraftIdentification as the FficePFP or FficeFFP
           to which the FficeFPU refers -->
	  	<fx:aircraftIdentification>UFO1234</fx:aircraftIdentification>
      <-- ENCODING RULE - MUST be the same GUFI as the FficePFP or FficeFFP to which the FficeFPU refers -->
	  	<fx:gufi [...]>f244dbb2-2225-49a3-b542-06c3ccc2384a</fx:gufi>
  	</fx:flightIdentification>
  </ffice:flight>
  <-- ENCODING RULE - MUST be incremented each time a FficeFPU is submitted -->
  <ffice:operatorFlightPlanVersion>2</ffice:operatorFlightPlanVersion>
  <--[...]-->
  <ffice:type>FLIGHT_PLAN_UPDATE</ffice:type>
</ffice:FficeMessage>
```

### Route/Trajectory update

`TODO`

### Flight formation detils update

`TODO`


## Special cases 

### Enabling change of aircraft identification locally

Many ATS systems globally are unable to support a modification to the aircraft identification as it is used as a unique key in accessing the flight data. Use of FF-ICE will 
not automatically overcome these processing limitations. This is why the `aircraftIdentifocation` is considered invariant in FF-ICE.

However, nothing precludes a local system(s), capable of accepting aircraft identification modifications, to continue to do so for flights that are conducted entirely within their area(s) of responsibility.

This is achieved already in some countries / regions 
- `TODO` - quote Skyguide example
- ...


## Known bugs and limitations

FIXM Core 4.3.0 introduces a couple of properties suffixed “Previous” that can be used for exchanging values initially submitted 
in a filed or preliminary flight plan in addition to an updated value. The FficeFPU message template from the FF-ICE Message Application 1.1.0 
further constrains the cardinality of these properties, and declares the properties suffixed "Previous" optional and their counterparts without suffix mandatory. 

This designs implies that it becomes impossible to omit a mandatory property without suffix in the FficeFPU even when there is no change. The encoding rules described above
aims to address these limitations.






