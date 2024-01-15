# Using an Extension together with an Application

In principle, as can be seen in detail in [How to create a FIXM extension](how-to-create-fixm-extension/introduction), applying an
Extension to an Application is no different than applying one to FIXM
Core. It is just a matter of importing the FIXM Application in question and making use
of its extension hooks. That said, there are some aspects of using
Extensions and templates together that have not yet been fully explored.

One area under active investigation is applying a FIXM Application directly to an Extension. To date, the only two FIXM Applications that have been developed by the FIXM CCB are Basic Message and FF-ICE Message. Both of these Applications only apply themselves to Core. In theory, a FIXM Application could directly import an Extension just as easily as
it imports Core and apply templates to the Extension content in the same
way it does to Core fields. As practical examples of this are explored,
this section will be updated with more information about how to proceed
(or warnings as to why this is discouraged).

### Example: Position Report Template

Returning to our fictitious user one final time, XAS has created their
own Application for distributing departure and arrival alerts
but has a separate feed that makes use of a different set of schemas for
distributing their position reports. XAS would prefer to consolidate
their two feeds into one and use the same set of schemas for all of
their data.

XAS decides to update their position report Extension to target their
own Example Message Application rather than Basic Message and
add a new `POSITION_REPORT` enumeration to the Application’s type field
(see [How to create a FIXM Application](how-to-create-application/introduction) and [How to create a FIXM extension](how-to-create-fixm-extension/introduction) for details). This should be sufficient
to allow XAS to use one set of schemas for all of their data sets.
However, this creates an odd discrepancy between departure/arrival
alerts and position reports. The alerts are fully described in the
Application’s templates while position reports receive no such guidance.
Without applying the Application to the Extension as well as Core, there
does not seem to be a clear way forward to address this.

As noted above, the best way to approach this matter is currently under
investigation so this example is only provided to illustrate the issues
involved, not detail the recommended solution. This section will be
updated as appropriate after best practices have been established.

## Notes

[1]: Note that each Extension must target the same version of FIXM Core and/or Application Library in order to be used together.  For example, you cannot combine one Extension that uses FIXM Core 4.3.0 with another Extension that uses FIXM Core 4.2.0.  
