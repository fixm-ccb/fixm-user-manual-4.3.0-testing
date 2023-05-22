# Example Data

This page explains how the route/trajectory example from the FF-ICE/R1 Implementation Guidance Manual (Appendix E-3.7) is concretely encoded in FIXM. 
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
   <fx:estimatedOffBlockTime>2021-03-04T07:00:00Z</fx:estimatedOffBlockTime>
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

Route `DCT HGR V268 EMI DCT`

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
      <fx:alongRouteDistance uom="NM">48.49</fx:alongRouteDistance>
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
      <fx:alongRouteDistance uom="NM">72.45</fx:alongRouteDistance>
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
      <fx:alongRouteDistance uom="NM">48.49</fx:alongRouteDistance>
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
      <fx:alongRouteDistance uom="NM">72.45</fx:alongRouteDistance>
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

