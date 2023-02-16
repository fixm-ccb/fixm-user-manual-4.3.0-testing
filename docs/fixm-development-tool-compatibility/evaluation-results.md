# Evaluation Results

## Definitions

### Pass Outcome

Succeeded in generating compilable and runnable FIXM server and client
code. The process to achieve this may or may not have required
additional coding.

### Failed Outcome

Failed in generating compilable and runnable FIXM server and client
code. No additional workarounds were available or the amount of coding
needed made the solution impractical.

## Pass Outcomes

1. Axis2 WSDL2Java tool executed from the IntelliJ IDE

    - With IDE’s default data binding ADP

        - FIXM schema with no restrictions – passed with no additional
            work.

        - FIXM schema with restrictions - required additional coded fixups
            to produce compilable code.

2. Axis2 WSDL2Java tool executed from the command-line

    - With data binding ADP

        - FIXM schema with no restrictions - passed with no additional
        work.

        - FIXM schema with restrictions - required additional coded fixups
        to produce compilable code.

    - With data binding JAXBRI

        - FIXM schema with no restrictions - passed with no additional
        work.

        - FIXM schema with restrictions - passed with no additional work.

<table>
<thead>
<tr class="header">
<th><strong>Tool</strong></th>
<th><strong>IDE</strong></th>
<th><strong>Command-Line</strong></th>
<th><strong>No Restrictions</strong></th>
<th><strong>With Restrictions</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Axis2 WSDL2Java with ADP Data Binding</td>
<td>IntelliJ</td>
<td>N/A</td>
<td>Passed</td>
<td><p>Passed with Code Fix-Ups</p>
<ul>
<li><p>Add missing objects that failed to get auto generated.</p></li>
<li><p>Modify Time Type Handler code to accept FIXM date formatting.</p></li>
</ul></td>
</tr>
<tr class="even">
<td>Axis2 WSDL2Java with ADP Data Binding</td>
<td>N/A</td>
<td>Yes</td>
<td>Passed</td>
<td><p>Passed with Code Fix-Ups</p>
<ul>
<li><p>No Missing objects but cleanup required.</p></li>
<li><p>Modify Time Type Handler code to accept FIXM date formatting.</p></li>
</ul></td>
</tr>
<tr class="odd">
<td>Axis2 WSDL2Java with JAXBRI Data Binding</td>
<td>N/A</td>
<td>Yes</td>
<td>Passed</td>
<td>Passed – No Fixups needed</td>
</tr>
</tbody>
</table>

The results indicate that executing the Axis2 version of the WSDL2Java
tool from the command-line and supplying the JAXBRI binding option
resulted in the greatest success, as it required no additional coding
fix-ups to generate a compilable server and client.

## Failed Outcomes

1. Axis1 WSDL2Java tool executed from the IntelliJ IDE with ADP data
    binding

    - Failed for FIXM schema with and without restrictions

2. Axis1 WSDL2Java tool executed from the Eclipse IDE with ADP data
    binding

    - Failed for FIXM schema with and without restrictions

3. Apache CXF in Eclipse

    - CXF failed completely for FIXM schema with and without restrictions.

4. JAX-WS in Eclipse (using NetBeans)

    - Passed for FIXM schema with no restrictions. Failed for schema with
    restrictions.

5. Glassfish/JAX-WS on IntelliJ IDE

    - Passed for FIXM schema with no restrictions. Failed for schema with
    restrictions.

<table>
<thead>
<tr class="header">
<th><strong>Tool</strong></th>
<th><strong>IDE</strong></th>
<th><strong>Command-Line</strong></th>
<th><strong>No Restrictions</strong></th>
<th><strong>With Restrictions</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Axis1 WSDL2Java with ADP Data Binding</td>
<td>IntelliJ</td>
<td>N/A</td>
<td>Failed</td>
<td>Failed</td>
</tr>
<tr class="even">
<td>Axis1 WSDL2Java with ADP Data Binding</td>
<td>Eclipse</td>
<td>N/A</td>
<td>Failed</td>
<td>Failed</td>
</tr>
<tr class="odd">
<td>Apache CXF</td>
<td>Eclipse</td>
<td>N/A</td>
<td>Failed</td>
<td>Failed</td>
</tr>
<tr class="even">
<td>JAX-WS</td>
<td>Eclipse<br />
(using NetBeans)</td>
<td>N/A</td>
<td>Passed</td>
<td>Failed</td>
</tr>
<tr class="odd">
<td>Glassfish/JAX-WS</td>
<td>IntelliJ</td>
<td>N/A</td>
<td>Passed</td>
<td>Failed</td>
</tr>
</tbody>
</table>
