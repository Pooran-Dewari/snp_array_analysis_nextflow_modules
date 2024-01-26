library(tidyverse)

# load maf filtered vcf file
maf <- read_table("maf_filtered_unified.txt", col_names = T)

# convert to bed-like format & save
maf_bed <- maf %>% 
  mutate(END = POS + 1) %>% 
  relocate(END, .before =3)

write_tsv(maf_bed, "maf_filt_unified.bed", col_names = F)

# load gff file 
gff <- read_table("genes.gff", skip = 2, col_names = F)

#  rearrange columns to bed-like format & save
gff_rearranged <- gff %>% 
  select(X1, X4, X5, X3, X6:X9)

write_tsv(gff_rearranged, "gff_rearranged.bed", col_names = F)

# next, use bedtools intersect to find vcf that fall in exonic regions
# bedtools intersect -a maf_filt_unified.bed -b gff_rearranged.bed -wa -wb | grep 'exon' > maf_filt_unified_exonic.bed

# load maf filtered exonic to view
maf_filt_exonic <- read_tsv("maf_filt_unified_exonic.bed", col_names = F)
