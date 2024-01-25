# install, if needed, and load libraries
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse)

# set R script location as working dir
setwd(dirname(rstudioapi::getSourceEditorContext()$path))



#............... load and merge datasets ..............

# load monomorphic file, create new column with chromosome & position for merge later
maf <- read_table("mono_snps.txt", col_names = F) %>% 
  mutate(CHROM_POS = paste(X1, X2, sep = "_"))


# load alt freq vcf file, create new column with chromosome & position for merge later
df_alt_freq <- read_table("frequencyalt-new-vcf.csv", col_names = T) %>%
  mutate(CHROM_POS = paste(CHROM, POS, sep = "_"))


# merge by chromosome & position
maf_vcf <- left_join(maf, df_alt_freq, by = "CHROM_POS") %>% 
  select(4:last_col())



#............... filter out alt freq <5% for each population .........
maf_vcf_filt_alw <- maf_vcf %>% 
  filter(hamour_alwakra.FREQ>= 0.05)


maf_vcf_filt_doha <- maf_vcf %>% 
  filter(hamour_doha.FREQ>= 0.05)


maf_vcf_filt_sham <- maf_vcf %>% 
  filter(hamour_shamal.FREQ>= 0.05)

maf_vcf_filt_aqua <- maf_vcf %>% 
  filter(hamour_aqua.FREQ>= 0.05)


#................. print total snps in each population as a table ..............

# List of dataframes
dfs <- list(df, maf_vcf, maf_vcf_filt_alw, 
            maf_vcf_filt_aqua, 
            maf_vcf_filt_doha, 
            maf_vcf_filt_sham)

dfs_name <- c("df", "maf_vcf", "maf_vcf_filt_alw",
              "maf_vcf_filt_aqua",
              "maf_vcf_filt_doha",
              "maf_vcf_filt_sham")

# Creating a tibble with dataframe names and number of rows
row_count_table <- tibble(
  sample_df = dfs_name,
  total_snps = sapply(dfs, function(count_rows) nrow(count_rows))
  )

# Print the resulting table
print(row_count_table)


#................ merge four populations to get a unified set ...................
#................. remove duplicates, just keep one copy of duplicates ..........

# long method (1)
# List of dataframes
df_pop <- list(maf_vcf_filt_alw, maf_vcf_filt_aqua,
               maf_vcf_filt_doha, maf_vcf_filt_sham)

# Merge dataframes and keep one copy if duplicates found
merged_df <- bind_rows(df_pop) %>% 
  distinct()

# Print the resulting dataframe
merged_df


# short method (2)
# for this, we could apply filter in the original maf_vcf file without ..
#..having to splitting into four populations

# get snps with 5% alt freq in at least one of the four populations
maf_filt_merged <- maf_vcf %>%
  filter_at(vars(starts_with('hamour_')),  any_vars(. >= 0.05))

write_tsv(maf_filt_merged, "maf_filtered_unified.txt", col_names = T)

# get snps with 5% alt freq in all four populations
maf_filt_intersect <- maf_vcf %>%
  filter(if_all(starts_with('hamour_'), ~. >= 0.05))

write_tsv(maf_filt_intersect, "maf_filtered_interesect.txt", col_names = T)

########################## VISUALISATION ######################################

################## visualisation of raw alt freq across populations ###########

par(mfrow = c(2, 2))

#for your individual populations histogram you just do 
hist(df_alt_freq$hamour_alwakra.FREQ,
     main = "Hamour alwakra", 
     xlab = "ALT frequency", ylab = "Counts", 
     cex.lab = 1.2, ylim=c(0,3500000))

abline(v=0.05, col='red',  lty='dashed')

text(x=0.13, y=3500000, "5% cut-off", col='red')

hist(df_alt_freq$hamour_aqua.FREQ,
     main = "Hamour aqua",
     xlab = "ALT frequency", ylab = "Counts",
     cex.lab = 1.2, ylim=c(0,3500000))

abline(v=0.05, col='red',  lty='dashed')

text(x=0.13, y=3500000, "5% cut-off", col='red')


hist(df_alt_freq$hamour_doha.FREQ,
     main = "Hamour doha",
     xlab = "ALT frequency", ylab = "Counts",
     cex.lab = 1.2, ylim=c(0,3500000))

abline(v=0.05, col='red',  lty='dashed')

text(x=0.13, y=3500000, "5% cut-off", col='red')

hist(df_alt_freq$hamour_shamal.FREQ,
     main = "Hamour shamal",
     xlab = "ALT frequency", ylab = "Counts",
     cex.lab = 1.2, ylim=c(0,3500000))

abline(v=0.05, col='red',  lty='dashed')

text(x=0.13, y=3500000, "5% cut-off", col='red')


#
#
dev.off()
