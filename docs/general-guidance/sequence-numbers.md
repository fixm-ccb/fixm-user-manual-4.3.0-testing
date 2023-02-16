# Sequence numbers

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

## Example

```xml
<fx:filed>
  <fx:element seqNum="0">
    <!-- […] -->
  </fx:element>
  <fx:element seqNum="1">
    <!-- […] -->
  </fx:element>
  <!-- […] -->
</fx:filed>
```
