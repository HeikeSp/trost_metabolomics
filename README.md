# trost_metabolomics

## Scripts for raw data and meta information
* ``gmd_first_steps.Rmd``
	* Create trost TagList
	* Query for all TROST chromatogram IDs and respective names (e.g. 11290if_9) from GMD which are used as IDs in Phenotyper
	* Import TROST phenotyper query results and join phenotyper results with trost_gmd_ids by common GMD_id
	* Import analytes overlap table
* ``gmd_raw_values.Rmd``
	* Get raw values from GMD (Golm Metabolome Database)
* ``gmd_analytes.Rmd``
	* Get analytes for all TROST experiments from GMD
* ``gmd_metadata.Rmd``
	* Get meta information from GMD
* ``phenotyper_metadata.Rmd``
	* Get meta information from Phenotyper database
* ``gmd_data_analysis.Rmd``
    * General workflow of GMD raw data analysis (normalization, outlier detection, ANOVA, first plots)
    * Is executed by using a specific R-script for each experiment
* ``gmd_subset.Rmd``
    * Returns subset of raw/normalized GMD data for a specific set of samples and analytes
    * Is used to generate tables for supplemental material

