# Generating Schemas from the Logical Model

The FIXM models are heavily annotated with stereotypes that allow Sparx
Enterprise Architect (EA) to convert the logical model into XML schema
files. This section describes how to invoke XSD generation in Sparx
EA<sup><a href="#how-to-generate-xml-schemas/generating-schemas-from-the-logical-model?id=notes">[note 1]</a></sup>
.

1. Open the .eap file that contains the Logical Model you would like to
    build.

2. Select the component of the model you would like to build in Project
    Browser<sup><a href="#how-to-generate-xml-schemas/generating-schemas-from-the-logical-model?id=notes">[note 2]</a></sup>. For this example, we will be building FIXM Core (model
    available at
    <https://fixm.aero/releases/FIXM-4.2.0/FIXM_Core_v4.2.0.eap>).

3. Right click on the chosen component (in this example, “Core”) and
    select “Code Engineering” and then “Generate XML Schema…”.

    ![Image](.//media/image230.png)

4. This brings up the Generate XML Schema dialogue box. There are a
    number of configuration options available in this dialogue box that
    should be set as follows:

    a.  *Encoding*: Set to Unicode (UTF-8)

    b.  *XSD Style*: No options checked.

    c.  *Referenced Package Options*: No options except “Use relative-path to reference XSDs” checked.

    d.  *Child Package Options*: “Generate XSD for Child packages” checked and “Include &lt;XSDschema&gt; packages” radio button selected. Also, all packages you want to build (typically all packages listed) checked.

    When finished, your dialogue box should look similar to below.

    ![Image](.//media/image231.png)

    As you can see from the list of schema locations under the *Filename* heading, FIXM is natively set up to generate its schema files into a directory named “schemas” that is located in the same directory as the .eap file itself. Sparx EA will not automatically create any of the directories for the path to the files specified in the *Filename* fields. **They must be created outside of Sparx EA before generating the schemas.** The paths shown in the *Filename* fields should give you guidance as to the required directory structure.

5. Ensure proper directory structure is in place to hold the generated
    schema files.

    For this example, the following directory structure must be placed in the same directory as the .eap file before attempting to generate the schemas.

    ![Image](.//media/image232.png)

    This structure could be created by hand or, to save time, you could copy the “schemas” directory from an appropriate FIXM release, editing it as needed if you are building a logical model with custom content.

    One final note on this topic: at times EA does not appear to recognize directories created during an open session. As such, it might be best to close and then reopen the logical model after the appropriate directory structure has been created to ensure Sparx EA will have access to it.

6. With the configuration options set and the schema directories in
    place, click the Generate button to produce the physical model.

    ![Image](.//media/image233.png)

    The Progress section of the dialogue box will show each package being built and will eventually display “Schema Generation Complete” when finished. There should be no error or warning messages displayed during this process.

## Notes

[1]: The FIXM development team uses Sparx Systems Enterprise Architect version 13.5, build 1352 for all development work.  
  
[2]: This could be the root package of an entire FIXM product (for example, the Core package or the FficeMessage package under Applications) or a particular sub-section or individual sub-package (for example, the Base package under Core or the EnRoute package under Flight) of a FIXM product.  
