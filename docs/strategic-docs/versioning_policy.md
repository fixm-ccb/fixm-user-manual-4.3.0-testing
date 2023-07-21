# FIXM Versioning Policy

*Note: the versioning policy described below corresponds to the policy discussed and consolidated with the AIXM 
community  over  2017  using  the  cross-XM  coordination  workspace  and  equally  promoted  to  the  AIXM 
documentation per AIXM Jira Issue 278.*

The applicable versioning policy for –XMs uses  [Semantic  versioning  2.0.0](https://semver.org/spec/v2.0.0.html) as a common reference:

`MAJOR`.`MINOR`.`PATCH`

## MAJOR Version

A `MAJOR` (**X**.y.z) version introduces major conceptual changes. Forward data mapping is not guaranteed. The 
changes justifying a new `MAJOR` release include, but are not limited to: 
- Re-factoring a large part of the model
- Scope reduction of the –XM / deletion of model elements without prior deprecation or replacement
- Use of a different data encoding syntax, or withdrawal of a given physical realization of the –XM Logical Model

## MINOR Version

A `MINOR` (x.**Y**.z) version introduces new model elements and capabilities guaranteeing forward data mapping 
for non-deprecated elements or deprecated elements with replacement. Loss of information may happen for 
elements being no longer required. The changes allowed in a `MINOR` release include, but are not limited to: 
- Inclusion of new model elements, in particular in support of evolving ICAO requirements (e.g. SARPS 
update) 
- Deprecation of model elements, with or without replacement 
- Deletion of model elements deprecated in a previous version 
- Addition of a new physical realization of the –XM Logical Model 

## PATCH Version

A `PATCH` (x.y.**Z**) version is limited to bug fixing. Forward and backward data mapping is guaranteed without
loss of information. A PATCH version does not impose changes in a consuming system. A `PATCH` version may 
still require data conversion to be made ahead of the data entering in the consuming system (done by a 
mediator service). The changes allowed in a PATCH release include, but are not limited to: 
- Clarification of definitions, changes to the –XM documentation package and/or to the -XM Logical 
Model with no impact on the physical realization(s). 
- Correcting spelling mistakes, incl. in physical realisations 
- Updating external references

## APLHA, BETA and RELEASE CANDIDATES

Alpha, Beta or Release Candidate versions, if created, will be named as follows: 
- X.Y.Z_ALPHA 
- X.Y.Z_BETA 
- X.Y.Z_RC
