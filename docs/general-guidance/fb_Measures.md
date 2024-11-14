# Encoding guidance for fb:Measures

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA1/EA5/EA142.png)

---

## `VerticalDistance`

The term vertical distance collectively refers to altitudes, elevations,
and heights, as defined by ICAO

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


FIXM supports the representation of altitudes expressed in feet or
meters (FIXM construct `Altitude`), of altitudes expressed as flight
level number or standard metric level (FIXM construct `FlightLevel`) and
of ellipsoid heights & SFC heights expressed in feet or meters (FIXM
construct `Height` used in conjunction with a `VerticalReference`).

These vertical distances are specialisations of the generic class
`Measure` which serves as the parent class for all measure types including
speeds, angles, pressures, temperatures, etc. Therefore, altitudes, flight 
levels, and heights are encoded as decimal fields, although integer values 
are typically expected. Flight levels go through an extra layer of 
restriction (via class `RestrictedVerticalDistance`) to ensure they are 
always represented with integer values.

### Examples

#### The following examples show altitudes expressed with integers values.  

```xml
<fb:altitude uom="FT">10000</fb:altitude>
```

```xml
<fb:altitude uom="M">3500</fb:altitude>
```

#### The following example shows an altitude expressed with a decimal value. This encoding is technically permitted by FIXM but is NOT RECOMMENDED.

```xml
<fb:altitude uom="M">3500.1</fb:altitude>
```

!> **Note to implementers:** FIXM supports multiple units of measure. When exchanging information in FIXM format, please ensure the recipient of your data can accept information using the units you provide.
