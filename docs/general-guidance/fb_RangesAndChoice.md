# Encoding guidance for fb:RangesAndChoice

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA1/EA1/EA13.png)

---

## `TimeRange`

This represents a time range with a lower bound (`earliest`) and an upper bound (`latest`). 
Both time values shall be expressed in UTC. The `earliest` time shall always be before the `latest` time.

---

## `TrueAirspeedRange`

This represents a true airspeed range with a lower bound (`lowerSpeed`) and an upper bound (`upperSpeed`). 
The `lowerSpeed` shall always be lower than the `upperSpeed`.

---

## `VerticalRange`

This represents a vertical range with a `lowerBound` and an`upperBound`. 
Both values can be either an `altitude` or a `flightLevel`. 
The `lowerBound` shall always be lower than the `upperBound`.
