# Getting Started


1.	**Download the latest FIXM core release from http://fixm.aero.**   
    - The version used for the code examples shown are based on version FIXM Core 4.3.0 and FF-ICE Message 1.1.0.  
    - Extract the FIXM ZIP file to a local file folder.
    
2.	**Development Tools**   
    This guide is based on the following tools and versions.  Download, install, and configure these tools
    - Java 11+
    - Apache Tomcat 8.5.49
    - Apache Axis2 1.8.0 (axis2 Only!)
    - Apache Ant 1.10.7
    - Junit (optional) if you plan to run the auto-generated test
    - Eclipse  (optional)  
    - Any IDE of choice is also fine
    - SOAPUI (optional)
    - Postman (optional)
    
3.	**Configure the following environment variables prior to development:**
    - JAVA_HOME
    - CATALINA_HOME
    - AXIS2_HOME
    - ANT_HOME
    
**Note:**    
It is recommended to verify that a sample axis2 web service, that was built as both SOAP as well as REST, can be built and run successfully prior to working through a FIXM project.
The evaluation process included the following components:
