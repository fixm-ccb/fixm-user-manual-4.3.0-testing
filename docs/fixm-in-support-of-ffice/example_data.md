# Route/Trajectory Example Data

This page explains how the route/trajectory example from the FF-ICE/R1 Implementation Guidance Manual (Appendix E-3.7) <sup>[[I-06]](#references)</sup> is concretely encoded in FIXM. 
The FPL Item 15c reads `DCT HGR V268 EMI DCT`

![Image](.//media/example_route.png)

## Content of `<fx:departure>`

Departure Aerodrome `KHGR`, EOBT `07:00`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:departure>
   <fx:departureAerodrome>
      <fb:locationIndicator>KHGR</fb:locationIndicator>
   </fx:departureAerodrome>
   <fx:estimatedOffBlockTime>2023-05-22T07:00:00Z</fx:estimatedOffBlockTime>
</fx:departure>
```
Encoding Rules:
* Rules for [`<fx:aerodrome>`](https://docs.fixm.aero/#/general-guidance/references-to-published-aeronautical-information?id=references-to-aerodromes)
* Rules for [`<fx:estimatedOffBlockTime>`](https://docs.fixm.aero/#/general-guidance/date-time-specification)

## Content of `<fx:arrival>`

Destination Aerodrome `KBWI`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:arrival>
   <fx:destinationAerodrome>
      <fb:locationIndicator>KBWI</fb:locationIndicator>
   </fx:destinationAerodrome>
</fx:arrival>
```
Encoding Rules:
* Rules for [`<fx:aerodrome>`](https://docs.fixm.aero/#/general-guidance/references-to-published-aeronautical-information?id=references-to-aerodromes)

## Content of `<fx:routeInformation>`

Total EET `00:27:15`, Cruising Level `5000 ft`, Cruising Speed `160 kts`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:routeInformation>
   <fx:cruisingLevel>
      <fb:altitude uom="FT">5000</fb:altitude>
   </fx:cruisingLevel>
   <fx:cruisingSpeed uom="KT">160</fx:cruisingSpeed>
   <fx:totalEstimatedElapsedTime>P0Y0M0DT0H27M15S</fx:totalEstimatedElapsedTime>
</fx:routeInformation>
```
Encoding Rules:
* Rules for [`<fb:altitude>`](https://docs.fixm.aero/#/general-guidance/vertical-distances)
* Rules for `<fx:cruisingSpeed>`
* Rules for [`<fx:totalEstimatedElapsedTime>`](https://docs.fixm.aero/#/general-guidance/date-time-specification)

## Content of `<fx:routeTrajectoryGroup>` - FF-ICE Basic Route
Departure Aerodrome `KHGR`, Route `DCT HGR V268 EMI DCT`, Destination Aerodrome `KBWI`

|#|Route Element (RE)<br>Start Point|RE Along Route Distance|Route to Next Element|
|:-|:-|:-|:-|
|1|KHGR|0.00 NM|Direct|
|2|HGR|6.12 NM|V268|
|3|EMI|48.67 NM|Direct|
|4|KBWI|72.47 NM|N/A|

- Download XML [here](https://github.com/fixm-ccb/fixm-user-manual-4.3.0-testing/tree/main/docs/assets/downloads/example_data_FFICE_IG_E-3.7_basic_route.xml)

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:routeTrajectoryGroup>
  <fx:desired>
    <!-- ROUTE ELEMENT 1 -->    
    <fx:element seqNum="0">
      <fx:alongRouteDistance uom="NM">0.0</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KHGR</fb:locationIndicator>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 2 -->    
    <fx:element seqNum="1">
      <fx:alongRouteDistance uom="NM">6.12</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>HGR</fb:designator>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 3 -->    
    <fx:element seqNum="2">
      <fx:alongRouteDistance uom="NM">48.67</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>EMI</fb:designator>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 4 -->    
    <fx:element seqNum="3">
      <fx:alongRouteDistance uom="NM">72.47</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KBWI</fb:locationIndicator>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
    </fx:element>
  </fx:desired>
</fx:routeTrajectoryGroup>
```

Encoding Rules:
* Rules for [`seqNum`](https://docs.fixm.aero/#/general-guidance/sequence-numbers)
* Rules for [`<fb:aerodromeReferencePoint>`](https://docs.fixm.aero/#/general-guidance/references-to-published-aeronautical-information?id=references-to-aerodromes) 
* Rules for [`<fb:navaid>`](https://docs.fixm.aero/#/general-guidance/references-to-published-aeronautical-information?id=references-to-navaid) 
* ...

## Content of `<fx:routeTrajectoryGroup>` - FF-ICE Expanded Route

|#|RE Start Point|RE Along Route Distance|RE Start Point<BR>Geographic Position|Route to Next Element|
|:-|:-|:-|:-|:-|
|1|KHGR|0.00 NM|N39:42:31 W077:43:35|Direct|
|2|HGR|6.12 NM|N39:41:52 W077:51:21|V268|
|3|KEMAR|34.48 NM|N39:33:45 W077:16:02|V268|
|4|EMI|48.67 NM|N39:29:42 W076:58:43|Direct|
|5|KBWI|72.47 NM|N39:10:33 W076:40:08|N/A|

- Download XML [here](https://github.com/fixm-ccb/fixm-user-manual-4.3.0-testing/tree/main/docs/assets/downloads/example_data_FFICE_IG_E-3.7_expanded_route.xml)
   
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:routeTrajectoryGroup>
  <fx:desired>
    <!-- ROUTE ELEMENT 1 -->    
    <fx:element seqNum="0">
      <fx:alongRouteDistance uom="NM">0.0</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KHGR</fb:locationIndicator>
          <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.70861111 -77.72638889</fb:pos>
          </fb:referencePoint>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 2 -->    
    <fx:element seqNum="1">
      <fx:alongRouteDistance uom="NM">6.12</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>HGR</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.69777778 -77.85583333</fb:pos>
          </fb:position>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 3 -->    
    <fx:element seqNum="2">
      <fx:alongRouteDistance uom="NM">34.48</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:designatedPoint>
          <fb:designator>KEMAR</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.5625 -77.26722222</fb:pos>
          </fb:position>
        </fb:designatedPoint>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 4 -->    
    <fx:element seqNum="3">
      <fx:alongRouteDistance uom="NM">48.67</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>EMI</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.495 -76.97861111</fb:pos>
          </fb:position>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 5 -->    
    <fx:element seqNum="4">
      <fx:alongRouteDistance uom="NM">72.47</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KBWI</fb:locationIndicator>
          <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.17583333 -76.66888889</fb:pos>
          </fb:referencePoint>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
    </fx:element>
  </fx:desired>
</fx:routeTrajectoryGroup>
```

## Content of `<fx:routeTrajectoryGroup>` - FF-ICE Trajectory

|#|RE Start Point|RE Start Point<BR>Geo. Pos.|RE Along Route Distance|Route to<br>Next Element|Trajectory Point (TP)<br>Geo. Pos.|TP Point Property|TP Altitude|TP Ind. Air Speed|TP Time|
|:-|:-|:-|:-|:-|:-|:-|:-|:-|:-|
|1|KHGR|N39:42:31<br>W077:43:35|0.00 NM|Direct|N39:42:31<br>W077:43:35|Airport Reference Loc.<br><br>Initial Prediction Point|703|125|Absolute: 07:00:00|
|2|HGR|N39:41:52<br>W077:51:21|6.02 NM|V268|N39:41:52<br>W077:51:21|TCP- Lateral|2732|125|Relative: 00:02:35|
|3|||10.35 NM|V268|N39:40:38<br>W077:45:57||4389|125|Relative: 00:04:43|
|4|||12.18 NM|V268|N39:40:06<br>W077:43:36|Top of Climb|5000|125|Relative: 00:05:35|
|5|||13.26 NM|V268|N39:39:48<br>W077:42:15|TCP- Speed|5000|160|Relative: 00:06:02|
|6|KEMAR|N39:33:45<br>W077:16:02|34.48 NM|V268|N39:33:45<br>W077:16:02||5000|160|Relative: 00:13:56|
|7|EMI|N39:29:42<br>W076:58:43|48.49 NM|Direct|N39:29:42<br>W076:58:43|TCP- Lateral|5000|160|Relative: 00:19:02|
|8|||51.18 NM|Direct|N39:27:26<br>W076:56:30|Top of Descent|5000|160|Relative: 00:20:01|
|9|||51.84 NM|Direct|N39:26:54<br>W076:55:59||4852|160|Relative: 00:20:15|
|10|||71.52 NM|Direct|N39:11:16<br>W076:40:50||366|120|Relative: 00:26:55|
|11|KBWI|N39:10:33<br>W076:40:08|72.45 NM|n/a|N39:10:33<br>W076:40:08|Airport Reference Loc.<br><br>End Prediction Point|143|100|Relative: 00:27:15|

- Download XML [here](https://github.com/fixm-ccb/fixm-user-manual-4.3.0-testing/tree/main/docs/assets/downloads/example_data_FFICE_IG_E-3.7_trajectory.xml)

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:routeTrajectoryGroup>
  <fx:desired>
    <!-- ROUTE ELEMENT 1 -->       
    <fx:element seqNum="0">
      <fx:alongRouteDistance uom="NM">0.0</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KHGR</fb:locationIndicator>
          <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.70861111 -77.72638889</fb:pos>
          </fb:referencePoint>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">703</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>AIRPORT_REFERENCE_LOCATION</fx:propertyType>
        </fx:pointProperty>
        <fx:pointProperty>
          <fx:propertyType>INITIAL_PREDICTION_POINT</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.70861111 -77.72638889</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">125</fx:predictedAirspeed>
        <fx:time>
          <fx:absoluteTime>2023-05-22T07:00:00Z</fx:absoluteTime>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 2 -->     
    <fx:element seqNum="1">
      <fx:alongRouteDistance uom="NM">6.02</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>HGR</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.69777778 -77.85583333</fb:pos>
          </fb:position>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">2732</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>TCP_LATERAL</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.70861111 -77.72638889</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">125</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H2M35S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 3 -->       
    <fx:element seqNum="2">
      <fx:alongRouteDistance uom="NM">10.35</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">4389</fb:altitude>
        </fx:level>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.67722222 -77.76583333</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">125</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H4M43S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 4 -->       
    <fx:element seqNum="3">
      <fx:alongRouteDistance uom="NM">12.18</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">5000</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>TOP_OF_CLIMB</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.66833333 -77.72666667</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">125</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H5M35S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 5 -->       
    <fx:element seqNum="4">
      <fx:alongRouteDistance uom="NM">13.26</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">5000</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>TCP_SPEED</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.66333333 -77.70416667</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">160</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H6M2S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 6 -->       
    <fx:element seqNum="5">
      <fx:alongRouteDistance uom="NM">34.48</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:designatedPoint>
          <fb:designator>KEMAR</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.5625 -77.26722222</fb:pos>
          </fb:position>
        </fb:designatedPoint>
      </fx:elementStartPoint>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">5000</fb:altitude>
        </fx:level>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.5625 -77.26722222</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">160</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H13M56S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:routeDesignator>V268</fx:routeDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 7 -->       
    <fx:element seqNum="6">
      <fx:alongRouteDistance uom="NM">48.49</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:navaid>
          <fb:designator>EMI</fb:designator>
          <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.495 -76.97861111</fb:pos>
          </fb:position>
        </fb:navaid>
      </fx:elementStartPoint>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">5000</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>TCP_LATERAL</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.495 -76.97861111</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">160</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H19M2S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 8 -->       
    <fx:element seqNum="7">
      <fx:alongRouteDistance uom="NM">51.18</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">5000</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>TOP_OF_DESCENT</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.45722222 -76.94166667</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">160</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H20M1S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 9 -->       
    <fx:element seqNum="8">
      <fx:alongRouteDistance uom="NM">51.84</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">4852</fb:altitude>
        </fx:level>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.44833333 -76.93305556</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">160</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H20M15S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 10 -->       
    <fx:element seqNum="9">
      <fx:alongRouteDistance uom="NM">71.52</fx:alongRouteDistance>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">366</fb:altitude>
        </fx:level>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.18777778 -76.68055556</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">120</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H26M55S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
      <fx:routeDesignatorToNextElement>
        <fx:otherRouteDesignator>DIRECT</fx:otherRouteDesignator>
      </fx:routeDesignatorToNextElement>
    </fx:element>
    <!-- ROUTE ELEMENT 11 -->       
    <fx:element seqNum="10">
      <fx:alongRouteDistance uom="NM">72.45</fx:alongRouteDistance>
      <fx:elementStartPoint>
        <fb:aerodromeReferencePoint>
          <fb:locationIndicator>KBWI</fb:locationIndicator>
          <fb:referencePoint srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>39.17583333 -76.66888889</fb:pos>
          </fb:referencePoint>
        </fb:aerodromeReferencePoint>
      </fx:elementStartPoint>
      <fx:point4D>
        <fx:level>
          <fb:altitude uom="FT">143</fb:altitude>
        </fx:level>
        <fx:pointProperty>
          <fx:propertyType>AIRPORT_REFERENCE_LOCATION</fx:propertyType>
        </fx:pointProperty>
        <fx:pointProperty>
          <fx:propertyType>END_PREDICTION_POINT</fx:propertyType>
        </fx:pointProperty>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
          <fb:pos>39.17583333 -76.66888889</fb:pos>
        </fx:position>
        <fx:predictedAirspeed uom="KT">100</fx:predictedAirspeed>
        <fx:time>
          <fx:relativeTimeFromInitialPredictionPoint>P0Y0M0DT0H27M15S</fx:relativeTimeFromInitialPredictionPoint>
        </fx:time>
      </fx:point4D>
    </fx:element>
  </fx:desired>
</fx:routeTrajectoryGroup>
```

# References

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 
