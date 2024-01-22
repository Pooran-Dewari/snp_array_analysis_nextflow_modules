#!/bin/sh

#$ -V -cwd
#$ -l h_rt=00:30:00 ###HH:MM:SS
#$ -l h_vmem=60G
#$ -pe sharedmem 1

cd /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/poolsnp_results

GRENEDALF=./grenedalf_v0.3.0_linux_x86_64
VCF=hamour_biallelic_fixed_withHeader.vcf
REF=/exports/eddie/scratch/pdewari/hamour/genome/fEpiCoi_cnag1_curated_primary.no_mt.fa.fai
OUTPUT=./grenedalf_output

$GRENEDALF frequency --vcf-path $VCF --reference-genome-fai-file $REF  --write-sample-alt-freq  --separator-char tab --file-suffix alt-new-vcf --out-dir $OUTPUT
$GRENEDALF frequency --vcf-path $VCF --reference-genome-fai-file $REF  --write-sample-coverage --separator-char tab --file-suffix cov-new-vcf --out-dir $OUTPUT
