# Set working directory
setwd("..")

# Source R scripts
source("../functions/names.R")
source("../functions/colors.R")

# Set variables specific for experiment
# Set experiment string for file names
experiment_string <- "jki_shelter_2015"
experiment_string_out <- "jki_shelter_2015_B"
experiment_verbose <- "JKI Topf 2015"

# which selection of analytes should be used
# analytes_table <- "analytes_table_21exp_overlap_select_ordered" # --> overlap of 71 analytes (TROST + VALDIS)
analytes_table <- "analytes_table_valdis_overlap_select_ordered" # --> overlap of 85 analytes (only VALDIS)
# analytes_table <- "analytes_table_2014_valdis_overlap_select_ordered" # --> overlap of 125 analytes (only VALDIS 2014)
# analytes_table <- "analytes_table_2015_valdis_overlap_select_ordered" # --> overlap of 99 analytes (only VALDIS 2015)

# Set threshold values for outlier detection, coefficient of variation (cv), shapiro test
outlier_threshold = 1e-10
cv_value_threshold = 0.25
shapiro_threshold = 1e-7

# Set factors for metadata
sample_time_names <- "late"
genotype_names <- names_common_lines_2015 # from names.R
genotype_names_sorted <- names_common_lines_2015 # from names.R

# Set factors used for normalization
all_factors_variable = c("genotype_class", "treatment", "SequenceID", "BatchID", "log10_AvgAnnotated")
keep_factors_variable = c("genotype_class", "treatment")
IA_factors_variable = c("genotype_class", "treatment")

# Settings for aggregation
do_agg_late_before_samples = 0

# Names for Boxplot
names_func_boxplot_2fac <- names_treatment_sample_time

# Colors for Plots
cols_genotype_factor <- cols_genotype_report
cols_genotype_name_factor <- cols_lines_60
cols_sample_time_factor <- cols_sample_time2

# Sample names corresponding to RNASeq data
sample_names_variable <- c()

# Create the output filename
outfile = paste("gmd_data_analysis_", experiment_string_out, "_", Sys.Date(), ".html", sep="")

# Compile the document
# knit2html(input="gmd_data_analysis.Rmd", output=outfile)
rmarkdown::render(input = "scripts/gmd_data_analysis.Rmd", 
                  output_format = "html_document", 
                  output_file = outfile)

