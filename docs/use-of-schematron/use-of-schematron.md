# Use of Schematron

There is some validation functionality that an XML schema alone cannot
provide. For example, there is no way for an XSD to make a particular
XML element required or optional based on the content of another
element. However, some message exchange business rules require exactly
these sorts of checks.

Schematron is a validation language capable of handling business rules
of this nature. As such, the use of Schematron can supplement the
limitations of XSDs and provide enforcement of any business rules
outside the scope of what XML schemas can offer.

**Error! Reference source not found.** provides examples of FIXM
business rules that could be encoded and checked using Schematron
technology. Schematron encodings are however not provided in this
version of the document. Future versions may revisit the overall
formulation and description method for FIXM business rules, in
particular in the light of the related AIXM experience.
