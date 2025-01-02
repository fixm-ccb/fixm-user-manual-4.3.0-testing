# Encoding guidance for fx:Departure

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA5/EA312.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_DepartureType.html)

---

## `airportSlotIdentification`

Airport slots are being used to balance demand against available airport capacity at airports where the
demand exceeds this capacity. The process of allocating airport slots at
coordinated airports is based on the IATA Worldwide Slot Guidelines as a globally accepted standard.

Some countries require that an airport slot reference is obtained and reflected in the flight plan 
for non-scheduled air transport operations or general aviation. The airport slot reference is defined as 
*the identifier of the scheduled time of arrival or departure available for allocation by, 
or as allocated by, a coordinator for an aircraft movement on a specific date at a coordinated airport*. 

The FIXM Core class `Departure` (resp. `Arrival`) has a property `airportSlotIdentification` that can be used for exchanging a departure (resp. arrival) slot reference. 

This airport slot reference is expressed as a CharacterString with a maxLength set to 10. This is based on the recommendation of the taskforce of experts from 
the European Airport Coordinators Association (EUACA), the International Air Transport Association (IATA) and EUROCONTROL 
which was set-up in order to discuss solutions for integrating airport slot information into FF-ICE information.

### Examples

Identification of a departure airport slot allocated to a General Aviation/Business Aviation (from [ATMRPP-WG/28-WP/653](https://eurocontrol.sharepoint.com/:b:/r/sites/coll-FIXM/Shared%20Documents/FIXM%20Change%20Requests/ICAO%20ATMRPP%20inputs%20for%20FIXM/WP653%20SLOT%20in%20FF-ICE.pdf?csf=1&web=1&e=JBfNqO))
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:flight>
  <fx:departure>
    <fx:airportSlotIdentification>1407011234</fx:airportSlotIdentification>    
```

Identification of a departure airport slot allocated in Europe (from [EUROCONTROL IFPS User Manual R27](https://www.eurocontrol.int/publication/ifps-users-manual)).
```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:flight>
  <fx:departure>
    <fx:airportSlotIdentification>QB7361</fx:airportSlotIdentification>    
```

---

## `airfileIndicator`

See below - chapter departureAerodrome / departurePoint.

---

## `departureAerodrome` / `departurePoint`

There are three use cases associated with departure points that can be represented in FIXM:
 
    1.	Flights that depart from aerodromes.
    2.	Flights that file non-aerodrome departure points.
    3.	Flights that file a flight plan that begins at an en route point (a so called airfile or AFIL flight).

The first of these is by far the most common use case, and, while the second two cases are infrequent, 
they are also required. 

Per the PANSATM <sup>[[I-04]](#references)</sup>, see the final clause of the DEP/ indicator under the Field Type 18 
section of Appendix 3 for the specific need to provide representation for a non-aerodrome departure point:  

> “The first point of the route (name or LAT/LONG) or the marker radio beacon, if the aircraft has not taken off from an aerodrome.”

For most flights, i.e., flights departing from aerodromes, the departure aerodrome will be represented in `departureAerodrome`., and the estimated off block time will be represented in `estimatedOffBlockTime`.

Flights that file non-aerodrome departure points will represent the departure point in `departurePoint`, and will use `estimatedRouteStartTime` for the estimated departure time.

Airfile flights will represent the route start point in `departurePoint`, and will use `estimatedRouteStartTime` for the the airfile route start time. In addition, airfile flights will set the `airFileIndicator` to `AIRFILE`.

### Aerodrome Departure Example

```xml
<fx:departure>
  <fx:departureAerodrome>
    <fb:locationIndicator>KDFW</fb:locationIndicator>
  </fx:departureAerodrome>
  <fx:estimatedOffBlockTime>2023-01-13T15:18:00Z</fx:estimatedOffBlockTime>
</fx:departure>
```

### Non-Aerodrome Departure Example

```xml
<fx:departure>
    <fx:departurePoint>
        <fx:position srsName="urn:ogc:def:crs:EPSG::4326">
            <fb:pos>59.0 -30.0</fb:pos>
        </fx:position>
    </fx:departurePoint>
    <fx:estimatedRouteStartTime>2023-01-13T15:18:00Z</fx:estimatedRouteStartTime>
</fx:departure>
```

### AirFile Example

```xml
<fx:departure>
  <fx:airfileIndicator>AIRFILE</fx:airfileIndicator>
  <fx:departurePoint>
    <fx:navaid>
      <fb:designator>FAM</fb:designator>
      <fb:position srsName="urn:ogc:def:crs:EPSG::4326">
        <fb:pos>37.6734614 -90.2340597</fb:pos>
      </fb:position>
    </fx:navaid>
  </fx:departurePoint>
  <fx:estimatedRouteStartTime>2023-01-13T20:05:00Z</fx:estimatedRouteStartTime>
</fx:departure>
```

---

## `departureAerodromePrevious` / `departurePointPrevious`

See [`aircraftIdentificationPrevious`].

---

## `estimatedOffBlockTime` / `estimatedRouteStartTime`

See above - chapter departureAerodrome / departurePoint.

---

## `estimatedOffBlockTimePrevious` / `estimatedRouteStartTimePrevious`

See [`aircraftIdentificationPrevious`].

---

## *References* <!-- {docsify-ignore} -->

### ICAO References

[I-04]: [ICAO Doc 4444, 16th Edition, 2016](https://store.icao.int/en/procedures-for-air-navigation-services-air-traffic-management-doc-4444) - PANS-ATM: Procedures for Air Navigation Services: Air Traffic Management

[`aircraftIdentificationPrevious`]: general-guidance/fx_FlightData?id=aircraftidentificationprevious
