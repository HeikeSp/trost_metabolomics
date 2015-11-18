# Set working directory
setwd("..")

# Source R scripts
source("../libpurzel/names.R")
source("../libpurzel/colors.R")

# Set variables specific for experiment
# Set experiment string for file names
experiment_string <- "jki_field_2012"

# Set threshold values for outlier detection, coefficient of variation (cv), shapiro test
outlier_threshold = 1e-10
cv_value_threshold = 0.25
shapiro_threshold = 1e-7

# Set factors for metadata
sample_time_names <- "late"
cultivar_names <- names_cultivars_34 # from names.R
cultivar_names_sorted <- names_cultivars_34 # from names.R

# Set factors used for normalization
all_factors_variable = c("cultivar", "treatment", "SequenceID", "BatchID", "log10_AvgAnnotated")
keep_factors_variable = c("cultivar", "treatment")
IA_factors_variable = c("cultivar","treatment")

# Settings for aggregation
do_agg_late_before_samples = 0

# Names for Boxplot
names_func_boxplot_2fac <- names_treatment_sample_time

# Colors for Plots
cols_cultivar_factor <- cols_cultivar_34
cols_sample_time_factor <- cols_sample_time2

# Sample names corresponding to RNASeq data
sample_names_variable <- c("t05_a_c", "t05_m_c", "t05_d_c", "t05_s_c", 
                           "t05_a_d", "t05_m_d", "t05_d_d", "t05_s_d")

# Create the output filename
outfile = paste("gmd_data_analysis_", experiment_string, "_", Sys.Date(), ".html", sep="")

# Compile the document
# knit2html(input="gmd_data_analysis.Rmd", output=outfile)
rmarkdown::render(input = "scripts/gmd_data_analysis.Rmd", 
                  output_format = "html_document", 
                  output_file = outfile)
