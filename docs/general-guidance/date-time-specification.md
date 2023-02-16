# Date/Time Specification

FIXM requires times to be expressed in UTC.

A constraint is placed on class *Base.Types.Time*, the class used to
represent all date/time values in FIXM, imposes the use of the trailing
character `Z` to indicate UTC, in line with the W3C XSD specification.

Example: 20th July 1969 at 20:18 UTC is expressed as `1969-07-20T20:18:00.000Z`

!> **Note to implementers:** The mapping of the XSD type `dateTime` to native structures in various development contexts is not always 1-1 and may exhibit a wide variety of difficulties depending on the tooling and runtime context. In particular, the trailing character `Z` indicating UTC may actually be stripped/omitted, leading to FIXM times being interpreted as local times instead of UTC times by some applications. FIXM implementers are therefore invited to crosscheck that their systems correctly interpret FIXM times as UTC time.
