# FF-ICE Message <=> Flight association

All flight data processing systems will use an algorithm to determine to which flight a 
received FF-ICE message should be associated. 

FF-ICE introduces the [`gufi`] as a unique identifier of the flight, assuming only one GUFI per flight is permitted.
In a stable, fully automated and well tested environment, it should be therefore sufficient to use only the [`gufi`] for 
associating FF-ICE Messages with flights. 

However, during the early implementation of FF-ICE and its flight planning procedures, the process of associating 
FF-ICE Messages with flights, although faciliated by the [`gufi`], may still involve several key fields, 
including the [`aircraftIdentification`], the [`departureAerodrome`], the [`estimatedOffBlockTime`] and the [`destinationAerodrome`]. 

The following table summarises the `FF-ICE Message` <=> `Flight` association rules.

| `aircraftIdentification` | `departureAerodrome` | `destinationAerodrome` | `estimatedOffBlockTime` (*) | Conclusion     |
| :-                       | :-                   | :-                     | :-                          | :-             |
| Different                | -                    | -                      | -                           | Mismatch       |
| Same                     | Different            | -                      | -                           | Mismatch       |
| Same                     | Same                 | Different              | -                           | Mismatch       |
| Same                     | Same                 | Same                   | Different                   | Mismatch       |
| Same                     | Same                 | Same                   | Same                        | Match          |

(*) Some flexibility may be employed in determining whether or not two `estimatedOffBlockTime` match. For example, if 
the two values differ by 29 min or less (the current requirement to indicate a delay to the `estimatedOffBlockTime` has a 
threshold of 30min) they may be considered as the same. Where ATFM procedures are applied the 
threshold may be less, typically 14 minutes. 

It is important to note that the key fields [`departureAerodrome`], [`destinationAerodrome`] and [`estimatedOffBlockTime`] may not always be 
fixed and may, for instance, be changed by a Flight Plan Update. FIXM enables the exchange of these key fields as they were previously 
(i.e. prior to the change) using fields suffixed `...Previous` ([`departureAerodromePrevious`], [`destinationAerodromePrevious`], [`estimatedOffBlockTimePrevious`]), 
so that traditional message/flight matching can still be performed, and also so that translation to an ATS message (e.g. CHG or DLA) remains possible.
For more information, see guidance for the [FficeFPU] message.

[`aircraftIdentification`]: general-guidance/fx_FlightData?id=aircraftidentification
[`gufi`]: general-guidance/fx_FlightData?id=gufi

[`departureAerodrome`]: general-guidance/fx_Departure?id=departureaerodrome
[`estimatedOffBlockTime`]: general-guidance/fx_Departure?id=estimatedoffblocktime
[`destinationAerodrome`]: general-guidance/fx_Arrival?id=destinationaerodrome
[`departureAerodromePrevious`]: general-guidance/fx_Departure?id=departureaerodromeprevious
[`estimatedOffBlockTimePrevious`]: general-guidance/fx_Departure?id=estimatedoffblocktimeprevious
[`destinationAerodromePrevious`]: general-guidance/fx_Arrival?id=destinationaerodromeprevious

[FficeFPU]: fixm-in-support-of-ffice/FficeFPU


