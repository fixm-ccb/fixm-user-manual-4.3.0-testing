# Encoding guidance for fb:Types

![Image](https://www.fixm.aero/releases/FIXM-4.3.0/doc/logical_model_documentation/EARoot/EA1/EA1/EA7/EA200.png)

---

## `Count` (Sequence Numbers)

The FIXM Logical Model specifies several ordered repeating sequences.
The FIXM XML schemas add an optional sequence number attribute to the
repeating elements in order to ensure that the order of a sequence is
always preserved, even after XSLT manipulation.

The sequence number should be a sequentially increasing integer with a
value beginning at zero. These sequence numbers are only meant for
ordering, not identification, purposes. As such, the set of sequence
numbers taken as a whole should always be contiguous. If an element were
removed from a sequence, the numbering in subsequent representations
should be reset to reflect this, not maintained so that a gap is formed.

### Example

```xml
<fx:desired>
  <fx:element seqNum="0">
    <!-- […] -->
  </fx:element>
  <fx:element seqNum="1">
    <!-- […] -->
  </fx:element>
  <!-- […] -->
</fx:desired>
```

---

## `DateTimeUTC` / `DateTimeUTCHighPrecision`

FIXM requires times to be expressed in UTC. A constraint is therefore placed on the FIXM classes used to represent date/time values that imposes the use of the trailing character `Z` to indicate UTC, in line with the W3C XSD specification.

Sub-second precision is considered unneeded for most aviation data, but other fields such as message timestamps can still benefit from higher precision date/times.

`FIXM Core 4.3.0` defines two types for representing date/time values, both restricting the standard XML dateTime:
- `DateTimeUtc` is constrained to only allow whole second precision. It is used for typing all aviation-related times, such as the actual time of arrival.
- `DateTimeUtcHighPrecision` employs unrestricted sub-second precision. It is used for typing the message timestamps in the FIXM Applications.

Examples: 
- For aviation-related times, *20th July 1969 at 20:18 UTC* is expressed as `1969-07-20T20:18:00Z`

```xml
<!--xmlns:fx="http://www.fixm.aero/flight/4.3"-->	
<fx:actualTimeOfArrival>
  <fx:time>1969-07-20T20:18:00Z</fx:time>
```

- For message timestamps, higher precision can be provided, as needed: `1969-07-20T20:18:00.458Z`

!> **Note to implementers:** The mapping of the XSD type `dateTime` to native structures in various development contexts is not always 1-1 and may exhibit a wide variety of difficulties depending on the tooling and runtime context. In particular, the trailing character `Z` indicating UTC may actually be stripped/omitted, leading to FIXM times being interpreted as local times instead of UTC times by some applications. FIXM implementers are therefore invited to crosscheck that their systems correctly interpret FIXM times as UTC time.

---

## `GloballyUniqueFlightIdentifier`

See [`gufi`]

---

## `HypertextReference`

See [Hypertext References]

[`gufi`]: general-guidance/fx_FlightData?id=gufi
[Hypertext References]: general-guidance/fb_AeronauticalReference?id=hypertext-references
