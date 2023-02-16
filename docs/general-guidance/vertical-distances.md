# Vertical distances

## Definitions

The term vertical distance collectively refers to altitudes, elevations
and heights, as defined by
ICAO

![Image](.//media/general-guidance-vertical-distances-01.png "Differences between Elevation, Altitude, Height and Ellipsoid height")


-   **Altitude** = The vertical distance of a level, a point or an
    object considered as a point, measured from mean sea level (MSL).
    **\[ICAO\]**

-   **Elevation** = The vertical distance of a point or a level, on or
    affixed to the surface of the earth, measured from mean sea level.
    **\[ICAO\]**

-   **Height** = The vertical distance of a level, a point or an object
    considered as a point, measured from a specified datum. **\[ICAO\]**

-   **Ellipsoid height** = The height related to the reference
    ellipsoid, measured along the ellipsoidal outer normal through the
    point in question. **\[ICAO\]**

## FIXM representation of vertical distances

FIXM supports the representation of altitudes expressed in feet or
meters (FIXM construct `Altitude`), of altitudes expressed as flight
level number or standard metric level (FIXM construct `FlightLevel`) and
of ellipsoid heights & heights SFC expressed in feet or meter (FIXM
construct `Height` used in conjunction with a `VerticalReference`).

![Image](.//media/image23.png)

These vertical distances are specialisations of the generic class
`Measure` which serves as the parent class for all measure types including
speeds, angles, pressures, temperatures etc. Therefore, altitudes,
flight levels and heights are always encoded as double values, although
integer values are expected.<sup>[[note 1]](#notes)</sup>

### Examples

#### The following examples show valid FIXM encoding of altitudes and flight
levels expressed as integer.

```xml
<fb:altitude uom="FT">10000</fb:altitude>
```

```xml
<fb:altitude uom="M">3500</fb:altitude>
```

```xml
<fb:flightLevel uom="FL">290</fb:flightLevel>
```

```xml
<fb:flightLevel uom="SM">1130</fb:flightLevel>
```

#### The following example shows the encoding of a flight level expressed as
a double. This encoding is technically permitted by FIXM but is NOT
RECOMMENDED.

```xml
<fb:flightLevel uom="FL">290.0</fb:flightLevel>
```

## Notes

[1]: “Double Integer” conversion can be handled
differently depending on the technical context. This may lead to e.g.
flight level value 100 being expressed as 100.00…0001 and the flight
level value 101 being expressed as 100.99…99999. It is acknowledged that
the current FIXM design may create value persistence problem across
applications, in particular if rounding or truncation are applied
further down. FIXM implementers are therefore invited to verify the
persistence of vertical distances values across their software.