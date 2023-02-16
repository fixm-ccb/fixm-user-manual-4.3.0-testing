# Contact Information

![Image](.//media/image24.png")

## Online Contact

In FIXM, the online contact information can include an email address
and/or a network address.

A network address is always formed of two pieces of information: the
**linkage** and the **network** information.

- The former captures the expression of the network address. This is
    supported by property `OnlineContact.linkage`.

- The latter captures the network on which the address is valid. This
    is supported by property `OnlineContact.network`.

Property `OnlineContact.network` provides a choice between predefined
network types and free text. Network information should be preferably
encoded using the property `NetworkChoice.type` populated with the
applicable enumerated value from enumeration `TelecomNetworkType`. If none
of the enumerated values is suitable, the property `NetworkChoice.other`
shall be used. The ATM Information Reference Model provides additional
telecom network types that should be used for populating
`NetworkChoice.other`, as appropriate. These additional AIRM values are
available [here](http://airm.aero/viewer/1.0.0/logical-model/CodeTelecomNetworkType.html).

The type of network affects the format of the linkage information.

- When the network is `INTERNET`, the linkage should be a resolvable URL

- When the network is `AFTN`, the linkage should be a valid AFTN address

### Examples

The following example illustrates contact information formed of an email
address and an Internet address expressed as a resolvable URL.

```xml
<fb:onlineContact>
     <fb:email>fixm.secretariat@eurocontrol.int</fb:email>
     <fb:linkage>https://www.fixm.aero/content/contact.pl</fb:linkage>
     <fb:network>
          <fb:type>INTERNET</fb:type>
     </fb:network>
</fb:onlineContact>
```

The following example illustrates contact information formed of an AFTN
address. The example features the EUROCONTROL NM ‘AFTN address’ for
Flight Plan Message Submission to IFPS (FP1 - Brussels (Haren)).

```xml
<fb:onlineContact>
     <fb:linkage>EUCHZMFP</fb:linkage>
     <fb:network>
          <fb:type>AFTN</fb:type>
     </fb:network>
</fb:onlineContact>
```

The following example illustrates contact information formed of a SITA
address. `SITA` is not a value captured in FIXM enumeration
`TelecomNetworkType` but is part of the reference ATM vocabulary provided
by the AIRM (AIRM codelist
[`CodeTelecomNetworkType`](http://airm.aero/viewer/1.0.0/logical-model/CodeTelecomNetworkType.html)).
The example features the EUROCONTROL NM SITA address for Flight Plan
Message Submission to IFPS (FP1 - Brussels (Haren)).

```xml
<fb:onlineContact>
     <fb:linkage>BRUEP7X</fb:linkage>
     <fb:network>
          <fb:other>SITA</fb:other>
     </fb:network>
</fb:onlineContact>
```
