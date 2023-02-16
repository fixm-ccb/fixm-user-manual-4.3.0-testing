# Create an Extension Root Package

With your Extensions container in place, you can now create and
configure the root package for your Extension.

1. Right click on the newly created Extensions container and once again
    choose “Add a Package…”.

2. In the New Package dialogue box, change the *Name* field to
    something appropriate to your Extension (here we used “Example”),
    select the *Package Only* radio button, and then click OK.

    ![Image](.//media/image201.png)

## Apply Schema Stereotype

In order to generate XSD schemas in Sparx EA, each package that
corresponds to a schema file needs an XSDschema stereotype applied to
it. To add an XSDschema stereotype to your package:

1. Double click (or right click and choose “Properties…”) on your
    Extension package (here called “Example”) in Project Browser to open
    the Package dialogue box.

2. In the newly opened Package dialogue box, click on the “…” box next
    to *Stereotype* (near the top right corner) to open the Stereotype
    dialogue box.

3. In the newly opened Stereotype dialogue box, select “XSDschema” and
    then click OK.

4. Then click okay in the Package dialogue box to apply the stereotype.

    ![Image](.//media/image202.png)

## Set Up Schema Properties

Once the stereotype is applied, you can configure your schema
properties, setting up a number of XSD details such as schema file name,
schema namespace, namespace prefixes, etc.

1. Once again, double click (or right click and choose “Properties…”)
    on your Extension package in Project Browser. With the XSDschema
    stereotype applied, this should now open an XSD schema Properties
    dialogue box.

    ![Image](.//media/image203.png)

2. Fill in values for your schema properties as appropriate for your
    Extension. In this example, we will use the following values:

    a.  *Target Namespace* set to: `http://www.fixm.aero/ext/example/1.0`<sup><a href="#how-to-create-fixm-extension/create-an-extension-root-package?id=notes">[note 1]</a></sup>.

    b.  *Prefix* set to: `xmp`<sup><a href="#how-to-create-fixm-extension/create-an-extension-root-package?id=notes">[note 1]</a></sup>.

3. You should also specify additional namespace prefixes for any
    packages your Extension will import. In this example, we will be
    importing Base and Flight from Core as well as BasicMessage. This
    step is accomplished by:

    a.  Clicking “New” to open a Namespace Details dialogue box.

    b.  Filling in appropriate details for each namespace to be included.

    c.  Then clicking OK.

    See below for examples showing how each Namespace Details dialogue box should be filled in.

    ![Image](.//media/image204.png)

    ![Image](.//media/image103.png)

    ![Image](.//media/image104.png)

4. Finally, you must fill in the *Schema File* field with the path to
    your extension directory and an appropriate file name. In this
    example, the following *Schema File* entry should be used:
    `.\schemas\extensions\example\Example.xsd`.

    ?> IMPORTANT NOTE: Sparx EA will not automatically create any of the directories for the path to the file specified in the *Schema File* field. **They must be created outside of Sparx EA before generating the schemas.** FIXM is natively set up to generate its schema files under a directory named “schemas” that is located in the same directory as the Sparx EA file. To save time, rather than creating all of the directories needed by hand, you can instead:

    a.  Copy the “schemas” directory from the FIXM release you started with into the directory where your Sparx EA file is located (in this example, the “uml” directory from the downloaded release).

    b.  Under the “schemas” directory, add an “extensions” directory.

    c.  Under the new “extensions” directory, add another directory with a name appropriate for your extension (here “example” was used).

    In this example, the new “schemas” directory should be added to the
    “uml” directory and should be structured as shown below.

    ![Image](.//media/image205.png)

5. With all of these fields filled out, your XSD schema Properties
    dialogue box should look something like below. Click OK to save
    these settings.

    ![Image](.//media/image206.png)

## Add Schema Description and Tags

The final step in setting up your schema details is to add a description
for your package and adjust the schema configuration settings that are
controlled in Sparx EA via tagged values.

1. Once more, double click (or right click and choose “Properties…”) on
    your Extension package in Project Browser and then click the UML
    button (near the top right corner). This will bring you back to your
    Package dialogue box.

2. In the central text box, fill in a description of your Extension
    package. The text entered here will also show up as a documentation
    element in your schema file.

3. Next, click on the *Tags* tab (near the lower right hand corner) to
    add three tags used by Sparx EA when creating your schema files:
    attributeFormDefault, elementFormDefault, and version.

    a. FIXM standardly sets attributeFormDefault to `unqualified`.

    b. FIXM standardly sets elementFormDefault to “qualified”.

    c. Version should be set as appropriate for your Extension (`1.0.0` in this example).

    To add these tags, click on the third icon from the left ![Image](.//media/image63.png) in the *Tags* tab and fill in the *Tag* and *Value* fields similar to what is shown below.

    ![Image](.//media/image64.png)

    ![Image](.//media/image65.png)

    ![Image](.//media/image66.png)

4. When finished, your Package dialogue box will look something like
    below. Click OK to save these settings.

    ![Image](.//media/image207.png)

## Notes

[1]: Though FIXM tends to use namespaces that look like URLs, the namespace value do not need to resolve to an actual location on the Internet.  The namespace is just a field used to resolve naming collisions between schemas and should, therefore, be distinctive enough to ensure a reasonably high chance it is not used by another schema.

[2]: This example used “xmp” but the prefix can be set to any value that makes sense in the context of your extension.  Because it will be used throughout your generated schemas, a short prefix is typically preferred.
