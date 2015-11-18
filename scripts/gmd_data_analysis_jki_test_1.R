# Set working directory
setwd("..")

# Source R scripts
source("../libpurzel/names.R")
source("../libpurzel/colors.R")

# Set variables specific for experiment
# Set experiment string for file names
experiment_string <- "jki_test_1"

# Set threshold values for outlier detection, coefficient of variation (cv), shapiro test
outlier_threshold = 1e-4
cv_value_threshold = 0.25
shapiro_threshold = 1e-6

# Set factors for metadata
sample_time_names <- c("early/before","early/after", "late/before", "late/after")
cultivar_names <- check_names # from names.R
cultivar_names_sorted <- check_names_ordered # from names.R

# Set factors used for normalization
all_factors_variable = c("cultivar", "treatment", "sample_time", "SequenceID", "BatchID", "log10_AvgAnnotated")
keep_factors_variable = c("cultivar", "treatment", "sample_time")
IA_factors_variable = c("cultivar","treatment", "sample_time")

# Settings for aggregation
do_agg_late_before_samples = 1

# Names for Boxplot
names_func_boxplot_2fac <- names_treatment_sample_time_2

# Colors for Plots
cols_cultivar_factor <- cols_cultivar_check
cols_sample_time_factor <- cols_sample_time

# Sample names corresponding to RNASeq data
sample_names_variable <- c("t02_a_c", "t02_m_c", "t02_d_c", "t02_s_c",
                           "t02_a_d", "t02_m_d", "t02_d_d", "t02_s_d")

# Create the output filename
outfile = paste("gmd_data_analysis_", experiment_string, "_", Sys.Date(), ".html", sep="")

# Compile the document
# knit2html(input="gmd_data_analysis.Rmd", output=outfile)
rmarkdown::render(input = "scripts/gmd_data_analysis.Rmd", 
                  output_format = "html_document", 
                  output_file = outfile)

