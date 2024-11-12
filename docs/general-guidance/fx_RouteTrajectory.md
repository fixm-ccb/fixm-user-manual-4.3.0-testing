# Encoding guidance for fx:FlightRouteTrajectory

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA9/EA2/EA373.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_RouteTrajectoryGroupType.html)

---

## `climbProfile` / `descentProfile`

As explained in the FF-ICE/R1 Implementation Guidance Manual <sup>[[I-06]](#References)</sup>,
the `Performance Profile` is a zero-wind, standard atmosphere profile reflective of the flight capabilities and desired parameters. 
It does not include any flight-specific constraints such as altitude or speed restrictions applicable to the route of flight. 
However, it does incorporate constraints that are always applicable (e.g., a 250 knot constraint applicable to all flights below 10,000 feet), 
and gradients required for obstacle clearance along the route of flight.

A `Performance Profile` is expressed as a sequence of `Profile Points` each containing: distance, time duration, flight level or altitude, and optionally the true airspeed.

Climb profiles begin at take-off with distance and time expressed relative to the point associated with take-off, nominally the “Wheels Off” point. Climb profiles end at the maximum operational cruise altitude for the specific route/trajectory.

Descent profiles begin at a top-of-descent at the maximum operational cruise altitude for the specific route/trajectory. Time and distance are expressed relative to the top-of-descent. Descent profiles end at touchdown.

The FIXM Core class `RouteTrajectoryGroup` has two properties `climbProfile` and `descentProfile` that can be used for exchanging the `Performance Profile`.

### Example of Climb Profile

![Image](.//media/example_climb_profile.png ':size=100%')

<details>
  <summary>XML example</summary>

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:climbProfile>
    <fx:profilePoint seqNum="0">
        <fx:distance uom="M">0.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">110.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H0M0S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="1">
        <fx:distance uom="M">6939.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">610.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H1M41S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="2">
        <fx:distance uom="M">9284.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">914.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H1M59S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="3">
        <fx:distance uom="M">11726.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">1219.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H2M17S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="4">
        <fx:distance uom="M">14243.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">1524.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H2M35S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="5">
        <fx:distance uom="M">16852.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">1829.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H2M54S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="6">
        <fx:distance uom="M">19535.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">2134.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H3M14S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="7">
        <fx:distance uom="M">22329.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">2438.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H3M33S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="8">
        <fx:distance uom="M">25197.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">2743.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H3M53S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="9">
        <fx:distance uom="M">28157.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">3048.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H4M13S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="10">
        <fx:distance uom="M">36206.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">3353.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H5M1S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="11">
        <fx:distance uom="M">39851.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">3658.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H5M21S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="12">
        <fx:distance uom="M">43644.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">3962.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H5M42S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="13">
        <fx:distance uom="M">47585.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">4267.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H6M3S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="14">
        <fx:distance uom="M">51729.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">4572.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H6M25S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="15">
        <fx:distance uom="M">55112.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">4810.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H6M43S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="16">
        <fx:distance uom="M">60609.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">5182.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H7M11S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="17">
        <fx:distance uom="M">65383.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">5486.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H7M35S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="18">
        <fx:distance uom="M">70432.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">5791.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H8M0S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="19">
        <fx:distance uom="M">75760.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">6096.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H8M26S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="20">
        <fx:distance uom="M">81384.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">6401.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H8M54S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="21">
        <fx:distance uom="M">87376.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">6706.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H9M22S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="22">
        <fx:distance uom="M">90738.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">6867.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H9M37S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="23">
        <fx:distance uom="M">93721.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">7010.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H9M52S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="24">
        <fx:distance uom="M">100490.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">7315.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H10M23S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="25">
        <fx:distance uom="M">107702.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">7620.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H10M55S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="26">
        <fx:distance uom="M">111586.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">7775.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H11M13S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="27">
        <fx:distance uom="M">115358.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">7925.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H11M29S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="28">
        <fx:distance uom="M">123477.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">8230.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H12M5S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="29">
        <fx:distance uom="M">132130.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">8534.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H12M43S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="30">
        <fx:distance uom="M">141392.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">8839.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H13M22S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="31">
        <fx:distance uom="M">151320.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">9144.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H14M4S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="32">
        <fx:distance uom="M">162188.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">9449.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H14M49S</fx:time>
    </fx:profilePoint>
    <fx:profilePoint seqNum="33">
        <fx:distance uom="M">174349.0</fx:distance>
        <fx:level>
            <fb:altitude uom="M">9754.0</fb:altitude>
        </fx:level>
        <fx:time>P0DT0H15M39S</fx:time>
    </fx:profilePoint>
</fx:climbProfile>
```
    
</details>


### Example of Descent Profile

![Image](.//media/example_descent_profile.png ':size=100%')

<details>
  <summary>XML example</summary>

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->
<fx:descentProfile>			
    <fx:profilePoint seqNum="0">		
        <fx:distance uom="M">236300.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">11887.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H0M0S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="1">		
        <fx:distance uom="M">197590.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">10404.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H2M51S</fx:time>	
    </fx:profilePoint>
    <fx:profilePoint seqNum="2">		
        <fx:distance uom="M">166603.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">8691.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H5M20S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="3">		
        <fx:distance uom="M">157342.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">8157.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H6M7S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="4">		
        <fx:distance uom="M">135395.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">6889.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H8M3S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="5">		
        <fx:distance uom="M">126136.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">6373.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H8M54S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="6">		
        <fx:distance uom="M">103893.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">5179.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H11M2S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="7">		
        <fx:distance uom="M">85404.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">4220.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H12M56S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="8">		
        <fx:distance uom="M">66881.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">3223.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H14M55S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="9">		
        <fx:distance uom="M">58009.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">2733.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H15M55S</fx:time>
    </fx:profilePoint>		
    <fx:profilePoint seqNum="10">		
        <fx:distance uom="M">36961.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">1355.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H18M24S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="11">		
        <fx:distance uom="M">27814.0</fx:distance>
        <fx:level>	
            <fb:altitude uom="M">1129.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H20M17S</fx:time>	
    </fx:profilePoint>		
    <fx:profilePoint seqNum="12">		
        <fx:distance uom="M">0.0</fx:distance>	
        <fx:level>	
            <fb:altitude uom="M">441.0</fb:altitude>
        </fx:level>	
        <fx:time>P0DT0H25M58S</fx:time>	
    </fx:profilePoint>		
</fx:descentProfile>		
```
    
</details>

---

## `element`

### `point4D`

#### `pointProperty`

Each Trajectory Point in a FIXM four-dimensional trajectory can indicate, via use of Trajectory Point Properties, the events of interest that occur at that particular point. The following table is intended to help clarify what each Trajectory Point Property is for and when each of the property types should be used.

|Enumerated Value|Description|Uses|Number of Instances Allowed (M=multiple)|
|:---|:---|:---|:---:|
|TOP_OF_CLIMB|(From ARINC 702A) The point where the trajectory arrives at the cruise flight level after a climb. There will be one top-of-climb for each cruise flight level (step climbs).|Describes the vertical profile.|M|
|TOP_OF_DESCENT|The point where the trajectory begins a descent from the final cruise flight level.|Describes the vertical profile.|1|
|TCP_VERTICAL|Indicates that the associated trajectory change point (TCP) is one at which a level segment (intermediate or cruise) will be initiated or terminated.|Describes the vertical profile.|M|
|TCP_SPEED|The point where the airplane will begin accelerating or decelerating as a result of a speed constraint or limit, or reaches the target speed. (ARINC 702A)|Describes the flight’s speed profile to obtain accurate assessment of time at points.|M|
|TCP_LATERAL|Indicates that the associated trajectory change point (TCP) is one at which a course, track or heading change will be initiated or terminated. It is not required to be provided for a planned transition between published ATS routes.|Describes the lateral profile.|M|
|CROSSOVER_ALTITUDE|The point in climb or descent where the airplane will transition between Mach Number and IAS control. (ARINC 702A)|Enhances the vertical profile.|M|
|TRANSITION_ALTITUDE_OR_LEVEL|Indicates that the associated trajectory point is the point at which the trajectory reaches the transition altitude (in climb) or level (in descent).|Provides clarity on assumptions for altitude reference.|M|
|DEPARTURE_RUNWAY_END|Indicates that the associated trajectory point corresponds to the point at the end of the runway on departure. This point is at the center of the runway at the departure end when departing.|Provides clarity regarding the point at which a computed trajectory is being initiated on the runway.|1|
|RUNWAY_THRESHOLD|This point is the threshold (which may be displaced) at the centerline of the runway at the approach end when arriving. See ICAO Annex 14.|Provides clarity regarding the point at which a computed trajectory is being terminated on the runway.|1|
|OFF_BLOCKS|This is the point at which the aircraft pushes back and begins to taxi for departure.|Provides clarity as to where the taxi will begin. May be the time provided in a departure message.|1|
|START_TAKEOFF_ROLL|Indicates that the associated trajectory point corresponds to the point at the start of take-off roll (used for departures only)|Provides clarity regarding the point at which a computed trajectory is being initiated on the runway. May be the time provided in a departure message|1|
|WHEELS_OFF|Indicates that the associated trajectory point corresponds to the point at which the aircraft is predicted to be wheels off the runway on departure.|Provides clarity regarding the point at which a computed trajectory is being initiated on the runway. May be the time provided in a departure message|1|
|WHEELS_ON|Indicates that the associated trajectory point corresponds to the point at which the aircraft is predicted to be wheels on the runway for arrival.|Provides clarity regarding the point at which a computed trajectory is being terminated on the runway. May be the time provided in an arrival message|1|
|END_LANDING_ROLL|Indicates that the associated trajectory point corresponds to the point at which the aircraft is predicted to come to a full stop on the arrival runway. (A prediction only, the flight will likely exit the runway without coming to a full stop).|Provides clarity regarding the point at which a computed trajectory is being terminated on the runway. May be the time provided in an arrival message|1|
|IN_BLOCKS|Indicates the point and time at which an arriving aircraft is/was in blocks.|Provides clarity regarding when a flight has completed. May be the time provided in an arrival message.|1|
|ENTRY_RESTRICTED_OR_RESERVED_AIRSPACE|Indicates that the associated trajectory point is the point at which the flight is predicted to enter an airspace restriction/reservation, including any additional safety buffer. An identifier to the airspace is provided in the trajectory point reference.|Used to indicate the point at which a flight’s trajectory is predicted to enter an airspace restriction/reservation.|M|
|EXIT_RESTRICTED_OR_RESERVED_AIRSPACE|Indicates that the associated trajectory point is the point at which the flight is predicted to exit an airspace restriction/reservation, including any additional separation requirements. An identifier to the airspace is provided in the trajectory point reference.|Used to indicate the point at which a flight’s trajectory is predicted to exit an airspace restriction/reservation.|M, each must pair to an Entry|
|ENTRY_CONSTRAINED_AIRSPACE|Indicates that the associated trajectory point is the point at which the trajectory is predicted to cross into designated constrained airspace.|Used during feedback to indicate the point at which a flight’s trajectory is predicted to enter constrained airspace.|M|
|CROSSING_CONSTRAINED_AIRSPACE|Indicates that the associated trajectory point is the point at which the trajectory is predicted to cross constrained airspace designated as a line.|Used during feedback to indicate the point at which a flight’s trajectory is predicted to cross a line constraint.|M|
|EXIT_CONSTRAINED_AIRSPACE|Indicates that the associated trajectory point is the point at which the trajectory is predicted to exit from designated constrained airspace.|Used during feedback to indicate the point at which a flight’s trajectory is predicted to exit constrained airspace.|M, each must pair to an Entry|
|HOLD_ENTRY|Indicates that the associated trajectory point is a point at which the flight is expected to enter into planned holding.|Used to indicate a point at which a flight is expected to enter planned holding. Expression of this property should be used in conjunction with delay type OPERATOR_REQUEST_HOLDING.|M|
|HOLD_EXIT|Indicates that the associated trajectory point is a point at which the flight is expected to exit from planned holding.|Used to indicate a point at which a flight is expected to exit planned holding. Expression of this property should be used in conjunction with delay type OPERATOR_REQUEST_HOLDING.|M, each must pair to an Entry|
|BEGIN_STAY|Indicates that the associated trajectory point is a point at which the flight is expected to begin an operation at which the flight will remain for some time.|Used in conjunction with a Delay indication to specify the starting point. Expression of this property should be used in conjunction with non-holding delay types such as OPERATOR_REQUEST_POINT, OPERATOR_REQUEST_SEGMENT, OPERATOR_REQUEST_AIRSPACE, or OPERATOR_REQUEST_AERODROME.|M|
|END_STAY|Indicates that the associated trajectory point is a point at which the flight is expected to terminate an operation at which it remained for some time.|Used in conjunction with a Delay indication to specify the ending point. Expression of this property should be used in conjunction with non-holding delay types such as OPERATOR_REQUEST_POINT, OPERATOR_REQUEST_SEGMENT, OPERATOR_REQUEST_AIRSPACE, or OPERATOR_REQUEST_AERODROME.|M, each must pair to a Begin|
|INITIAL_PREDICTION_POINT|Indicates that the associated trajectory point is the initial point at which a prediction was made. For FF-ICE Planning, an eASP may provide a trajectory which is predicted to begin at an entry point into the eASP airspace. This includes a point near entry into the Area of Responsibility.|Provides the point at which a prediction was initiated. This point indicates an absolute time when others indicate time relative to this absolute time.|1|
|END_PREDICTION_POINT|Indicates that the associated trajectory point is the final point at which a prediction was made. For FF-ICE Planning, an eASP may provide a trajectory which is predicted to end at an exit point from the eASP airspace.|Provides an indication of the last point at which a trajectory prediction was made. This point need not be the end of the flight.|1|
|CONSTRAINT_POINT|Indicates that the associated trajectory point is the point of application of a constraint. These can include explicit altitude, speed or time constraints or implicit MIT/MINIT, or sequencing constraints. For named constraints, a reference to the name of the constraint should be provided under trajectory point reference.|Used to provide feedback on constraints applicable to a trajectory.|M|
|FIR_BOUNDARY_CROSSING_POINT|Indicates the point at which the trajectory crosses from one FIR into another. A named reference to the FIR being entered may also be provided.|Used in conjunction with the time at a Trajectory Point to indicate the estimated elapsed time to a FIR boundary|M|
|START_EXPECT_VECTORS|When procedures specify “Expect Vectors”, the associated point identifies the starting point of the vectoring.|Used to indicate a portion of the trajectory with uncertainty in lateral path choice and times.|M|
|END_EXPECT_VECTORS|When procedures specify “Expect Vectors”, the associated point identifies the ending point of the vectoring. The Trajectory Point data at this point includes an estimate of the impact of vectoring.|Used to indicate the end of vectoring and associated uncertainty in lateral path and times.|M, each must pair to a Start|
|PRESCRIBED_EET_POINT|Indicates that the associated trajectory point represents a point that has been prescribed for required Estimated Elapsed Time reporting. This can include a FIR boundary crossing point or a significant point as prescribed on the basis of regional air navigation agreements, or by the appropriate ATS authority.|Prescribed EET Point|M|
|AIRPORT_REFERENCE_LOCATION|Indicates that the associated trajectory point is the airport reference location.|Used for expressing the departure or arrival point when specific runway locations information on the flight has not been used in the prediction.|2|

--- 

## `routeInformation`

### `airacReference`

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

---

## *References* <!-- {docsify-ignore} -->

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 
