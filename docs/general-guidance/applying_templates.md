# Applying Templates in XML Messages

Applying a FIXM template is a straightfoward process that requires one important step in addition to using the template schemas for message construction and validation - correctly setting the type of the message's root element.

## Using the Built-In xsi:type Attribute

FIXM templates exist as pure restrictions, adding no new fields of their own.  This means the templates do not natively contain a root XML element that uses the correct template-based complex type.  Therefore, the only way to employ a template's complex types when using the template schemas is to make use of the xsi:type attribute.  

- This attribute allows the complex type of an element to be explicitly set within the XML document where it is used.
- This is how you can correctly set the type of the message’s root element to use the intended template even though the template schemas themselves don’t provide their own root elements of that type.

Failure to make use of the xsi:type attribute, even if you use the correct template schemas for validation, will result in a message that is just using the underlying schemas the templates restrict, with no template enhancements applied.

## Restriction Chaining

The restricted complex types defined in the templates will require, as needed, their sub-elements to use their own restricted types from the template schemas.

- This chaining together of restricted types (starting from the root element) is the means by which templates are formed and their content enforced.
- Only the root element needs an explicit xsi:type - for a properly constructed template, each sub-element will have the appropriate type inherently applied based on its parent’s restricted type.

As such, it should not be necessary to make use of the xsi:type attribute for every restricted element in a template (although doing so won't cause any problems other than an unecessary increase in message size).  Just applying the correct xsi:type to the root element should be sufficient.

## Example of Correct Usage (Templates are applied)

As noted above, validating against a template schema is not sufficient to actually apply a template.  You must make sure that you "type" your root element correctly in order for the template to be applied.  Below is a sample XML message that correctly applies an FF-ICE Flight Cancellation template.  Several key sections are highlighted, with explanatory notes linked to each section provided below.

1. This message references the correct template schema for a Flight Cancellation message as well as correctly applying an xsi:type to the root element.  These are the only actions that must be taken to apply a template but it is critical to do so.
2. Doing this changes the underlying type of the `<FficeMessage>` element to use the "FficeFC_FlightMessageType" complex type rather than the unrestricted "FlightMessageType".
3. This, in turn, through the chaining of complex type restrictions in the template schemas, means the `<flight>` element will be evaluated using the "FficeFC_FlightType" complex type rather than the unrestricted "FlightType".
4. And that means that the inclusion of the `<flightRulesCategory>` element will be correctly flagged as <b style='color:red'>invalid</b> during schema validation.

<pre><code class="language-xml">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
<mark>&lt;!-- Note 2 --&gt;</mark>
<mark>&lt;ffice:FficeMessage</mark> xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:ffice="http://www.fixm.aero/app/ffice/1.1" 
        xmlns:fb="http://www.fixm.aero/base/4.3" xmlns:fx="http://www.fixm.aero/flight/4.3" 
        xsi:schemaLocation="http://www.fixm.aero/app/ffice/1.1 
            <mark>file:///C:/schemas/applications/fficemessage/fficetemplates/flightcancellation/FlightCancellation.xsd"</mark>
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

## Example of Incorrect Usage (Templates are not applied)

Below is a second sample XML message that shows a flawed attempt to apply an FF-ICE Flight Cancellation template. This message should fail schema validation, like the previous message did, because it includes the `<flightRulesCategory>` element (which is not allowed in a Flight Cancellation message) but, instead, it will pass schema validation because the template will not actually be applied, leaving the message to validated against the unrestricted FficeMessage and Core schemas (which allow this element to be present).  Several key sections of the message are again highlighted, with notes explaining why this unexpected behavior occurs.

1. This message references the correct template schema for a Flight Cancellation message, but no xsi:type is present to actually apply the template.
2. With no xsi:type in place, the `<FficeMessage>` element is still using the unrestricted "FficeMessageType" complex type instead of the restricted "FficeFC_FficeMessageType".  As such, no template restrictions are being applied.
3. This, in turn, means the `<flight>` element is still using the unrestricted complex type "FlightType".
4. And that means the inclusion of the `<flightRulesCategory>` element will correctly but unexpectedly be considered <b style='color:green'>valid</b> during schema validation, removing this data correctness check along with any other benefits the template should have afforded this data exchange.

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
