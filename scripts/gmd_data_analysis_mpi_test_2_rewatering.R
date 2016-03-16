# Set working directory
setwd("..")

# Source R scripts
source("../functions/names.R")
source("../functions/colors.R")

# Set variables specific for experiment
# Set experiment string for file names
experiment_string <- "mpi_test_2"
experiment_string_out <- "mpi_test_2_rewatering"

# which selection of analytes should be used
analytes_table <- "analytes_table_2exp_overlap_select_ordered"

# Set threshold values for outlier detection, coefficient of variation (cv), shapiro test
outlier_threshold = 1e-4
cv_value_threshold = 0.25
shapiro_threshold = 1e-5

# Set factors for metadata
sample_time_names <- c("early/before","early/after", "late/before", "late/after")
genotype_names <- check_names # from names.R
genotype_names_sorted <- check_names_ordered # from names.R

# Set factors used for normalization
all_factors_variable = c("genotype_name", "treatment", "sample_time", "SequenceID", "BatchID", "log10_AvgAnnotated")
keep_factors_variable = c("genotype_name", "treatment", "sample_time")
IA_factors_variable = c("genotype_name","treatment", "sample_time")

# Settings for aggregation
do_agg_late_before_samples = 0

# Names for Boxplot
names_func_boxplot_2fac <- names_treatment_sample_time_2

# Colors for Plots
cols_genotype_factor <- cols_cultivar_check
cols_sample_time_factor <- cols_sample_time

# Sample names corresponding to RNASeq data
sample_names_variable <- c("t04_a_c", "t04_m_c", "t04_d_c", "t04_s_c", 
                           "t04_a_d", "t04_m_d", "t04_d_d", "t04_s_d")


# WARNINGS for RemoveFactors ANOVA normalization! 
# probably because all stress samples belong to one batch (10394ia) and all control samples to another batch (13096if):
# table(factors$BatchID, factors$treatment)

# Create the output filename
outfile = paste("gmd_data_analysis_", experiment_string_out, "_", Sys.Date(), ".html", sep="")

# Compile the document
# knit2html(input="gmd_data_analysis.Rmd", output=outfile)
rmarkdown::render(input = "scripts/gmd_data_analysis.Rmd", 
                  output_format = "html_document", 
                  output_file = outfile)

