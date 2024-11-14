# Rules for Absent Data

FIXM supports the representation of fields that are explicitly absent or
that are deleted. It does so by leveraging the XSD specification for
Elements which includes the `nillable` attribute. This `nillable`
attribute specifies whether an explicit null value can be assigned to
the element. When nillable is set to `true` in the element definition,
this in turn enables an instance of the element to have the built-in nil
attribute with a value set to `true`. Example:

```xml
<xs:complexType name="FlightType">
     [...]
     <xs:element name="dangerousGoods" type="fx:DangerousGoodsType" nillable="true" [...]>
     [...]
</xs:complexType>
```

```xml
<fx:Flight>
      <fx:dangerousGoods xsi:nil="true"/>
</fx:Flight>
```

FIXM does not support the exchange of a “nil reason” to explain why an
element is nil. The interpretation of a nil element therefore depends on
the context of the information exchange:

-   A nil element included in an FF-ICE Flight Plan Update message will
    indicate that this flight plan data item is to be deleted. This
    interpretation is dictated by the FF-ICE Implementation Guidance
    Manual <sup>[[I-06]](#references)</sup> which states the following:

> *6.4.3.6 A Flight Plan Update is only required to contain those items
> that have changed (in addition to the mandatory items specified for an
> Update message), i.e. it is not necessary to resend complete flight
> data. Data items that were included in the previous version of the
> flight plan and have not been included in the Flight Plan Update will
> remain unchanged. This means that a mechanism is required to identify
> when a flight plan data item is to be deleted.*

<ul>This use of nil is only appropriate for non-repeating elements. As 
     explained in the Implementation Guidance, repeating elements must 
     be updated as a group rather than modifying or deleting individual
     components:</ul>

> *6.4.3.9 Individual elements within a repeating sequence of elements 
> such as those found within a route/trajectory group or a climb/descent 
> performance profile cannot be modified or deleted. The entire group 
> must be updated as required.*

<ul>Though not stated explicitly in the Implementation Guidance, this 
     also applies to elements found under choice structures. That is,
     elements under a choice structure do not need to be nilled out 
     and replaced. When a choice structure is received as part of an 
     update, it replaces the previous entry entirely.</ul>

-   A nil element included in an FF-ICE Flight Data Response Message
    will indicate that the data item is explicitly declared as not
    available to the flight data requestor.

Future FIXM versions may support the exchange of an additional “nil
reason” attribute, if the need for it is identified by the FIXM
Community.

## Declaring Null Measures and Geographical Position

The FIXM Measures types enforce the provision of the “uom” attribute
together with the numeric value of the measure. Likewise, the FIXM
Geographical Position type enforces the provision of the `srsName`
attribute `urn:ogc:def:crs:EPSG::4326` together with the position. This
design guarantees that the required unit of measure and coordinate
reference system are always provided in order to enable the correct
interpretation of measures and positions. However, it requires a special
workaround when null values are to be exchanged.

The provision of a null value for a measure or a position still requires
the mandatory attribute `uom` or `srsName` to be provided, even if
meaningless.

!> For instance, the following XML data would NOT validate
against the FIXM Core schema, because the uom for a Mass is missing.

```xml
<fx:desired>
  <fx:takeoffMass xsi:nil="true"/>
</fx:desired>
```

Therefore, the following rules apply when declaring null Measures or
Geographical Position.

When a measure is to be declared null,

-   Information provider side: Provide a fake uom in order to ensure
    proper schema validation

-   Information consumer side: Ignore the fake uom provided together
    with the null measure

When a geographical position is to be declared null:

-   Information provider side: Provide the srsName
    `urn:ogc:def:crs:EPSG::4326` in order to ensure proper schema
    validation

-   Information consumer side: Ignore the provided srsName provided
    together with the null position.

### Example of Valid Null Measure Declaration with a Fake UOM to be Ignored:

```xml
<fx:desired>
  <fx:takeoffMass xsi:nil="true" uom="KG"/>
</fx:desired>
```

## References <!-- {docsify-ignore} -->

### ICAO References

[I-06]: [ICAO Doc 9965, 2nd Edition, Volume II, v0.993 (DRAFT)](https://portal.icao.int/atmrpp/ATMRPP5%20Montreal%2059%20June%202023/1_Working%20papers/ATMRPP5_WP1000_Appendix%20C%20Doc%209965%20Vol%20II%20Implementation%20Guidance%20d0.993_markup.pdf) - Manual on FF-ICE, FF-ICE/R1 Implementation Guidance Manual **DRAFT** 
