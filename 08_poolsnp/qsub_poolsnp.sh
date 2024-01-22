#!/bin/sh

#$ -V -cwd
#$ -l h_rt=60:00:00 ###HH:MM:SS
#$ -l h_vmem=60G
#$ -pe sharedmem 4
#$ -P roslin_macqueen_lab

module load igmm/apps/parallel/20230522
module load igmm/apps/python/3.10.6

bash /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/PoolSNP.sh \
mpileup=/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/hamour_all.mpileup \
output=/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/hamour_final \
reference=/exports/eddie/scratch/pdewari/hamour/genome/fEpiCoi_cnag1_curated_primary.no_mt.fa \
names=hamour_alwakra,hamour_aqua,hamour_doha,hamour_shamal \
max-cov=0.95 \
min-count=10 \
min-freq=0.01 \
miss-frac=0.1 \
base-quality 15 \
jobs=4 \
badsites=1 \
allsites=0

# this script will first dump temp files into $output
# it will then collate all results into one $output.vcf.gz file  & empty the $output
