# Constraints 

## RouteTrajectoryConstraint

The FF-ICE 0.99 requirements B-3.4.3, B-3.4.4, and B-3.4.5 outline[Uploading CR 177 Table in markdown format (1).txt…]()
 the speed, Level, and Time Constraints that FIXM must represent:

at, at or above, at or below, or between 2 levels
at, at or above, at or below, or between 2 speeds
at, at or before, at or after, or between 2 times

The below table provides an example of how to encode each of the constraints in FIXM format:

### Level Constraints
| ****                | **AT**                   | **AT_OR_GREATER**                   | **AT_OR_LESS**                      | **BETWEEN**                                                                       |
|---------------------|--------------------------|-------------------------------------|-------------------------------------|-----------------------------------------------------------------------------------|
| **SpeedConstraint** | Single Value             | Single Value                        | Single Value                        | Value 1 to Value 2                                                                |
| **Examples**        | Speed.speed.Value:###### | Speed.speed.range.lowerBound:###### | Speed.speed.range.upperBound:###### | Speed.speed.range.upperBound:######<br>and<br>Speed.speed.range.lowerBound:###### |

### Speed Constraints

| ****                | **AT**                   | **AT_OR_GREATER**                   | **AT_OR_LESS**                      | **BETWEEN**                                                                       |
|---------------------|--------------------------|-------------------------------------|-------------------------------------|-----------------------------------------------------------------------------------|
| **SpeedConstraint** | Single Value             | Single Value                        | Single Value                        | Value 1 to Value 2                                                                |
| **Examples**        | Speed.speed.Value:###### | Speed.speed.range.lowerBound:###### | Speed.speed.range.upperBound:###### | Speed.speed.range.upperBound:######<br>and<br>Speed.speed.range.lowerBound:###### |

### Time Constrainte

| ****               | **AT**                        | **AT_OR_AFTER**                        | **AT_OR_BEFORE**                     | **BETWEEN**                                                                           |
|--------------------|-------------------------------|----------------------------------------|--------------------------------------|---------------------------------------------------------------------------------------|
| **TimeConstraint** | Single Value                  | Single Value                           | Single Value                         | Value 1 to Value 2                                                                    |
| **Examples**       | timeSpecification.value:##### | timeSpecification.range.earliest:##### | timeSpecification.range.latest:##### | timeSpecification.range.earliest:#####<br>and<br>timeSpecification.range.latest:##### |
