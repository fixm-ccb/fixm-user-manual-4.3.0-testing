# Create Templates

FIXM is a general-purpose standard meant to facilitate the exchange of
any and all flight data. To accomplish this, it must be extremely
flexible in terms of required data content. However, individual users of
the FIXM standard may want to lockdown the expected format of their data
to reflect the content requirements of their particular message
exchanges. Message templates, created via XSD restrictions, is the
current method recommended by FIXM to accomplish this goal. For this
example, we will create two templates to illustrate the process:
departure alerts and arrival alerts.

## Create an Overall Template Container

The steps for creating this package are largely identical to those
outlined in [Create an Application
Package](#create-an-application-package) above. Key differences are
noted below.
)

1. Begin by right clicking on your Application package and choose “Add
    a Package…”.

    ![Image](.//media/image99.png)

2. In the New Package dialogue box, change the *Name* field to
    something appropriate to your templates (here we used
    “ExampleTemplates”), select the *Package Only* radio button, and
    then click OK.

    ![Image](.//media/image100.png)

3. Apply a schema stereotype and begin setting up schema properties as
    outlined in [Apply Schema Stereotype](#apply-schema-stereotype) and
    [Set Up Schema Properties](#set-up-schema-properties) above using
    the same *Target Namespace* and *Prefix* as was used for your
    Application package<sup><a href="#how-to-create-application/create-templates?id=notes">[note 1]</a></sup>.

    ![Image](.//media/image101.png)

4. For the *Schema File* field, choose something appropriate for your
    templates (in this example, `.\schemas\applications\examplemessage\exampletemplates\ExampleTemplates.xsd`).
    Please note, you will want to create a new subdirectory under your
    Application’s directory to hold the templates (in this example,
    “exampletemplates” should be created below the “examplemessage”
    directory).

    ![Image](.//media/image102.png)

5. In some cases, Sparx EA will automatically add additional namespace
    prefixes for packages that need to be imported, but that does not
    happen in this instance. Address this by manually adding the
    namespaces of any packages you will import. This step is
    accomplished by:

    a. Clicking “New” to open a Namespace Details dialogue box.

    b. Filling in appropriate details for each namespace to be included.

    c. Then clicking OK.

    In this example, our templates will import Base and Flight from Core.
See below for examples showing how each Namespace Details dialogue box should be filled in.

    ![Image](.//media/image103.png)

    ![Image](.//media/image104.png)

6. At this point, your XSD schema Properties dialogue box should look
    something like below. Click OK to save these settings.

    ![Image](.//media/image105.png)

7. Finally, follow the steps outlined in [Add Schema Description and
    Tags](#add-schema-description-and-tags) to complete the setup of
    your template container.

## Create a Container for each Type of Message Template

With the overall template container built, you must now create
individual containers for each message template you wish to include in
your exchange. In this example, we will create two such containers:
ArrivalAlert and DepartureAlert. Due to their similarity in structure to
the overall container, we can use a shortcut to build them rather than
repeating all the steps from the previous section.

1. Right click on your newly created template container in Project
    Browser and choose “Copy / Paste” and then “Copy to Clipboard” and
    then “Full Structure of Duplication”.

    ![Image](.//media/image106.png)

2. Once again, right click on your template container in Project
    Browser and this time choose “Copy / Paste” and then “Paste Package
    from Clipboard”.

    ![Image](.//media/image107.png)

3. You should see a new copy of your container show up in Project
    Browser below the original.

    ![Image](.//media/image108.png)

4. Repeat the above “Paste Package from Clipboard” step for each
    message template you would like to create<sup><a href="#how-to-create-application/create-templates?id=notes">[note 2]</a></sup>. In this example, we
    will create two message templates. When finished, your Project
    Browser should display something similar to below.

    ![Image](.//media/image109.png)

5. Double click (or right click and choose “Properties…”) on each
    individual message template container and modify the *Schema Name*
    and *Schema File* fields to be something appropriate for your
    templates. Outside of Sparx EA, you will also want to create
    individual directories below the overall template directory to hold
    each message template. For this example, the following values should
    be used:

    a.  ArrivalAlert template

    - *Schema Name* set to: `ArrivalAlert`

    - *Schema File* set to: `.\schemas\applications\examplemessage\exampletemplates\arrivalalert\ArrivalAlert.xsd`

    b.  DepartureAlert template

    - *Schema Name* set to: `DepartureAlert`

    - *Schema File* set to: `.\schemas\applications\examplemessage\exampletemplates\departurealert\DepartureAlert.xsd`

    And the schemas directory structure should be modified as follows:

    ![Image](.//media/image110.png)

    Don’t forget to modify your schema descriptions to something appropriate as well. In this example, ArrivalAlert should use “An example Arrival Alert template.” and DepartureAlert should use “An example Departure Alert template”.

6. When finished, your Project Browser should display something similar
    to below.

    ![Image](.//media/image111.png)

## Create a Message Template

The individual message templates themselves recreate the structure of
the portions of the models that they draw fields from and reuse the same
namespaces, prefixes, and package names. They use different diagram
names, schema file names, schema descriptions, and, of course, the
content itself is modified using XSD restrictions.

The convention used so far in FIXM when naming template material is to
prefix the existing names with text to identify the Application followed
by text to identify the particular message. So, for this example, fields
under ArrivalAlert will be prefixed with “ExampleAA\_” while fields
under DepartureAlert will be prefixed with “ExampleDA\_”.

### Create Template Packages

One template package will need to be created for each Core or
Application package you wish to restrict. So, for this example, the
ArrivalAlert template will need to create an ExampleMessage package, a
Flight package, an Arrival package, and a FlightData package because
these are the packages that will be restricted to create an ArrivalAlert
message.

These template packages should replicate all the settings of the package
they correspond to except for their diagram’s *Name* field (if they have
an associated diagram – some packages won’t), the schema description,
and the *Schema File* field of their schema properties.

1. Follow the steps outlined in [Create an Application
    Package](#create-an-application-package) to recreate, under your
    message template container, the packages you wish to restrict in
    your template. All names, properties, descriptions, tags, etc.,
    should be the same<sup><a href="#how-to-create-application/create-templates?id=notes">[note 3]</a></sup>. except:

    a.  If your package has an associated diagram, change the diagram
        *Name* to include your template’s prefix. While not strictly
        necessary, this helps prevent confusing template diagrams with
        the originals.

    b.  Change the *Schema File* field to use a path corresponding to
        your message template and a filename beginning with your
        template’s prefix. Template schema files should be located under
        the directory of your message container but their paths should
        otherwise include creating any intermediate directories, etc.,
        so that they are structured similar to the paths to the files
        they are restricting.

    c.  Indicate that the schema is a template in the description text.

For this example, we will first create a template package corresponding
to ExampleMessage under ArrivalAlert. When creating the package, we will
change its diagram name to be `ExampleAA_ExampleMessage`.

![Image](.//media/image112.png)

![Image](.//media/image113.png)

When configuring the package, use all the same values as ExampleMessage
except change the schema description to “An example Arrival Alert
message template for the ExampleMessage package.” and the *Schema File*
field to
`.\schemas\applications\examplemessage\exampletemplates\arrivalalert\examplemessage\ExampleAA_ExampleMessage.xsd`.

![Image](.//media/image114.png)

![Image](.//media/image115.png)

The same steps will be used to create template packages for Core’s
Flight package and its Arrival and FlightData sub-packages. When
finished, Package Browser should appear as follows.

![Image](.//media/image116.png)

And the directory structure for the Application should be organized as
shown below.

![Image](.//media/image117.png)

### Create Template Content

The root mechanism for creating template content is making use of the
“XSDrestriction” stereotype built into Sparx EA. When applied to a
Generalization connector between two classes, this results in a schema
restriction on the simpleType or complexContent definition, depending on
the nature of the classes, of the derived class in the physical model.
Put simply, these XSD restrictions allow you to create derived classes
with fewer fields and/or more restricted content than the classes they
are derived from.

We will illustrate in more detail how these restrictions are applied by
looking first at how to constructe the ArrivalAlert template. When
finished, this template should provide the following fields:

- 1 ExampleMessage with:

  - 1 sender

  - 1..99 recipients

    - 1 timestamp

    - 1 type (set to ARRIVAL)

    - 1 flight with:

      - 1 arrival with:

        - 1 actualTimeOfArrival

        - 1 arrivalAerodrome

      - 1 gufi

      - 1 flightIdentification with:

        - 1 aircraftIdentification

      - 0..1 flightType

When constructing a template, we found it easiest to start at the leaf
(outermost) fields and work backwards to the root (innermost) fields.

#### Create a Restricted Class (Complex Type)

1. Double click on your message template’s diagram (or right click it
    and choose “Open”) to get started. In this example, we began with
    the “ExampeAA\_Arrival” diagram.

2. Locate the class you wish to restrict in Project Browser and then
    left click and drag the class into your diagram (in this example,
    Fixm -&gt; Core -&gt; Flight -&gt; Arrival -&gt;
    &lt;&lt;XSDcomplexType&gt;&gt;Arrival). Select “Link” under the
    *Drop As* dropdown box and then click Okay.

    ![Image](.//media/image118.png)

3. Create a new class of the same type as the class you wish to
    restrict. In this example, that would be a complexType class,
    created as outlined in [Create a ComplexType
    Class](#create-a-complextype-class). The *Name* and *Annotation*
    should be the same as the class you are restricting except the
    *Name* should begin with your template’s prefix.

    ![Image](.//media/image119.png)

4. Click on your new restricted class in the diagram. You will see an
    upward arrow icon
    \[    ![Image](.//media/image79.png)
    appear near the upper right hand corner of the class. Click on this
    arrow and drag it over the class you are restricting. Then release
    the mouse button and choose “Generalization” from the list of
    options that pops up.

    ![Image](.//media/image120.png)

    ![Image](.//media/image121.png)

5. Double click (or right click and choose “Properties…”) on the
    generalization connector to open the Generalization Properties
    dialogue box.

6. Click on the far right side of the *Stereotype* field under the
    *Connector Properties* table of the *Main* tab on the right hand
    side of the dialogue box. This should open a Stereotype dialogue
    box. Check the box next to “XSDrestriction” and click Okay.

    ![Image](.//media/image122.png)

7. Then click Okay in the Generalization Properties dialogue box to
    apply the stereotype.

    ![Image](.//media/image123.png)

Any class attributes and associations that resolve to XML elements in
the physical model that are not included in a restricted class will be
removed<sup><a href="#how-to-create-application/create-templates?id=notes">[note 4]</a></sup>. At this point, our example restricted class is completely
empty. The next step is to add back in the attributes and associations
you wish to retain.

#### Set Up Restricted Class Attributes (Complex Type)

We will begin with class attributes. If desired, attributes can be added
by following the steps listed in [Add an Attribute to a
Class](#add-an-attribute-to-a-class), being sure to replicate the values
used by the attributes in the class you are restricting. However, the
steps listed below can be used as a shortcut that should make adding the
attributes both easier and less error prone.

1. Once again, locate the class you wish to restrict in Project Browser
    (in this example, Fixm -&gt; Core -&gt; Flight -&gt; Arrival -&gt;
    &lt;&lt;XSDcomplexType&gt;&gt;Arrival). Click on the arrow
    \[    ![Image](.//media/image124.png)
    to the left of the class to display its associated attributes.

    ![Image](.//media/image125.png)

2. Control-left-click on each attribute you wish to retain in your
    restriction. In this example, “actualTimeOfArrival” and
    “arrivalAerodrome”.

    ![Image](.//media/image126.png)

3. Now drag the selected attributes onto your restricted class in the
    diagram. In the example, the attributes will be dragged onto the
    ExampleAA\_Arrival class in the ExampleAA\_Arrival diagram. This
    will create exact replicas of the attributes within your restricted
    class.

    ![Image](.//media/image127.png)

    Next, adjust the *Multiplicity* of your attributes to suit your
template’s needs.

4. Right click on the restricted class in the diagram and choose
    “Features and Properties” and then “Attributes…”. Select the
    attribute you wish to adjust and then click on *Multiplicity* in the
    *Attribute* section to change its value. In this example, both
    “actualTimeOfArrival” and “arrivalAerodrome” should be given an
    upper and lower bound of “1”.

    ![Image](.//media/image128.png)

    Most attributes in FIXM Core are marked as nillable. This is done via
adding a tag to the field with *Tag* set to “nillable” and *Value* set
to “true”.

    ![Image](.//media/image129.png)

5. If you do not wish attributes in your template to be nillable,
    navigate to the *Tagged Values* tab, and then erase the nillable tag
    by clicking on it and then clicking the fifth icon from the left ![Image](.//media/image130.png).
    In this example, the nillable tags should be erased from all
    attributes with a multiplicity lower bound of “1” or higher.

    ![Image](.//media/image131.png)

6. Click Close when finished. You should see the new multiplicities
    reflected in the restricted class diagram.

    ![Image](.//media/image132.png)

#### Set Up Restricted Class Associations

Next, we will focus on setting up associations. Like attributes, any
associations that resolve to XML elements not added back to your
restricted class will be removed. For example, the “reclearanceInFlight”
association attached to Core’s Arrival class (shown below) was removed
from ExampleAA\_Arrival because the association was never recreated.

![Image](.//media/image133.png)

To find an example of retained associations, let us move on to the
restricted FlightData package.

Following the steps outlined so far in [Create Template
Content](#create-template-content), create restricted versions of the
“Flight” and “FlightIdentification” classes from Fixm -&gt; Core -&gt;
Flight -&gt; FlightData in the ExampleAA\_FlightData diagram. For our
new “ExampleAA\_Flight” class, the “gufi” attribute should be retained
and made required (*Multiplicity* of 1..1). For
“ExampleAA\_FlightIdentification”, the “aircraftIdentification”
attribute should be retained and made required. Below are examples of
how Project Brower and the diagram will appear after this is done.

![Image](.//media/image134.png)

![Image](.//media/image135.png)

Much like “reclearanceInFlight” from the Arrival package, all of the
associations attached to the Flight class in Core have been implicitly
restricted away for ExampleAA\_Flight. To retain them, they must be
added back in by hand.

In this example, the first association we will add back in is
“flightType”.

1. If the class you wish to add an association to is not already
    present in the diagram, locate it in Project Brower and drag it into
    the diagram. In this example, “Fixm -&gt; Core -&gt; Flight -&gt;
    FlightData -&gt; TypeOfFlight” should be added to the
    ExampleAA\_FlightData diagram.

    ![Image](.//media/image136.png)

2. Use the steps detailed in [Add an Association Between
    Classes](#add-an-association-between-classes) to create the
    association desired for your restricted class. Like with class
    attributes, you will want to reuse all of the same values as the
    original association with the possible exception of multiplicity and
    removing the nillable tag. You will also likely need to modify the
    “position” tag to make sure your elements are ordered correctly in
    the physical model. In this example, use all of the same values used
    in the original “flightType” association except position (which will
    end up being set to “3” in the final version of this template).

    ![Image](.//media/image137.png)

    ![Image](.//media/image138.png)

    Sparx EA automatically displays any associations between classes you add to a diagram. Above you will notice this for the existing associations “flightType” and “flightIdentification”. To improve the readability of your diagrams, it is recommended you hide (not delete<sup><a href="#how-to-create-application/create-templates?id=notes">[note 5]</a></sup>) these associations.

3. Right click on the any existing associations you do not want to show
    in your diagram and choose “Visibility” and then “Hide Connector”.
    In this example, the pre-existing “flightType” and
    “flightIdentification” associations were hidden.

    ![Image](.//media/image139.png)

    ![Image](.//media/image140.png)

#### Use a Restricted Class to Enforce the Use of Another Restricted Class

The next association that needs to be created for the example will be
used to add back in the “flightIdentification” field to the restricted
ExampleAA\_Flight class. However, we only want to allow the use of the
restricted ExampleAA\_FlightIdentification class, not the original
unrestricted FlightIdentification class from Core.

While doing so is mechanically no different than the steps outlined
above in [Set Up Restricted Class
Associations](#set-up-restricted-class-associations), this chaining
together of restricted classes (ultimately all the way back to the root
class of your Application) is the means by which templates are formed
and enforced<sup><a href="#how-to-create-application/create-templates?id=notes">[note 6]</a></sup>.

Below are a series of screenshots capturing key steps taken along the
way to completing the restricted FlightData package. Each of these steps
involves enforcing the use of a restricted class.

![Image](.//media/image141.png)

![Image](.//media/image142.png)

![Image](.//media/image143.png)

![Image](.//media/image144.png)

![Image](.//media/image145.png)

![Image](.//media/image146.png)

![Image](.//media/image147.png)

With the FlightData package complete, the only package left to finish
for the ArrivalAlert template is ExampleMessage.

#### Create a Restricted Class (Enumeration)

When creating the final ArrivalAlert restricted package
(ExampleMessage), we run into a new use of XSD restriction: limiting an
enumeration to only allow a specific value.

1. Similar to [Create a Restricted Class (Complex
    Type)](#create-a-restricted-class-complex-type), begin by dragging
    the enumeration you wish to restrict into your diagram. In this
    example, “AlertType” from Fixm -&gt; Applications -&gt;
    ExampleMessage should be added to the “ExampleAA\_ExampleMessage”
    diagram.

2. Next, add a new enumeration to the diagram as outlined in [Create an
    Enumeration Class](#create-an-enumeration-class). However, the
    *Name* field should begin with your message template’s prefix (in
    this example, “MessageAA\_”) followed by the same name as the
    enumeration you are restricting, the *Annotation* should be the same
    as the enumeration you are restricting, and the *Values* should only
    include the value you wish to enforce in this template (in this
    example, “ARRIVAL”).

    ![Image](.//media/image148.png)

3. Next click on the “…” icon to the right of the *Type* field. This
    opens the Select Classifier dialogue box. In the *Browse* tab,
    navigate to and click on the class you would like your restriction
    to be derived from. In this example, Fixm -&gt; Applications -&gt;
    ExampleMessage -&gt; AlertType. Click OK.

    ![Image](.//media/image149.png)

4. You will see the selected class show up in the *Type* field. Click
    OK to create the enumeration.

    ![Image](.//media/image150.png)

    ![Image](.//media/image151.png)

5. Finally, as done in [Create a Restricted Class (Complex
    Type)](#create-a-restricted-class-complex-type), apply the
    XSDrestriction stereotype to your generalization connector to finish
    constructing your restricted enumeration class.

    ![Image](.//media/image152.png)

The rest of the restricted ExampleMessage package should be created
using the techniques covered above in [Create Template
Content](#create-template-content). Below are a series of screenshots
capturing key steps taken along the way.

![Image](.//media/image153.png)

![Image](.//media/image154.png)

![Image](.//media/image155.png)

![Image](.//media/image156.png)

![Image](.//media/image157.png)

![Image](.//media/image158.png)

![Image](.//media/image159.png)

![Image](.//media/image160.png)

![Image](.//media/image161.png)

![Image](.//media/image162.png)

![Image](.//media/image163.png)

![Image](.//media/image164.png)

![Image](.//media/image165.png)

![Image](.//media/image166.png)

![Image](.//media/image167.png)

![Image](.//media/image168.png)

![Image](.//media/image169.png)

![Image](.//media/image170.png)

At this point in the example Application, the ArrivalAlert message
template should be complete and it is time to create the DepartureAlert
template. The intended content of the DepartureAlert template is very
close to the structure and content of ArrivalAlert:

- 1 ExampleMessage with:

  - 1 sender

  - 1..99 recipients

  - 1 timestamp

  - 1 type (set to DEPARTURE)

  - 1 flight with:

    - 1 departure with:

      - 1 actualTimeOfDeparture

      - 1 aerodrome

    - 1 gufi

    - 1 flightIdentification with:

      - 1 aircraftIdentification

    - 0..1 flightType

Only the value of the “type” field and the replacement of “arrival” with
“departure” (and associated sub-fields) differ between the two, making
this a good candidate for copying and pasting template content (see
[Copying and Pasting a Template
Package](#copying-and-pasting-a-template-package) below).

Before employing this technique, the portions of DepartureAlert that are
not a good candidate for copy and paste (specifically the Flight package
and the Departure package) should be created as described in [Create
Template Content](#create-template-content) above. Do so now. Below are
screenshots of showing how Project Browser and the restricted Departure
package diagram should look after these packages have been completed.

![Image](.//media/image171.png)

![Image](.//media/image172.png)

## Copying and Pasting a Template Package

Copying and pasting content in EA can be dangerous if proper care is not
taken. It is easy to accidentally create hidden relationships or cause
other unexpected issues. However, it can also be very helpful in terms
of saving effort and avoiding errors that sometimes creep in when
creating content by hand. The restricted FlightData and ExampleMessage
packages from the ArrivalAlert template are good candidates for using
this technique to create corresponding packages under DepartureAlert. In
this example, we will begin with FlightData.

1. Right click on package you would like to copy in Project Browser and
    choose “Copy / Paste” and then “Copy to Clipboard” and then “Full
    Structure of Duplication”.

    ![Image](.//media/image173.png)

2. Next, right click on the package under which you want to paste your
    copied package and choose “Copy / Paste” and then “Paste Package
    from Clipboard”. In this example, that is the “Flight” package under
    “DepartureAlert”.

    ![Image](.//media/image174.png)

At this point, your copied package should be replicated in the new
location. You will now need to go through it and adjust settings as
needed for this version of the package.

1. Double click (or right click and choose “Properties…”) on your
    copied package in Project Browser to access and adjust the schema
    properties. In this example, only the *Schema Location* field needs
    to be adjusted. It should be modified to use:
    “.\\schemas\\applications\\examplemessage\\exampletemplates\\departurealert\\flight\\flightdata\\ExampleDA\_FlightData.xsd”<sup><a href="#how-to-create-application/create-templates?id=notes">[note 7]</a></sup>.
    Click OK to save the new settings.

2. Again, double click (or right click and choose “Properties…”) on
    your copied package in Project Browser and this time click the UML
    button in the upper right hand corner. In the central text box,
    adjust the schema description as needed. In this example, the text
    should be changed to read “An example Departure Alert message
    template for the FlightData package.”. Click OK to save the change.

    ![Image](.//media/image175.png)

3. Right click and choose “Properties…” on your diagram name in Project
    Brower. In this example, that will be “ExampleAA\_FlightData” within
    the DepartureAlert template.

    ![Image](.//media/image176.png)

4. This opens the Class Diagram dialogue box. Change the *Name* field
    to something appropriate for your package. In this example,
    “ExampleDA\_FlightData”.

    ![Image](.//media/image177.png)

5. In Project Browser, delete any unwanted classes from your package by
    right clicking on them and choosing “Delete ‘\[class name\]’”. In
    this example, no classes need to be deleted.

6. In Project Brower, double click (or right click and choose
    “Properties…”) on each class in your package and update the *Name*
    field as needed. In this example, each *Name* should be modified to
    use a prefix of “ExampleDA\_” rather than “ExampleAA\_”.

    ![Image](.//media/image178.png)

    ![Image](.//media/image179.png)

7. Now review your class diagram by double clicking on its name (or
    right click it and choose “Open”).

8. Note any connectors that are no longer desired. Delete these by
    right clicking on them and choosing “Delete Connector”<sup><a href="#how-to-create-application/create-templates?id=notes">[note 8]</a></sup>. In this
    example, the “arrival” connector between ExampleDA\_Flight and
    ExampleAA\_Arrival is no longer desired and should be removed.

    ![Image](.//media/image180.png)

    When prompted, select the “Delete the connector from the model” radio button and then click OK.

    ![Image](.//media/image181.png)

    ![Image](.//media/image182.png)

9. Note any orphaned classes left behind when the unwanted connectors
    have been removed. Click on each in turn and press the delete key
    (or right click on them and choose “Delete ‘\[class name\]’”).
    Unlike connectors, this will only remove the class from the diagram,
    not erase it entirely from the model. In this example, the
    ExampleAA\_Arrival class should be deleted from the diagram.

    ![Image](.//media/image183.png)

10. Next, use the techniques outlined in [Create Template
    Content](#create-template-content) to finish adjusting your package
    with any more changes needed. In this example, that involves
    creating a “departure” association between ExampleDA\_Flight and
    ExampleDA\_Departure (defined in the already created restricted
    Departure package under DepartureAlert). Don’t forget to adjust
    position tags as needed to ensure correct ordering of elements in
    the physical model.

    ![Image](.//media/image184.png)

    As a final check when performing any copy and paste in Sparx EA, you
    will want to review the relationships of each class you copied to ensure no undesired connections exist.

11. In the *Start* ribbon at the top of the screen, select
    “Relationships” from the *Windows* section to open the Relationships
    window.

    ![Image](.//media/image185.png)

12. Click on each class in your package and review the displayed
    relationships for any unexpected connections. In this example, the
    Relationships window will reveal an unwanted connection between
    ExampleDA\_Flight and ExampleAA\_ExampleMessage that resulted from
    the copy and paste!

    ![Image](.//media/image186.png)

13. Right click and choose “Delete Connection” for any unwanted
    relationships. Click Yes when asked to confirm the deletion.

    ![Image](.//media/image187.png)

    ![Image](.//media/image188.png)

The steps outlined above should be repeated for the ExampleMessage
package to complete the DepartureAlert template. Below are screenshots
of how Project Browser and the restricted ExampleMessage package diagram
should appear after this package is completed.

![Image](.//media/image189.png)

![Image](.//media/image190.png)

The templates created for this example were relatively simple and
contained very few fields when compared to FIXM’s entire structure.
However, the techniques outlined in [Create
Templates](#create-templates) were the same ones employed to create the
much larger set of FF-ICE Message templates and should provide the
framework needed to create larger, more complicated templates as needed.

## Create the Includes Package

The final step in creating Templates is to add an “Includes” package and
appropriate sub-packages. FIXM makes use of “package-wide include files”
to increase its usability with a number of XML tools. The packages
contained under the Includes package facilitate this and will be
modified by the post-processing script to contain the needed content
(see [Set Up and Use Package-Wide Include
Files](#set-up-and-use-package-wide-include-files) for more
details).

1. Right click on your overall templates container (in this example,
    the “ExampleTemplates” package) and choose “Add a Package…”.

2. In the New Package dialogue box, change the *Name* field to
    “Includes”.

3. Select the “Package Only” radio button and click OK.

    ![Image](.//media/image191.png)

4. For each namespace your templates both import and restrict (in this
    example, only `http://www.fixm.aero/flight/4.2`), create one
    sub-package under Includes. Like Includes itself, these sub-packages
    will be “Package Only”. Choose a *Name* appropriate to both your
    templates and the schemas they will import. In this example, one
    sub-package will be created and it should be named “ExampleFlight”.

    ![Image](.//media/image192.png)

5. Follow the steps detailed in [Apply Schema
    Stereotype](#apply-schema-stereotype), [Set Up Schema
    Properties](#set-up-schema-properties), and [Add Schema Description
    and Tags](#add-schema-description-and-tags) to configure this
    package. The *Target Namespace* and *Prefix* fields should match
    those of the schemas you will be importing, as should the “version”
    tag. The *Schema File* field should be set to something appropriate
    for your templates. In this example, use:

    a.  *Target Namespace* set to: `http://www.fixm.aero/flight/4.2`.

    b.  *Prefix* set to: `fx`.

    c.  *Schema File* set to:`.\schemas\applications\examplemessage\exampletemplates\ExampleFlight.xsd`.

With the Includes package in place, the example Application is
complete. Below are screenshots showing the final composition of Project
Browser and the schemas directory structure.

![Image](.//media/image193.png)

![Image](.//media/image194.png)

## Notes

[1]: This is important because XSD complex type restrictions, the mechanism used to create the templates, must use the same namespace as the types they restrict.  Because of this, different versions of templates are not able to use distinct namespaces to distinguish themselves from each other. Tying the versioning of the templates to the versioning of the Application package and changing that versioning each time the templates change solves this issue.

[2]: Note that these pastes must be performed back to back.  If you go back and re-copy the package after the first paste, any additional sub-packages added will be copied as well and would then need to be manually deleted.

[3]: Note, this only applies to the package itself – not the contents of the package.  Creating the contents of the message template is covered in Create Template Contents.

[4]: XML attributes, rarely used in this version of FIXM, are handled differently.  If you wish to remove an XML attribute from your restricted class, the field must be retained but the “use” tag associated with the field must be set to a value of “prohibited”.

[5]: If deleted, these associations will be removed entirely from the model, including Core!  It is very important that you do not do this.

[6]: It is important to note that this substitution of a restricted class for the class it is derived from can also be done for attributes.  If your templates add restrictions to any classes defined in Core’s Base package, use them when specifying the Type field of your attributes as needed.  The FficeMessage templates provide examples of this for the PersonOrOrganization class.

[7]: Don’t forget to create any needed directories outside of Sparx EA to accommodate your schema structure.

[8]: Note that it is very important to explicitly delete any unwanted connectors.  If you instead delete the class in the diagram that the connector is attached to, this will remove the connector from the diagram but it will still exist within the model.  This can cause undesired elements to be created when generating the physical model.
