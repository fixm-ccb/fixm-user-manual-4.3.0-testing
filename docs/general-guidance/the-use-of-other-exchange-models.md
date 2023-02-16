# The use of other exchange models

*An information exchange model is designed to enable the sharing of
information in a digital format within a specific domain*<sup><a href="#general-guidance/the-use-of-other-exchange-models?id=notes">[note 1]</a></sup> (e.g. AIXM
for the aeronautical information domain or FIXM for the flight
information domain). However, some ATM operations may require ATM
information to be treated and exchanged in a more interrelated way. For
example, a single traffic flow management message may include both
airspace geometries (aeronautical information domain) as well as
information about the flights passing through them (flight information
domain).

Satisfying these cross-cutting information needs can be done in
different manners. Combining data from existing information exchange
models (e.g. AIXM and FIXM) is one approach. This document briefly
touches on two possible options for doing so in an attempt to aid FIXM
users wishing to create multi-model data exchanges.

## Correlation references

The first option to consider is breaking down a multi-model data
transmission into separate messages for each involved exchange model.
These messages are supplemented with correlation references to all other
component messages of the overall multi-model transmission. Supplying a
list of unique message identifiers for each entry in the message group
should be sufficient. This lets an end user know that such a message
should not be processed alone and which other messages are intended to
accompany it. Message identifiers and references can likely be handled
by the data exchange’s messaging layer without the need to modify the
exchange models themselves to accommodate this approach. However, the
end user must perform the correlation work themselves. This would
include creating procedures for how to handle a situation where only a
subset of a message group is received.

## Correlation models

The second option to consider is creating a new model that provides
direct references within itself to the required exchange models – thus
allowing multiple models to be used together in a single data
transmission. This approach frees end users from the burden of
correlating messages (and the associated dangers of partial data loss).
However, this approach cannot be as easily leveraged by systems already
capable of handling the underlying exchange models used. The new model
must first be created and incorporated into the systems that transmit
and receive this data.

## Notes

[1]: From draft Volume I of the ICAO Manual on SWIM (ICAO Doc 10039)<sup>[[10]](#references)</sup>

## References

[10]: ICAO Doc 10039: Manual on System Wide Information Management (SWIM) Concept
