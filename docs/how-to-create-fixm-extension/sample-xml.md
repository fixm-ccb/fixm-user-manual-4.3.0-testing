!> Note to implementers: This "How To" section was originally developed using FIXM Core v4.2.0 and uses that version as the foundation for the modeling guidance provided. The details presented here should be equally applicable for FIXM Core v4.3.0 as no fundamental shifts in modeling best practices exist between these two versions.

# Sample XML

Below is a sample XML document that validates against the Example
Extension described in this section:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<msg:Message xmlns:xmp="http://www.fixm.aero/ext/example/1.0" xmlns:fx="http://www.fixm.aero/flight/4.2" xmlns:fb="http://www.fixm.aero/base/4.2" xmlns:msg="http://www.fixm.aero/app/msg/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <msg:extension xsi:type="xmp:ExampleMessageType">
    <xmp:sequenceNumber>1903</xmp:sequenceNumber>
  </msg:extension>
  <msg:flight>
    <fx:enRoute>
      <fx:extension xsi:type="xmp:ExampleEnRouteType">
        <xmp:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>36.019970 -75.668760</fb:pos>
        </xmp:position>
      </fx:extension>
    </fx:enRoute>
  </msg:flight>
</msg:Message>
```

