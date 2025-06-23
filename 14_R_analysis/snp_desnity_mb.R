# Install and load required packages
if(!require(CMplot)){
  install.packages("CMplot")
}
library(CMplot)

# Load your SNP data (replace "your_snp_data.txt" with your file path)
snp_data <- read.table("mono_snps.txt", header = F, stringsAsFactors = FALSE)

# Rename columns
colnames(snp_data) <- c("Chromosome", "Position")

# Add SNP IDs if not already present
snp_data$SNP <- paste0("rs", seq_len(nrow(snp_data)))

# Extract numeric part from Chromosome names
snp_data$Chr_Num <- as.numeric(sub("SUPER_", "", snp_data$Chromosome))

# Sort by numeric chromosome and position
snp_data <- snp_data[order(snp_data$Chr_Num, snp_data$Position), ]

# Reorder columns as required by CMplot
snp_data <- snp_data[, c("SNP", "Chromosome", "Position")]

# Check the result
head(snp_data)


library(CMplot)

CMplot(snp_data,
       plot.type = "d",
       bin.size = 1e6,  # Adjust bin size depending on genome length
       #chr.den.col = rainbow(length(unique(snp_data$Chromosome))),
       chr.den.col=c("darkgreen", "yellow", "red"), # Customize color scheme
       file = "jpg",
       file.name = "SNP_density_SUPER",
       file.output = TRUE,
       dpi = 300)

#####################




library(CMplot)
library(dplyr)

library(CMplot)
library(dplyr)

# Step 1: Prepare SNP data from maf_filt_intersect
snp_data_intersect <- maf_filt_intersect %>%
  transmute(
    SNP = paste0("rs", row_number()),  # generate SNP IDs
    Chromosome = CHROM,
    Position = POS
  )

# Step 2: Sort chromosomes numerically
snp_data_intersect <- snp_data_intersect %>%
  mutate(Chr_Num = as.numeric(sub("SUPER_", "", Chromosome))) %>%
  arrange(Chr_Num, Position) %>%
  select(-Chr_Num)  # remove helper column

# Step 3: Plot SNP density
CMplot(snp_data_intersect,
       plot.type = "d",
       bin.size = 1e6,  # Adjust bin size as needed
       chr.den.col = c("darkgreen", "yellow", "red"),  # Custom colors
       file = "jpg",
       file.name = "SNP_density_intersect",
       file.output = TRUE,
       dpi = 300)

##########################





library(CMplot)
library(dplyr)

# Step 1: Prepare SNP data from maf_filt_merged
snp_data_merged <- maf_filt_merged %>%
  transmute(
    SNP = paste0("rs", row_number()),  # Generate unique SNP IDs
    Chromosome = CHROM,
    Position = POS
  )

# Step 2: Sort chromosomes numerically
snp_data_merged <- snp_data_merged %>%
  mutate(Chr_Num = as.numeric(sub("SUPER_", "", Chromosome))) %>%
  arrange(Chr_Num, Position) %>%
  select(-Chr_Num)  # Remove helper column

# Step 3: Plot SNP density
CMplot(snp_data_merged,
       plot.type = "d",
       bin.size = 1e6,  # Adjust depending on genome size
       chr.den.col = c("darkgreen", "yellow", "red"),  # Custom colors
       file = "jpg",
       file.name = "SNP_density_merged",
       file.output = TRUE,
       dpi = 300)


###########
library(dplyr)

# Get chromosome sizes by taking the maximum POS for each CHROM
chr_sizes <- maf_filt_merged %>%
  group_by(CHROM) %>%
  summarise(Chr_Length = max(POS)) %>%
  arrange(as.numeric(sub("SUPER_", "", CHROM)))  # Optional: sort numerically

# View result
print(chr_sizes)

