# trost_metabolomics

## Scripts for raw data and meta information
* ``gmd_first_steps.Rmd``
	* Create trost TagList
	* Query for all TROST chromatogram IDs and respective names (e.g. 11290if_9) from GMD which are used as IDs in Phenotyper
	* Import TROST phenotyper query results and join phenotyper results with ``trost_gmd_ids`` by common ``GMD_id``
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


## What to do when new GC-MS data are analyzed for the first time?
* open ''SQL Server Management Studio'' and select ''GMD'' as database

* find out the ``FK_TagList`` for a specific experiment (here MPI field 2015), e.g.:
``select id from tf.TagList where name like '%16005sf%'``

output: ``2A9059CA-C858-4404-A6BF-A8E0E2DFED1E``

* open sql files from repository ``database_scripts/repos`` and execute them after some changes (put always the correct ``FK_TagList``!):

1.``1 x parse FreshWeight from SampleInfo.sql`` -  **needs to be executed!**

2.``2 Annotieren der Analyte aus den Annotations comments heraus.sql``

3.``3 update Is_Quantitative_Cluster in MstAnnotation.sql``

4.``4 x suchen des Internen Standards Ribitol.sql`` - **needs to be executed!**

5.``5 query zum Erzeugen der normalisierten Metaboliten Profile.sql`` - not necessary

6.``6 create Profile Matrix.sql`` - not necessary
