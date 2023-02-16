# Evaluation Environment

The evaluation process included the following components:

1. **FIXM Schemas**

    a.  FIXM Core 4.2.0

    b.  FF-ICE Message 1.0.0 (with restrictions)

2. **WSDL file**

    Two WSDL files were tested

    a.  The first file contained FIXM schema details that contained no restrictions.

    b.  The second filed contained FIXM schema details that contained restrictions.

3. **FlightPlanningService Web Service**

    The FIXM test web service being evaluated here is called *FlightPlanningService*, which supports one operation called *submitFlightPlan*. Developer can issue a submitFlightPlan remote request, as either a REST or SOAP call, to the FIXM *FlightPlanningService* and receive a submission response from the Service.

    This is a very basic web service to test the sending of minimal flight plan XML via SOAP to a server in an attempt to get a web service SubmissionResponse. Testing focused mainly on Java based client and server.

Various tools were evaluated for their ability to interpret the FIXM WSDL file to produce the FIXM server and client Java code. The Apache Axis library and the WSDL2Java tool were found to provide the most success.

## Example WSDL (FIXM Schema with Restrictions)

  ![Image](.//media/image249.png)
