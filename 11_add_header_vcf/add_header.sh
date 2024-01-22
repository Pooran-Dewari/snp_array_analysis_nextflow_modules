VCF="hamour_biallelic_fixed.vcf"
VCF_GZ="hamour_vcf_biallelic.recode.vcf.gz"

# extract prefix from input vcf for output filename
PREFIX=$(echo $VCF| cut -d'.' -f 1)
OUTPUT_VCF=$PREFIX"__withHeader.vcf"

# extract header(s) from vcf gz file
zcat $VCF_GZ | grep '#' > header.txt

# this is the line we want to replace with
TEXT='##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Allelic depths for the ref and alt alleles in the order listed">'

# replace in file
sed -i "s/^##FORMAT=<ID=AD.*/$TEXT/" header.txt 

# concat to output final vcf file with the required header for downstream grenedalf analysis
cat header.txt $VCF > $OUTPUT_VCF
