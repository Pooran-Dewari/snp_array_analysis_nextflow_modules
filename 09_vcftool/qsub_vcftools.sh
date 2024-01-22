#!/bin/sh

#$ -V -cwd
#$ -l h_rt=00:10:00 ###HH:MM:SS
#$ -l h_vmem=60G
#$ -pe sharedmem 4
#$ -P roslin_macqueen_lab

module load igmm/apps/vcftools/0.1.13

mkdir /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/poolsnp_results

VCF=/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/hamour_final.vcf.gz
OUTPUT=/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/poolsnp_results

vcftools --gzvcf $VCF --min-alleles 2 --max-alleles 2 --recode --out $OUTPUT/hamour_vcf_biallelic

# compress the vcf output
gzip -v $OUTPUT/hamour_vcf_biallelic".recode.vcf"
