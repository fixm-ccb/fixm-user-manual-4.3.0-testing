# Date/Time Specification & AIRAC Effective Date

FIXM requires times to be expressed in UTC. A constraint is therefore placed on the FIXM classes used to represent date/time values that imposes the use of the trailing character `Z` to indicate UTC, in line with the W3C XSD specification.

Sub-second precision is considered unneeded for most aviation data, but other fields such as message timestamps can still benefit from higher precision date/times.

`FIXM Core 4.3.0` defines two types for representing date/time values, both restricting the standard XML dateTime:
- `DateTimeUtc` is constrained to only allow whole second precision. It is used for typing all aviation-related times, such as the actual time of arrival.
- `DateTimeUtcHighPrecision` employs unrestricted sub-second precision. It is used for typing the message timestamps in the FIXM Applications.

Examples: 
- for aviation-related times, *20th July 1969 at 20:18 UTC* is expressed as `1969-07-20T20:18:00Z`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:actualTimeOfArrival>
  <fx:time>1969-07-20T20:18:00Z</time>
```

- for message timestamps, higher precision can be provided, as needed: `1969-07-20T20:18:00.458Z`

!> **Note to implementers:** The mapping of the XSD type `dateTime` to native structures in various development contexts is not always 1-1 and may exhibit a wide variety of difficulties depending on the tooling and runtime context. In particular, the trailing character `Z` indicating UTC may actually be stripped/omitted, leading to FIXM times being interpreted as local times instead of UTC times by some applications. FIXM implementers are therefore invited to crosscheck that their systems correctly interpret FIXM times as UTC time.

## AIRAC Effective Date

`FIXM Core 4.3.0` enables implementers, and in particular operators, to indicate, by reference to the AIRAC Effective date, the aeronautical dataset used in the creation of the flight plan and calculation of the route/trajectory. The AIRAC Effective Date is based on the [ICAO published schedule](https://www.icao.int/airnavigation/information-management/Pages/AIRAC.aspx).

Example:

|Cycle|Ident|**AIRAC Effective Date**|
|:-|:-|:-|
|1|2201|27 JAN 22|
|**2**|**`2202`**|**`24 FEB 22`**|
|...|...|...|

The indication that the aeronautical dataset for cycle `2202` has been used for the computation of the route/trajectory will be expressed as:

```xml
<fx:routeInformation>
  <fx:airacReference>2022-02-24Z</fx:airacReference>
```

!> **Note to implementers:** When used as the AIRAC reference in the FF-ICE Flight Plan, the AIRAC Effective Date shall be solely interpreted as an indication of the aeronautical data set that has been used by the operator for the computation of the flight plan, and not as the actual date at which that data set will effectively become applicable. Indeed, the date at which a new AIRAC cycle effectively becomes applicable may be subject to regional or domestic procedures and may therefore differ from the ICAO published schedule. For instance, in some Asians countries, a new AIRAC cycle would become effective on 00LCL, which is the day before AIRAC day in UTC as published by ICAO.
