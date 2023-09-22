# Applying Templates in XML Messages

In order to apply a template to an XML message, the xsi:type attribute must be employed.

- This attribute allows the complex type of an element to be explicitly set within the XML document where it is used.
- Because the template type must be derived from the same underlying type that the element normally uses, this substitution will be valid.
- This is how the type of the message’s root element is set to that of the intended template even though the templates themselves don’t provide their own root elements.

This last part is of particular importance.  The templates exist as pure restrictions, adding no new fields at all - including a root XML element of the correct template-based complex type.  Therefore, the only way to access this type when using the template schemas is to employ the xsi:type attribute.  Failure to do so, even if you use the template schemas for validation, will result in a message that is just using the underlying schemas the templates restrict with no template enhancements.

The restricted complex types defined in the templates will require their sub-elements, as needed, to use their own restricted types from the template schemas.

- This chaining together of restricted types (starting from the root element) is the means by which templates are formed and their content enforced.
- Only the root element needs an explicit xsi:type - for a properly constructed template, each sub-element will have the appropriate type inherently applied based on its parent’s restricted type.

## Example of Incorrect Usage (Templates are not applied)

Below is a sample XML message showing a flawed attempt to apply an FF-ICE Flight Cancellation template. This message should fail schema validation because it incorrectly includes the `<flightRulesCategory>` element but, instead, it will pass schema validation.  Several key sections of the message are highlighted, with explanatory notes following the XML block explaining why this unexpected behavior occurs.
<pre><code class="language-xml">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
<mark>&lt;!-- Note 2 --&gt;</mark>
<mark>&lt;ffice:FficeMessage</mark> xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:ffice="http://www.fixm.aero/app/ffice/1.1" 
        xmlns:fb="http://www.fixm.aero/base/4.3" xmlns:fx="http://www.fixm.aero/flight/4.3" 
        xsi:schemaLocation="http://www.fixm.aero/app/ffice/1.1 
            <mark>file:///C:/schemas/applications/fficemessage/fficetemplates/flightcancellation/FlightCancellation.xsd"</mark>&gt; <mark>&lt;!-- Note 1 --&gt;</mark>
    <mark>&lt;ffice:flight&gt;</mark> <mark>&lt;!-- Note 3 --&gt;</mark>
        &lt;fx:arrival&gt;
            &lt;fx:destinationAerodrome&gt;
                &lt;fb:locationIndicator&gt;ABCD&lt;/fb:locationIndicator&gt;
            &lt;/fx:destinationAerodrome&gt;
        &lt;/fx:arrival&gt;
        &lt;fx:departure&gt;
            &lt;fx:departureAerodrome&gt;
                &lt;fb:locationIndicator&gt;DCBA&lt;/fb:locationIndicator&gt;
            &lt;/fx:departureAerodrome&gt;
            &lt;fx:estimatedOffBlockTime&gt;2023-05-21T01:15:00Z&lt;/fx:estimatedOffBlockTime&gt;
        &lt;/fx:departure&gt;
        &lt;fx:flightIdentification&gt;
            &lt;aircraftIdentification&gt;ABC1234&lt;/aircraftIdentification&gt;
            &lt;gufi codeSpace="urn:uuid" creationTime="2023-05-21T00:00:00Z" 
                namespaceDomain="FULLY_QUALIFIED_DOMAIN_NAME" 
                namespaceIdentifier="example.com"&gt;e30a7f6d-19c2-44da-b35d-e8bfd4e341ff&lt;/gufi&gt;
        &lt;/fx:flightIdentification&gt;
        <mark style='color:green'><b>&lt;fx:flightRulesCategory&gt;I&lt;/fx:flightRulesCategory&gt;</b></mark> <mark>&lt;!-- Note 4--&gt;</mark>
    &lt;/ffice:flight&gt;
    &lt;ffice:relevantAtmServiceProvider&gt;
        &lt;ffice:provider/&gt;
        &lt;ffice:providerType&gt;FFICE_PARTICIPANT&lt;/ffice:providerType&gt;
    &lt;/ffice:relevantAtmServiceProvider&gt;
    &lt;ffice:type&gt;FLIGHT_CANCELLATION&lt;/ffice:type&gt;
