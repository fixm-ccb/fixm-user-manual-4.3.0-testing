!> Note to implementers: This "How To" section was originally developed using FIXM Core v4.2.0 and uses that version as the foundation for the modeling guidance provided. The details presented here should be equally applicable for FIXM Core v4.3.0 as no fundamental shifts in modeling best practices exist between these two versions.

# Initial Download and Setup

FIXM Extensions can be applied to Core, Applications, or both. Which
FIXM product(s) you begin with is entirely based on the scope of your
Extension.

1. Determine which FIXM product you wish to target with your
    Extension.

2. Download the full release from [here](https://fixm.aero/downloads.html).

3. Unzip the full release and navigate to the “uml” directory.

4. Rename the .eap file to something appropriate for your Extension.

5. Open the model (the .eap file) with Sparx Enterprise Architect<sup><a href="#how-to-create-fixm-extension/initial-download-and-setup?id=notes">[note 1]</a></sup>
    (EA).

For this guided example, the extension will target both Core and
BasicMessage (download available [here](https://fixm.aero/releases/Basic-Msg-1.0.0/FIXM_Basic_Message_v1.0.0_with_Core_v4.2.0_full_archive.zip)). The .eap file
should be renamed to
`FIXM_Example_Extension_v1.0.0_with_Basic_Message_v1.0.0_and_Core_v4.2.0.eap`.
The starting basic directory structure for the example environment is
shown below.

![Image](.//media/image197.png)

## Notes

[1]: The FIXM development team uses Sparx Systems Enterprise Architect version 13.5, build 1352 for all development work.
