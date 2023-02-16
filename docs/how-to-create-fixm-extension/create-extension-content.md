# Create Extension Content

The steps so far have centered on creating and setting up the
Extension’s root package. The number and organization of additional
Extension packages created below the root package (called
“subcomponents” in this document to more easily distinguish them from
the root package) will depend entirely on what the Extension is trying
to accomplish. In this very simple example, the Extension will be used
to:

- Add a new field called “position” to the EnRoute section of Core to
    report a flight’s current whereabouts.

- Add a new field called “sequenceNumber” to the BasicMessage section
    to help with message ordering.

The steps below describe how to create the subcomponents that will be
used to contain these new fields.

## Create an Extension Subcomponent

This example will start with creating a subcomponent for the “position”
field. Many of the steps outlined here are very similar to the steps
listed in the [Create an Extension Root Package](how-to-create-fixm-extension/create-an-extension-root-package)
section above. The main difference is that Extension subcomponents
contain diagrams and Extension classes.

1. Right click on the your Extension package and choose “Add a
    Package…”.

2. Change the *Name* field in the New Package dialogue box to something
    appropriate to your subcomponent (in this example,
    “ExampleEnRoute”).

3. Select the *Create Diagram* radio button.

4. Then click OK.

    ![Image](.//media/image208.png)

5. This will bring up a New Diagram dialogue box. In the *Type*
    section:

    a.  Choose “UML Structural” under *Select From*.

    b.  Choose “Class” under *Diagram Types*.

    Click OK to create the subcomponent and its associated diagram.

    ![Image](.//media/image209.png)

6. Next, apply the XSDschema stereotype to your subcomponent as
    described in the [Apply Schema Stereotype](how-to-create-fixm-extension/create-an-extension-root-package?id=apply-schema-stereotype) section above.

7. After the stereotype is applied, continue the schema setup as
    described in [Set Up Schema Properties](how-to-create-fixm-extension/create-an-extension-root-package?id=set-up-schema-properties)
    above. The following property values should be used for this
    subcomponent in this example:

    a.  *Target Namespace* set to: `http://www.fixm.aero/ext/example/1.0`.

    b.  *Prefix* set to: “xmp”.

    c.  *Schema File* set to: `.\schemas\extensions\example\ExampleEnRoute.xsd`.

    ?> NOTE: For this and other subcomponents, you should be able to skip the step of setting up additional namespaces for imported packages. Sparx EA should automatically generate these as needed.

    When finished, your XSD schema Properties dialogue box should look
    something like below.

    ![Image](.//media/image210.png)

8. Click OK to save these settings.

9. Reopen the subcomponent and finish the schema setup as described in
    [Add Schema Description and Tags](how-to-create-fixm-extension/create-an-extension-root-package?id=add-schema-description-and-tags).
    As described in that section, the following tags should be added:

    a.  An attributeFormDefault tag set to: “unqualified”.

    b.  An elementFormDefault tag to: “qualified”.

    c.  A version tag set to an appropriate version for your Extension (`1.0.0` for this example).

## Create an Extension Class

Now it is time to create any Extension classes needed. This is typically done in FIXM by creating new classes that generalize the extension classes (the classes used throughout Core by its extension hooks) found in the Extension package located under Core’s Base package (not to be confused with the similarly referred to “Extension package” you are in the process of creating).

1. Double click on your subcomponent’s diagram (or right click it and
    choose “Open”) to get started.

2. Next, in Toolbox, click on “Complex Type” and then click anywhere in
    the diagram section of the screen. This will open up an XSD
    complexType Properties dialogue box.

3. Add an appropriate *Name* and *Annotation* for your new class.

4. Then click OK.

    ![Image](.//media/image68.png)

    ![Image](.//media/image211.png)

5. Next, right click on your newly created class and choose “Advanced”
    and then “Parent…” to bring up the Set Parents and Interfaces
    dialogue box.

    ![Image](.//media/image212.png)

6. In the *Add New Relation* section of the dialogue box, set *Type* to
    “Generalizes” and then click on “Choose…” to open up the Select
    Classifier dialogue box.

7. From there, navigate to Fixm -> Core -> Base -> Extension
    and then choose the Extension class you wish to target. In this
    example, it will be “EnRouteExtension”.

8. Then click OK.

    ![Image](.//media/image213.png)

9. Once this is done, you should see that EnRouteExtension is now
    listed in the *Type Details* section of the Set Parents and
    Interfaces dialogue box and is also shown in italics at the top of
    your class in the diagram. Your new class now extends the
    EnRouteExtension extension hook from Core and is ready to be used to hold your Extension fields. Click Close.

    ![Image](.//media/image214.png)

## Add Extension Class Content

You can now begin to add content to your new Extension class.

1. Right click on the class in the diagram and choose “Features and
    Properties” and then “Attributes…”. This opens the Features dialogue
    box. In the Features dialogue box, you can add any attributes<sup><a href="#how-to-create-fixm-extension/create-extension-content?id=notes">[note 1]</a></sup>
    needed for your Extension to your class.

    ![Image](.//media/image215.png)

2. Begin by clicking where it says “New Attribute…” under *Name* and
    filling in your new field’s name. In this example, that will be
    “position”.

3. Then hit the tab key or otherwise click out of the *Name* field.

4. You should now have a new attribute added to your class with a
    default *Type* of “int” and *Scope* of “Private”.

    ![Image](.//media/image216.png)

5. Next, click on the *Type* field, select the down arrow on the right
    side, and then click “Select Type…”.

    ![Image](.//media/image217.png)

6. This opens the Select Type dialogue box. Navigate to the appropriate
    class in the Base package you want to use, select it, and then click
    OK. In this example, that will be Fixm -&gt; Core -&gt; Base -&gt;
    AeronauticalReference -&gt; GeographicalPosition.

    ![Image](.//media/image218.png)

7. Next change the *Scope* field to “Public”.

8. Adjust the *Multiplicity* in the *Attribute* section as needed (in
    this example, it should be set to 0..1).

9. Then add a description for the field in the *Notes* section. When
    finished, your Features dialogue box will look something like below.

    ![Image](.//media/image219.png)

10. Most optional fields in FIXM are also nillable. If you wish to make
    your field nillable:

    a.  Click on the *Tagged Values* tab.

    b.  Click on *Attribute*.

    c.  Click on the third icon from the left ![Image](.//media/image63.png) at the top of the tab to add a new tag.

    d.   In the *Tag* field type “nillable” and in *Value* type “true” and
    then click OK.

    ![Image](.//media/image220.png)

11. Continue adding as many attributes as desired. When finished,  click Close on the Features dialogue box. The class diagram should display the name, type, and multiplicity of each attribute added to the
    class.

    ![Image](.//media/image221.png)

12. When satisfied with the subcomponent, right click on its name at the top of the diagram and click “Save Changes to ‘\[diagram name\]’”.

    ![Image](.//media/image222.png)

    The class content presented here is simple but keep in mind that as many attributes and additional Extension-defined classes can be added to this extension hook as needed.

    Along the same lines, the steps detailed under [Create Extension
    Content](#_Create_Extension_Content) can be used to add as many
    additional subcomponents as needed to hold additional extension hooks or Extension-specific packages.

    Below are a series of screenshots capturing key steps along the way to creating a second subcomponent for representing the `sequenceNumber` field needed for extending BasicMessage. The only notable difference between creating this subcomponent and the previous one is that the `ExampleMessage` class created generalizes an extension hook class from BasicMessage under Applications rather than a class from Extensions
    under Base.

    ![Image](.//media/image223.png)

    ![Image](.//media/image225.png)

    ![Image](.//media/image226.png)

    ![Image](.//media/image227.png)

## Notes

[1]: In FIXM, attributes are standardly used when the field you are adding is of a Type defined in the Core’s Base package.  When defining your own types, they are standardly attached to a class by using an association instead.  In this example, we will be adding a new field of type GeographicalPosition from the AeronauticalReference package under Base so using an attribute is the appropriate choice.
