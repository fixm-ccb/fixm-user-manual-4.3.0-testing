# Create Application Content

Now it is time to create any content needed for your Application. For
this example, we will create two classes: a complex type for the message
itself and an enumeration for the alert type. The message will have
three attributes added to it and the enumeration will be linked to the
message via an association. We will also add an association to link the
message to Core’s Flight class (the root class for Core). Finally, we
will create a root element for the Application.

1. Double click on your Application’s diagram (or right click it and
    choose “Open”) to get started.

## Create a ComplexType Class

We will start by creating a class with the XSDcomplexType stereotype for
our message.

1. In Toolbox, click on “Complex Type” and then click anywhere in the
    diagram section of the screen<sup><a href="#how-to-create-application/create-application-content?id=notes">[note 1]</a></sup>. This will open up an XSD
    complexType Properties dialogue box.

2. Add an appropriate *Name* and *Annotation* for your new class.

3. Then click OK.

    ![Image](.//media/image68.png)

    ![Image](.//media/image69.png)

    You can now begin to add content to your class.

## Add an Attribute to a Class

For this example, we will add three attributes to this class: sender,
recipient, and timestamp. Because each of these is of a type defined in
Core’s Base package, using attributes is in line with how FIXM is
standardly modeled.

1. Right click on the class in the diagram and choose “Features and
    Properties” and then “Attributes…”. This opens the Features dialogue
    box. In the Features dialogue box, you can add the attributes needed
    for your Application to your class.

      ![Image](.//media/image70.png)

2. Begin by clicking where it says “New Attribute…” under *Name* and
    filling in your new field’s name. In this example, we will start
    with “sender”.

3. Then hit the tab key or otherwise click out of the *Name* field.

4. You should now have a new attribute added to your class with a
    default *Type* of int and *Scope* of Private.

      ![Image](.//media/image71.png)

5. Next, click on the *Type* field, select the down arrow on the right
    side, and then click “Select Type…”.

      ![Image](.//media/image72.png)

6. This opens the Select Type dialogue box. Navigate to the appropriate
    class in the Base package you want to use, select it, and then click
    OK. In this example, that will be Fixm -&gt; Core -&gt; Base -&gt;
    Organization -&gt; PersonOrOrganization.

      ![Image](.//media/image73.png)

7. Next change the *Scope* field to “Public”.

8. Adjust the *Multiplicity* in the *Attribute* section as needed (in
    this example, it should be set to 0..1).

9. Then add a description for the field in the *Notes* section. When
    finished, your Features dialogue box will look something like below.

      ![Image](.//media/image74.png)

10. Repeat the steps above to continue adding as many attributes as
    desired. For this example, we will also add:

    a.  A recipient field:

    - *Name* set to: `recipient`.

    - *Type* set to: `Fixm -> Core -> Base -> Organization -> PersonOrOrganization`.

    - *Scope* set to: `Public`.

    - *Multiplicity* set to: `0..2000`.

    b.  A timestamp field:

    - *Name* set to: `timestamp`.

    - *Type* set to: `Fixm -> Core -> Base -> Types -> Time`.

    - *Scope* set to: `Public`.

    - *Multiplicity* set to: `0..1`.

11. When finished, click Close on the Features dialogue box. The class
    diagram should display the name, type, and multiplicity of each
    attribute added to the class.

      ![Image](.//media/image75.png)

## Create an Enumeration Class

Next, we will create an enumeration class to represent the type of the
alert.

1. In Toolbox, click on “Enum” and then click anywhere in the diagram
    section of the screen. This will open up an XSD enumeration
    Properties dialogue box.

2. Add an appropriate *Name*, comma-delimited set of *Values*, and
    *Annotation* for your new class. For the *Type* field, FIXM
    standardly leaves this blank. When generating schemas, the physical
    model will still derive this enumeration from xs:string but leaving
    the field blank avoids displaying the string inheritance in the
    model diagrams.

3. Then click OK.

      ![Image](.//media/image76.png)

4. Right click on the enumeration class in the diagram and choose
    “Features and Properties” and then “Attributes…”. This opens the
    Features dialogue box.

      ![Image](.//media/image77.png)

5. In the Features dialogue box, you can add descriptions to each
    enumeration in the *Notes* tab. When finished, click Close.

      ![Image](.//media/image78.png)

## Add an Association Between Classes

When converted to XSD schemas, there is no difference between
representing a field as an attribute of a class versus representing a
field as an association between two classes. However, FIXM standardly
only uses attributes for fields of a type defined in Core’s Base
package. Any other classes you want to use as a field under a class
should be attached to the class via an association.

In this example, we will use an association to create the alert type
field needed for our message because our AlertType enumeration was not
defined under the Base package.

1. Click on the class you wish to add your field to. You will see an
    upward arrow icon  ![Image](.//media/image79.png)
    appear near the upper right hand corner of your class.

      ![Image](.//media/image80.png)

2. Click on this arrow and drag it over the class you wish to use as
    the type of your field. Then release the mouse button and choose
    “Association” from the list of options that pops up.

      ![Image](.//media/image81.png)

3. This will create an association between the two classes.

      ![Image](.//media/image82.png)

4. Double click (or right click and choose “Properties…”) on the
    association to open the Association Properties dialogue box.

5. Begin by clicking on the far right side of the *Direction* field
    under the *Connector Properties* table of the *Main* tab on the
    right hand side of the dialogue box. This should open a dropdown
    menu. From this menu, choose “Source -&gt; Destination”.

      ![Image](.//media/image83.png)

6. Next, select “Role(s)” from the tree of options in the upper left
    hand corner. This brings up a new section of the Association
    Properties dialogue box split between setting up details for the
    source and target sides of your new association.

      ![Image](.//media/image84.png)

7. In the text/dropdown box directly under TARGET in the upper right
    hand corner, type in the name you would like to use for the field
    represented by this association (“type” in this example).

8. In the next text box down, fill in a short description for this
    field.

9. Finally, choose an appropriate *Multiplicity* for this field (“0..1”
    in this example).

10. When finished, your Association Properties dialogue box will look
    something like below. Click OK to save these settings.

    ![Image](.//media/image85.png)

    In this example, we will also add an association between ExampleMessage
and the Flight class (the root class of FIXM Core).

11. To accomplish this, first navigate to the correct package in Project
    Browser (Fixm -&gt; Core -&gt; Flight -&gt; FlightData) and then
    select the “&lt;&lt;XSDcomplexType&gt;&gt;Flight” class.

      ![Image](.//media/image86.png)

12. Now click and drag the Flight class from Project Browser to the
    ExampleMessage diagram. When you release the mouse button, a
    dialogue box will appear asking you how you would like to paste the
    class into the diagram. Select “Link” under the *Drop As* dropdown
    box and then click Okay.

      ![Image](.//media/image87.png)

13. Next, follow the same steps detailed above to create an association
    from the ExampleMessage class to the Flight class. When finished,
    your diagram should look something like below.

      ![Image](.//media/image88.png)

    The final step in creating associations is to add “position” tags. Sparx
    EA will automatically alphabetize class attributes when creating schemas
    from the logical model but associations need to be handled explicitly.
    Once all associations have been created for a class, follow the steps
    below to make sure the fields derived from associations are properly
    ordered in the physical model.

14. In the *Start* ribbon at the top of the screen, select “Tagged
    Values” from the *Windows* section to open the Tagged Value window.
    Having this window open provides a shortcut to accessing tagged
    values and is very useful when adding position tags.

      ![Image](.//media/image89.png)

15. Next, determine the correct ordering for each association
    originating from your class. For this example, the ExampleMessage
    class will have three attributes and two associations. Ordering the
    group of fields as a whole alphabetically gives you: flight,
    recipient, sender, timestamp, type. The position of the field in
    this alphabetical list gives you the value (starting with “1” for
    the first field) needed when adding a position tag. So, for this
    example, “flight” will need a position tag with a value of “1” and
    “type” will need a position tag with a value of “5”<sup><a href="#how-to-create-application/create-application-content?id=notes">[note 2]</a></sup>.

16. Now, click on each association in turn. When clicked on, you will
    see all the tagged values associated with whatever you click on show
    up in the Tagged Values window. For these associations, this window
    will initially look like the image below.

      ![Image](.//media/image90.png)

17. Click on *Connector Source* and then click on the third icon from
    the left ![Image](.//media/image63.png) to add a new tagged value. The *tag* field should be set to
    “position” and the *value* field to the correct numeric value as
    determined above. In this example, the flight association,
    connecting ExampleMessage to Flight, should be given the following
    tag:

    ![Image](.//media/image91.png)

    ![Image](.//media/image92.png)

    The type association, connecting ExampleMessage to AlertType, should
    be set up as below:

    ![Image](.//media/image93.png)

    ![Image](.//media/image94.png)

## Add a Root Element

Each XML document has exactly one single root element. It encloses all
the other elements and is therefore the sole parent element to all the
other elements. Applications create one or more elements that serve as
an entry point to the model and can therefore be used as root elements.
For this example, we will create a single such entry point named
“ExampleMessage”.

1. In Toolbox, click on “Element” and then click anywhere in the
    diagram section of the screen. This will open up an XSD element
    Properties dialogue box.

2. Add an appropriate *Name* (in this example, “ExampleMessage”) and
    *Annotation* (in this example, “The ExampleMessage element is an
    entry point to the Example Message application.”) for your
    Application.

      ![Image](.//media/image95.png)

3. Next click on the “…” icon to the right of the *Type* field. This
    opens the Select Classifier dialogue box. In the *Browse* tab,
    navigate to and click on the class you would like to use as the
    entry point for your Application. In this example, Fixm -&gt;
    Applications -&gt; ExampleMessage -&gt; MessageType. Click OK.

      ![Image](.//media/image96.png)

4. The *Type* field should now be updated to your selection. Click OK
    to create your root element. Note the generalization link formed
    between the element and the class it is based on.

      ![Image](.//media/image97.png)

    Repeat the steps above to add elements for each intended entry point
into your Application.

5. Continue adding as many classes, attributes, associations, and
    elements as needed for your particular Application. When finished,
    right click on the name at the top of the diagram and click “Save
    Changes to ‘\[diagram name\]’”.

      ![Image](.//media/image98.png)

The Application presented here is simple but keep in mind that the steps
detailed in this guide can be used to create as many packages and as
much content as needed to capture all the structure, headers, and
metadata needed for your particular exchange.

## Notes

[1]: If your toolbox is not showing XML Schema options, make sure you’ve applied the XSDschema stereotype to your package and close and then reopen the diagram.

[2]: Note that position tags may need to be updated appropriately any time you add, remove, or rename an attribute or association.  Be sure to check your position tags anytime you edit your model.
