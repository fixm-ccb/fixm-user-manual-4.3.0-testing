!> Note to implementers: This "How To" section was originally developed using FIXM Core v4.2.0 and uses that version as the foundation for the modeling guidance provided. The details presented here should be equally applicable for FIXM Core v4.3.0 as no fundamental shifts in modeling best practices exist between these two versions.

# Create a Top-level Extensions Container

Before creating the Extension itself, you should first create a
top-level container under which to place your Extension (a step skipped in the
[Applications](/how-to-create-application/introduction) example through reuse of the structure for BasicMessage).

1. Right click on the Core package in Project Browser and choose “Add a
    Package…”.

    ![Image](.//media/image198.png)

2. In the New Package dialogue box, click on the “…” box next to Owner
    (near the top right corner) to open the Select Owner dialogue box.

3. In the Select Owner dialogue box, click on Fixm and then click OK.

    ![Image](.//media/image199.png)

4. In the New Package dialogue box, change the *Name* field to
    “Extensions”, select the *Package Only* radio button, and then click
    OK.

    ![Image](.//media/image200.png)
