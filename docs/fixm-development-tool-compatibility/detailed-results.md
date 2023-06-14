# Detailed Results

## Approach 1: FIXM Schema

### FIXM Source Code Generation
<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Utility</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>JAVA</td>
<td>JAXB</td>
<td>Jakarta xjc</td>
<td>3.0.0</td>
<td>PASSED</td>  
</tr>
<tr class="even">
<td>c#</td>
<td>.NET</td>
<td>xsd.exe</td>
<td>4.9.3928</td>
<td>PASSED</td>  
</tr>
</tbody>
</table>

### Rest Endpoint Generation

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>JAVA</td>
<td>JAVA JDK</td>
<td>REST</td>
<td>Java JDK 11+</td>
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>C#</td>
<td>.NET Webservices</td>
<td>REST</td>
<td>4.9.3928</td>
<td>PASSED</td>  
</tr> 
</tbody>
</table>

### Rest Client Generation

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>JAVA</td>
<td>JAVA JDK</td>
<td>REST</td>
<td>Java JDK 11+</td>
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>C#</td>
<td>.NET Webservices</td>
<td>REST</td>
<td>4.9.3928</td>
<td>PASSED</td>  
</tr> 
</tbody>
</table>


### Use of Automated Client

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Tool</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="2">JAVA</td>
<td>Postman</td>
<td>SOAP,REST</td>
<td>9.21.2</td>
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>SoapUI</td>
<td>N/A</td>
<td>5.7.0</td>
<td>PASSED</td>  
</tr>  
<tr class="even">
<td rowspan="2">C#</td>
<td>Postman</td>
<td>SOAP,REST</td>
<td>9.21.2</td>
<td>PASSED</td>  
</tr> 
<tr class="even">
<td>SoapUI</td>
<td>N/A</td>
<td>5.7.0</td>
<td>PASSED</td>  
</tr>  
</tbody>
</table>



## Approach 2: FIXM TEST WSDL

### FIXM Source Code Generation
<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>AXIS Version</strong></th>  
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Utility</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="4">JAVA</td>
<td>AXIS 1</td>
<td>WSDL2Java</td>
<td>ADP</td>
<td>End-Of-Life’d</td> 
<td>OUT OF SCOPE</td>  
</tr>
<tr class="even">
<td>AXIS 1</td>
<td>WSDL2Java</td>
<td>JAXBRI</td>
<td>End-Of-Life’d</td> 
<td>OUT OF SCOPE</td>  
</tr>
<tr class="odd">
<td>AXIS 2</td>
<td>WSDL2Java</td>
<td>JAXBRI</td>
<td>1.8.0</td> 
<td>PASSED</td>  
</tr>
<tr class="even">
<td>AXIS 2</td>
<td>WSDL2Java</td>
<td>ADB</td>
<td>1.8.0</td> 
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>C#</td>
<td>.NET</td>
<td>WSDL.exe</td>
<td>N/A</td>
<td>4.9.3928</td> 
<td>PASSED</td>  
</tr>
</tbody>
</table>

### FlightPlanningService Generation

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Web Server</strong></th>
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Build Method</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="3">JAVA</td>
<td rowspan="2"> Tomcat 8.5.4.9</td>
<td rowspan="2"> AXIS 2 </td>
<td>Apache Ant</td>
<td>SOAP, REST</td>  
<td>1.10.7 w/ Java JDK 11+</td>  
<td>PASSED</td>  
</tr>
<tr class="odd">
  <td>JAX-WS</td>
  <td>SOAP</td>
  <td>3.3.13</td>
  <td>FAILED</td>
</tr>
<tr class="odd">
<td>Apache CXF</td>
<td>CXF library</td>
<td>CXF Project (Using Eclipse IDE)
<td>SOAP</td>
<td>3.5.3</td>
<td>FAILED</td>
</tr> 
<tr class="even">
<td>C#</td>
<td>.NET Webservices</td>
<td>WSDL.exe</td>
<td>N/A</td>
<td>SOAP, REST</td>
<td>4.9.3928</td>
<td>PASSED</td>
</tr> 
</tbody>
</table>

### FlightPlanningService Client Generation

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Library</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>JAVA</td>
<td>JAVA JDK</td>
<td>SOAP, REST</td>
<td>Java JDK 11+</td>
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>C#</td>
<td>.NET</td>
<td>SOAP, REST</td>
<td>4.9.3928</td>
<td>PASSED</td>  
</tr> 
</tbody>
</table>


### Use of Automated Client

<table>
<thead>
<tr class="header">
<th rowspan="2"><strong>Language</strong></th>
<th rowspan="2"><strong>Tool</strong></th>
<th rowspan="2"><strong>Protocol</strong></th>
<th colspan="2"><strong>FIXM Core v4.3.0 / FF-ICE Message v1.1.0</strong></th>
</tr>

<tr class="header">
<th><strong>Version</strong></th>
<th><strong>Result</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="2">JAVA</td>
<td>Postman</td>
<td>SOAP,REST</td>
<td>9.21.2</td>
<td>PASSED</td>  
</tr>
<tr class="odd">
<td>SoapUI</td>
<td>N/A</td>
<td>5.7.0</td>
<td>PASSED</td>  
</tr>  
<tr class="even">
<td rowspan="2">C#</td>
<td>Postman</td>
<td>SOAP,REST</td>
<td>9.21.2</td>
<td>PASSED</td>  
</tr> 
<tr class="even">
<td>SoapUI</td>
<td>N/A</td>
<td>5.7.0</td>
<td>PASSED</td>  
</tr>  
</tbody>
</table>
