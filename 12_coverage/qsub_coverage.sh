#!/bin/sh

#$ -V -cwd
#$ -l h_rt=00:10:00 ###HH:MM:SS
#$ -l h_vmem=60G
#$ -pe sharedmem 1

module load igmm/apps/vcftools/0.1.13

cd /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/poolsnp_results

# filter out missing genotype
vcftools --gzvcf hamour_biallelic_fixed_withHeader.vcf --max-missing 1.0 --recode --out hamour.nomissingdata

#output genotype depths
vcftools --vcf hamour.nomissingdata.recode.vcf --site-mean-depth --out hamour.nomissingdata.ldepth.mean
