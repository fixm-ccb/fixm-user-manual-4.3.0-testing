# Encoding guidance for fx:EnRoute

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA7/EA332.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_EnRouteType.html#)

---

## `alternateAerodrome`

An en-route `alternateAerodrome` is an alternate aerodrome at which an aircraft would be able to land in the event that a diversion
becomes necessary while en route. Up to 20 en-route `alternateAerodrome` entries may be specified.

---

## `currentModeACode`

The property `currentModeACode` is used to exchange the SSR code assigned to the aircraft by ATS and
transmitted in Mode A.

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:enRoute>
  <fx:currentModeACode>5100</fx:currentModeACode>
  <!-- [...] -->
```
