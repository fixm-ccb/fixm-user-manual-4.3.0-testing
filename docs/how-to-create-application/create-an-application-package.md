# Create an Application Package

For this example, we will create a very simple Application that focuses
on arrival and departure alerts. It will include Application header
fields for message sender, recipient(s), timestamp, and alert type along
with two templates, one for arrival alerts and one for departure alerts.

1. Right click on the Applications container and choose “Add a
    Package…”.

    ![Choose “Add a Package…”](.//media/image56.png "Choose “Add a Package…”")

2. In the New Package dialogue box, change the *Name* field to
    something appropriate for your Application (in this example,
    “ExampleMessage”).

3. Select the *Create Diagram* radio button.

4. Then click OK.

    ![Click OK](.//media/image57.png "Click OK")

5. This will bring up a New Diagram dialogue box. In the *Type* section:

    a.  Choose “UML Structural” under *Select From*.

    b.  Choose “Class” under *Diagram Types*.

    Click OK to create the Application package and its associated diagram<sup><a href="#how-to-create-application/create-an-application-package?id=notes">[note 1]</a></sup>.

    ![Click OK](.//media/image58.png "Click OK")

## Apply Schema Stereotype

In order to generate XSD schemas in Sparx EA, each package that
corresponds to a schema file needs an XSDschema stereotype applied to
it. To add an XSDschema stereotype to your package:

1. Double click (or right click and choose “Properties…”) on your
    Application package (here called “ExampleMessage”) in Project
    Browser to open the Package dialogue box.

2. In the newly opened Package dialogue box, click on the “…” box next
    to *Stereotype* (near the top right corner) to open the Stereotype
    dialogue box.

3. In the newly opened Stereotype dialogue box, select “XSDschema” and
    then click OK.

4. Then click OK in the Package dialogue box to apply the stereotype.

    ![Click OK](.//media/image59.png "Click OK")

## Set Up Schema Properties

Once the stereotype is applied, you can configure your schema
properties, setting up a number of XSD details such as schema file name,
schema namespace, namespace prefixes, etc.

1. Once again, double click (or right click and choose “Properties…”)
    on your Application package in Project Browser. With the XSDschema
    stereotype applied, this should now open an XSD schema Properties
    dialogue box.

    ![Click OK](.//media/image60.png "Click OK")

2. Fill in values for your schema properties as appropriate for your
    Application. In this example, we will use the following values:

    a. *Target Namespace* set to: `http://www.fixm.aero/app/example/1.0` <sup><a href="#how-to-create-application/create-an-application-package?id=notes">[note 2]</a></sup>.

    b. *Prefix* set to: `xmg`<sup><a href="#how-to-create-application/create-an-application-package?id=notes">[note 3]</a></sup>.

3. You must also fill in the *Schema File* field with the path to your
    application directory and an appropriate file name. In this example,
    the following *Schema File* entry will be used:
    `.\schemas\applications\examplemessage\ExampleMessage.xsd`.

   ?> IMPORTANT NOTE: Sparx EA will not automatically create any of
   the directories for the path to the file specified in the *Schema
   File* field. **They must be created outside of Sparx EA before
   generating the schemas.** 
   
   FIXM is natively set up to generate its
   schema files under a directory named “schemas” that is located in the
   same directory as the Sparx EA file. To save time, rather than
   creating all of the directories needed by hand, you can instead:

    a. Copy the “schemas” directory you modified back in [Initial Download
    and Setup](how-to-create-application/initial-download-and-setup) into the directory where
    your Sparx EA file is located (in this example, the “uml”
    directory).

    b. Under the “applications” directory beneath the “schemas” directory,
    add another directory with a name appropriate for your Application
    (here “examplemessage” was used).

    In this example, this new “schemas” directory should be added to the
    “uml” directory and structured as shown below.

    ![`schemas` directory should be added to the `uml` directory and structured as shown](.//media/image61.png "`schemas` directory should be added to the `uml` directory and structured as shown")

4. With all of these fields filled out, your XSD schema Properties
    dialogue box should look something like below. Click OK to save
    these settings.

    ![Click OK to save these settings](.//media/image62.png "Click OK to save these settings")

## Add Schema Description and Tags

The final step in setting up your schema details is to add a description
for your package and adjust the schema configuration settings that are
controlled in Sparx EA via tagged values.

1. Once more, double click (or right click and choose “Properties…”) on
    your Application package in Project Browser and then click the UML
    button (near the top right corner). This will bring you back to your
    Package dialogue box.

2. In the central text box, fill in a description of your Application
    package. The text entered here will also show up as a documentation
    element in your schema file.

3. Next, click on the *Tags* tab (near the lower right hand corner) to
    add three tags used by Sparx EA when creating your schema files:
    attributeFormDefault, elementFormDefault, and version.

    a. FIXM standardly sets attributeFormDefault to “unqualified”.

    b. FIXM standardly sets elementFormDefault to “qualified”.

    c. Version should be set as appropriate for your Application (`1.0.0` in this example).

    To add these tags, click on the third icon from the left ![icon](.//media/image63.png ':size=4%') in the *Tags* tab and fill in the *Tag* and *Value* fields similar to
    what is shown below.

    ![Tagged Value](.//media/image64.png)
    ![Tagged Value](.//media/image65.png)
    ![Tagged Value](.//media/image66.png)

4. When finished, your Package dialogue box will look something like
    below. Click OK to save these settings.

    ![Package dialogue box](.//media/image67.png)

## Notes

[1]: Note that a package in Sparx EA can have more than one associated diagram.  To date, FIXM products have only created one diagram per package, though.

[2]: Though FIXM tends to use namespaces that look like URLs, the namespace value do not need to resolve to an actual location on the Internet.  The namespace is just a field used to resolve naming collisions between schemas and should, therefore, be distinctive enough to ensure a reasonably high chance it is not used by another schema.

[3]: This example used “xmg” but the prefix can be set to any value that makes sense in the context of your Application.  Because it will be used throughout your generated schemas, a short prefix is typically preferred.
