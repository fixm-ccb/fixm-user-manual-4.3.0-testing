# General rules for data correctness

?> The table below compiles an initial set of business rules 
identified in the GENERAL GUIDANCE part, or already
captured in the FIXM Core model as model element notes. This table will be 
gradually enriched based on implementers’ feedback. Submit new rules using the [*Contact Us*](https://www.fixm.aero/content/contact.pl?category=Technical&version=Other&versionOther=FIXM%20User%20Manual&details=Describe%20proposed%20content%20here) form. 

?> The overall formulation and description method for
the business rules below may be also revisisted, in particular in the light of the [AIXM experience with
regards to business rules](http://aixm.aero/page/business-rules). 
In particular, the use of Schematron, which is a validation language capable of handling business rules that an XML schema alone cannot
provide, may be a candidate means to enforce the business rules below.


<table>
<thead>
<tr class="header">
<th><strong>FIXM model element</strong></th>
<th><strong>Business rule description</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>GeograhicalPosition</td>
<td>When encoding geographical positions, special values INF, -INF and NaN are not allowed.</td>
</tr>
<tr class="even">
<td><p>ContactInformation,</p>
<p>PersonOrOrganization</p></td>
<td>If the usage of ContactInformation is associated with a person, the ContactInformation.name field should not be used and the PersonOrOrganization.name should be used instead.</td>
</tr>
<tr class="odd">
<td>PostalAddress</td>
<td>The countryName shall always be populated with the full name, not an ISO 3166 abbreviation.</td>
</tr>
<tr class="even">
<td>PostalAddress</td>
<td>CountryCode shall always be populated using an ISO 3166 abbreviation.</td>
</tr>
<tr class="odd">
<td>OnlineContact</td>
<td>If OnlineContact.network.type=INTERNET, the OnlineContact.linkage shall be expressed as a valid URL.</td>
</tr>
<tr class="even">
<td>OnlineContact</td>
<td>If OnlineContact.network.type=AFTN, the OnlineContact.linkage shall be expressed as a valid AFTN address.</td>
</tr>
<tr class="odd">
<td>AerodromeReference</td>
<td>The locationIndicator shall be a valid code provided by ICAO Doc 7910.</td>
</tr>
<tr class="even">
<td>VerticalRange</td>
<td>The lowerBound shall always be lower than the upperBound.</td>
</tr>
<tr class="odd">
<td>TrueAirspeedRange</td>
<td>The lowerSpeed shall always be lower than the upperSpeed.</td>
</tr>
<tr class="even">
<td>TimeRange</td>
<td>The earliest time shall always be before the latest time.</td>
</tr>
<tr class="odd">
<td>Aircraft</td>
<td>The property formationCount, if provided, shall be equal to or greater than 2.</td>
</tr>
<tr class="odd">
<td>OnlineContact</td>
<td>The OnlineContact.network shall be always populated when providing an OnlineContact.linkage.</td>
</tr>
</tbody>
</table>


