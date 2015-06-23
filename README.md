# trost_metabolomics

## Scripts for raw data and meta information
* ``gmd_first_steps.Rmd``

** Create trost TagList
** Query for all trost chromatogram IDs and respective names (e.g. 11290if_9) from GMD which are used as IDs in Phenotyper
** Import TROST phenotyper query results and join phenotyper results with trost_gmd_ids by common GMD_id
** Import analytes overlap table

* ``gmd_raw_values.Rmd``

** Get raw values from GMD (Golm Metabolome Database)

* ``gmd_metadata.Rmd``

** Get meta information from GMD

* ``phenotyper_metadata.Rmd``
** Get meta information from Phenotyper database

