# Initial Download and Setup

To save time and reduce setup steps, it is recommended that you begin the process of creating your Application by downloading the FIXM Basic Message v1.0.0 full release.<sup><a href="#how-to-create-application/initial-download-and-setup?id=notes">[note 1]</a></sup>

1) Download the [full release of FIXM Basic Message v1.0.0](https://fixm.aero/releases/Basic-Msg-1.0.0/FIXM_Basic_Message_v1.0.0_with_Core_v4.2.0_full_archive.zip).
2) Unzip the full release and navigate to the `applications` directory under `schemas`.
3) Delete the `basicmessage` directory.
4) Navigate to the `uml` directory.
5) Rename the .eap file to something appropriate for your Application.

    For this guided example, the .eap file should be renamed to `FIXM_Example_Message_v1.0.0_with_Core_v4.2.0.eap`. The starting directory structure of the example environment is shown below.  

    ![The starting directory structure of the example environment](.//media/image52.png "The starting directory structure of the example environment")

6) Open the model (the .eap file) with Sparx Enterprise Architect  (EA).<sup><a href="#how-to-create-application/initial-download-and-setup?id=notes">[note 2]</a></sup>
7) Click the arrow (&#5125;) next to Applications in Project Browser to expand the Applications container.
8) Right click on the `BasicMessage` package in Project Browser and choose `Delete <<XSDschema>> BasicMessage`.

    ![Choose `Delete <<XSDschema>> BasicMessage`](.//media/image54.png "Choose `Delete <<XSDschema>> BasicMessage`")

9) Click the Yes button to confirm the deletion.

    ![Click the Yes button to confirm the deletion](.//media/image55.png "Click the Yes button to confirm the deletion")

## Notes

[1]: Starting with the Basic Message v1.0.0 model and then deleting the BasicMessage package allows you to skip creating and setting up the Applications container and associated schema directory.

[2]: The FIXM development team uses Sparx Systems Enterprise Architect version 13.5, build 1352 for all development work.  