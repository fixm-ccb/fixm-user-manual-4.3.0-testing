# Apache Axis library and the WSDL2Java tool

The Apache Axis library provides the WSDL2java tool, which can interpret
WSDL files. Axis1 and Axis2 versions were tested.

Before running the WSDL2Java tool required two questions needed to be
answered:

**Which data binding parameter option to pass to it?**

Two data binding options, ADP and JAXBRI, were tested. These options
provide two different approaches when interpreting schemas to create
data models in JAVA.

ADP uses its own Axis1 based parsing tool. Supports limited validation
but no range checking

JAXBRI uses JAXB as a parsing tool. Utilize JAXB for schema validation
in the code. It does not support parameter testing but
does support limited field checking i.e. ‘Required’ versus ‘Optional’

**Where to Run It?**

***Option 1 –Through an IDE using an Axis plugin***

The IDE used did not have a deciding impact on the results. However,
they did determine the Data Binding option selected. Developers cannot
specify the data binding through the IDE as the IDE interacts with the
WSDL2Java tool at the backend. IDEs are Axis1 based and run WSDL2Java
with the default data binding option ADP.

For this option, the only variant is the WSDL2Java tool version (i.e.
Axis1 or Axis2) as the data binding option remains the same therefore

***Option2 – From the command-line***

For this approach, testing focused on the Axis2 version only as Axis1
failed to generate any code through the IDEs.

Developers can specify the data binding option from the command-line
when executing WSDL2Java command.

Both options were tested i.e. ADP and JAXBRI.

For this option, the only variant was the data binding option, as the
WSDL2Java tool version remains the same.

**Note**: Testing of the JAXBRI data binding was carried out for the
command-line option only.
