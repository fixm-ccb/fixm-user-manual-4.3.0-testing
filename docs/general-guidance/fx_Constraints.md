# Encoding guidance for fx:Constraints

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA2/EA9/EA3/EA397.png)

Go to [XML schema documentation](https://www.fixm.aero/releases/FIXM-4.3.0/doc/schema_documentation/Fixm_RouteTrajectoryConstraintType.html)

FF-ICE outlines the route/trajectory speed, level, and time constraints that FIXM must be able to represent in sections B-3.4.3, B-3.4.4, and B-3.4.5 of the FF-ICE Implementation Guidance <sup>[[I-06]](#References)</sup>. This includes characterizing the type of constraint by specifying it as occuring:

- at, at or above, at or below, or between two levels
- at, at or greater, at or less, or between two speeds
- at, at or before, at or after, or between two times

The tables below provide examples of how to encode each of these types of constraints in FIXM format:

---

## `level`


| **Type:**       | **Encoding:** |
|:--              |:------ |
| **AT**          | level.**`altitude`**<br>*OR*<br>level.**`flightLevel`** |
| **AT_OR_ABOVE** | level.**`range`**.**`lowerBound`**.**`altitude`**<br>*OR*<br>level.**`range`**.**`lowerBound`**.**`flightLevel`** |  
| **AT_OR_BELOW** | level.**`range`**.**`upperBound`**.**`altitude`**<br>*OR*<br>level.**`range`**.**`upperBound`**.**`flightLevel`** |
| **BETWEEN**     | level.**`range`**.**`upperBound`**.**`altitude`**<br>*OR*<br>level.**`range`**.**`upperBound`**.**`flightLevel`**<br><br>*AND*<br><br>level.**`range`**.**`lowerBound`**.**`altitude`**<br>*OR*<br>level.**`range`**.**`lowerBound`**.**`flightLevel`** |


## `speed`

| **Type:**         | **Encoding:** |
|:--                |:------ |
| **AT**            | speed.**`value`** |
| **AT_OR_GREATER** | speed.**`range`**.**`lowerSpeed`** |  
| **AT_OR_LESS**    | speed.**`range`**.**`upperSpeed`** |
| **BETWEEN**       | speed.**`range`**.**`upperSpeed`**<br>*AND*<br>speed.**`range`**.**`lowerSpeed`** |


## `time`

| **Type:**         | **Encoding:** |
|:--                |:------ |
| **AT**            | **`timeSpecification`**.**`value`** |
| **AT_OR_AFTER**   | **`timeSpecification`**.**`range`**.**`earliest`** |  
| **AT_OR_BEFORE**  | **`timeSpecification`**.**`range`**.**`latest`** |
| **BETWEEN**       | **`timeSpecification`**.**`range`**.**`earliest`**<br>*AND*<br>**`timeSpecification`**.**`range`**.**`latest`** |


## *References* <!-- {docsify-ignore} -->

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 

