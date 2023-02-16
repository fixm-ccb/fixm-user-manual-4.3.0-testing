# Other topics

## XSD Profiles as a potential alternative to XSD Restrictions

An XSD profile would represent a reduced, further restricted subset of
the original model. This approach is very similar to using restrictions
but accomplishes the task by directly creating smaller, parallel models
of the adjusted packages rather than producing them via a restriction.
The figure below illustrates at high-level the differences.

![Image](.//media/general-guidance-application-libraries-04.png "XSD Restriction vs XSD Profile")

XSD profiles would not restrict the types from the base reference and
would not bring any additional complexity. They could therefore be
processed by marshalling tools in a smoother way compared to XSD
restrictions.

?> The online literature about XML schema design generally considers that
the restrictions of XSD complex types are the most difficult and
therefore the least supported part of the XML schema specification. XSD profiles may be considered as an alternative to XSD restrictions should implementers experience issues with the FIXM templates based on XSD restrictions. Implementers are therefore invited to
report any problems with XSD restrictions support, with details about the
development environment being used. See also FIXM DEVELOPMENT TOOL COMPATIBILITY section.