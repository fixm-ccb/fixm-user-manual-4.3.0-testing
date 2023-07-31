# Constraints 

## Route/Trajectory Constraints

FF-ICE outlines the route/trajectory speed, level, and time constraints that FIXM must be able to represent in sections B-3.4.3, B-3.4.4, and B-3.4.5 of the FF-ICE Implementation Guidance <sup>[[I-06]](#references)</sup>. This includes characterizing the type of constraint by specifying it as occuring:

- at, at or above, at or below, or between two levels
- at, at or greater, at or less, or between two speeds
- at, at or before, at or after, or between two times

The below table provides an example of how to encode each of these types of constraints in FIXM format:

### Level Constraints
| **Type:**                | **AT**                   | **AT_OR_ABOVE**                   | **AT_OR_BELOW**                      | **BETWEEN**                                                                       |
|---------------------|--------------------------|-------------------------------------|-------------------------------------|-----------------------------------------------------------------------------------|
| **Encoding:**        | Level.level.altitude<br>or<br>Level.level.flightLevel | Level.level.range.lowerBound.altitude<br>or<br>Level.level.range.lowerBound.flightLevel | Level.level.range.upperBound.altitude<br>or<br>Level.level.range.upperBound.flightLevel | Level.level.range.upperBound.altitude<br>or<br>Level.level.range.upperBound.flightLevel<br><br>and<br><br>Level.level.range.lowerBound.altitude<br>or<br>Level.level.range.lowerBound.flightLevel |

### Speed Constraints

| **Type:**                | **AT**                   | **AT_OR_GREATER**                   | **AT_OR_LESS**                      | **BETWEEN**                                                                       |
|---------------------|--------------------------|-------------------------------------|-------------------------------------|-----------------------------------------------------------------------------------|
| **Encoding:**        | Speed.speed.value | Speed.speed.range.lowerSpeed | Speed.speed.range.upperSpeed | Speed.speed.range.upperSpeed<br>and<br>Speed.speed.range.lowerSpeed |

### Time Constraints

| **Type:**               | **AT**                        | **AT_OR_AFTER**                        | **AT_OR_BEFORE**                     | **BETWEEN**                                                                           |
|--------------------|-------------------------------|----------------------------------------|--------------------------------------|---------------------------------------------------------------------------------------|
| **Encoding:**       | Time.timeSpecification.value | Time.timeSpecification.range.earliest | Time.timeSpecification.range.latest | Time.timeSpecification.range.earliest<br>and<br>Time.timeSpecification.range.latest |


## References

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 
