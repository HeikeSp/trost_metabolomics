# Set working directory
setwd("..")

# Source R scripts
source("../functions/names.R")
source("../functions/colors.R")

# Set variables specific for experiment
# Set experiment string for file names
#experiment_string <- "mpi_field_2011"

# experiments that are relevant for model
experiment_names <- c("MPI_Feld_2011", "MPI_Feld_2012", "JKI_Feld_2012", "JKI_Feld_2013", 
                      "Dethlingen_2011", "breeder_trials", "MPI_FGH_2014", "MPI_FGH_2015", 
                      "JKI_Shelter_2014", "JKI_Shelter_2015", "MPI_Feld_2015")

experiment_ids <- c(44443, 46150, 56726, 56875, 62327,                      # TROST field trials 2011-13
                      47107, 47109, 47110, 47111, 47112, 47114, 47115, 47117, # breeder trials 2011
                      56876, 56878, 56879, 56880, 56881, 56882, 56883, 56884, # breeder trials 2012
                      67199, 68015, 72237, 72247, 72292, 72275)               # VALDIS trials 2014/15

experiment_ids_trost <- c(44443, 46150, 56726, 56875, 62327,                # TROST field trials 2011-13
                      47107, 47109, 47110, 47111, 47112, 47114, 47115, 47117, # breeder trials 2011
                      56876, 56878, 56879, 56880, 56881, 56882, 56883, 56884) # breeder trials 2012

experiment_ids_trost_field <- c(44443, 46150, 56726, 56875, 62327)          # TROST field trials 2011-13

experiment_ids_breeder <- c(47107, 47109, 47110, 47111, 47112, 47114, 47115, 47117, # breeder trials 2011
                              56876, 56878, 56879, 56880, 56881, 56882, 56883, 56884) # breeder trials 2012

experiment_ids_valdis <- c(67199, 68015, 72237, 72247, 72292, 72275)        # VALDIS trials 2014/15

# which selection of analytes should be used
# analytes_table <- "analytes_table_7exp_overlap_select_ordered"
analytes_table <- "analytes_table_20exp_overlap_select_ordered"



# Set threshold values for outlier detection, coefficient of variation (cv), shapiro test
# outlier_threshold = 1e-10
# cv_value_threshold = 0.25
# shapiro_threshold = 1e-10
# 
# # Set factors for metadata
# sample_time_names <- c("early", "late")
# genotype_names <- names_cultivars_34 # from names.R
# genotype_names_sorted <- names_cultivars_34 # from names.R
# 
# # Set factors used for normalization
# all_factors_variable = c("genotype_name", "treatment", "sample_time", "SequenceID", "BatchID", "log10_AvgAnnotated")
# keep_factors_variable = c("genotype_name", "treatment", "sample_time")
# IA_factors_variable = c("genotype_name","treatment", "sample_time")
# 
# # Settings for aggregation
# do_agg_late_before_samples = 0
# 
# # Names for Boxplot
# names_func_boxplot_2fac <- names_treatment_sample_time
# 
# # Colors for Plots
# cols_genotype_factor <- cols_cultivar_34
# cols_sample_time_factor <- cols_sample_time2
# 
# # Sample names corresponding to RNASeq data
# sample_names_variable <- c("t01_a_c", "t01_m_c", "t01_d_c", "t01_s_c", 
#                            "t01_a_d", "t01_m_d", "t01_d_d", "t01_s_d")

# Create the output filename
outfile = paste("prediction_model_trost_valdis_", Sys.Date(), ".html", sep="")

# Compile the document
# knit2html(input="gmd_data_analysis.Rmd", output=outfile)
rmarkdown::render(input = "scripts/gmd_data_analysis.Rmd", 
                  output_format = "html_document", 
                  output_file = outfile)