&lt;/ffice:FficeMessage&gt;
</code></pre>

1. This message references the correct template schema for a Flight Cancellation message, but no xsi:type is present to actually apply the template.
2. With no xsi:type in place, the `<FficeMessage>` element is still using the "FficeMessageType" complex type instead of the restricted "FficeFC_FficeMessageType".  As such, no template restrictions are being applied.
3. This, in turn, means the `<flight>` element is still using the complex type "FlightType".
4. And that means the inclusion of the `<flightRulesCategory>` element will be considered <b style='color:green'>valid</b> during schema validation.

## Example of Correct Usage (Templates are applied)

Again, validating against a template schema is not enough to apply a template.  You must make sure you type your root element correctly in order to apply the template.  Below is a second sample XML message that correctly applies an FF-ICE Flight Cancellation template.  Several key sections are again highlighted, with explanatory notes provided below.
<pre><code class="language-xml">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
<mark>&lt;!-- Note 2 --&gt;</mark>
<mark>&lt;ffice:FficeMessage</mark> xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:ffice="http://www.fixm.aero/app/ffice/1.1" 
        xmlns:fb="http://www.fixm.aero/base/4.3" xmlns:fx="http://www.fixm.aero/flight/4.3" 
        xsi:schemaLocation="http://www.fixm.aero/app/ffice/1.1 
            file:///C:/schemas/applications/fficemessage/fficetemplates/flightcancellation/FlightCancellation.xsd"
        <mark>xsi:type="ffice:FficeFC_FficeMessageType"&gt;</mark> <mark>&lt;!-- Note 1 --&gt;</mark>
    <mark>&lt;ffice:flight&gt;</mark> <mark>&lt;!-- Note 3 --&gt;</mark>
        &lt;fx:arrival&gt;
            &lt;fx:destinationAerodrome&gt;
                &lt;fb:locationIndicator&gt;ABCD&lt;/fb:locationIndicator&gt;
            &lt;/fx:destinationAerodrome&gt;
        &lt;/fx:arrival&gt;
        &lt;fx:departure&gt;
            &lt;fx:departureAerodrome&gt;
                &lt;fb:locationIndicator&gt;DCBA&lt;/fb:locationIndicator&gt;
            &lt;/fx:departureAerodrome&gt;
            &lt;fx:estimatedOffBlockTime&gt;2023-05-21T01:15:00Z&lt;/fx:estimatedOffBlockTime&gt;
        &lt;/fx:departure&gt;
        &lt;fx:flightIdentification&gt;
            &lt;aircraftIdentification&gt;ABC1234&lt;/aircraftIdentification&gt;
            &lt;gufi codeSpace="urn:uuid" creationTime="2023-05-21T00:00:00Z" 
                namespaceDomain="FULLY_QUALIFIED_DOMAIN_NAME" 
                namespaceIdentifier="example.com"&gt;e30a7f6d-19c2-44da-b35d-e8bfd4e341ff&lt;/gufi&gt;
        &lt;/fx:flightIdentification&gt;
        <mark style='color:red'><b>&lt;fx:flightRulesCategory&gt;I&lt;/fx:flightRulesCategory&gt;</b></mark> <mark>&lt;!-- Note 4 --&gt;</mark>
    &lt;/ffice:flight&gt;
    &lt;ffice:relevantAtmServiceProvider&gt;
        &lt;ffice:provider/&gt;
        &lt;ffice:providerType&gt;FFICE_PARTICIPANT&lt;/ffice:providerType&gt;
    &lt;/ffice:relevantAtmServiceProvider&gt;
    &lt;ffice:type&gt;FLIGHT_CANCELLATION&lt;/ffice:type&gt;
&lt;/ffice:FficeMessage&gt;
</code></pre>

1. This message correctly applies an xsi:type to the root element.
2. This changes the underlying type of `<FficeMessage>` to use the "FficeFC_FlightMessageType" complex type.
3. This, in turn, through the chaining of complex type restrictions in the template schemas, means the `<flight>` element will be evaluated using the "FficeFC_FlightType" complex type.
4. And that means that the inclusion of the `<flightRulesCategory>` element will be correctly flagged as <b style='color:red'>invalid</b> during schema validation.
