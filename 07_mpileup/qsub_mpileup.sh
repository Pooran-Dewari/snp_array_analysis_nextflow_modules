#!/bin/sh

#$ -V -cwd
#$ -l h_rt=24:00:00 ###HH:MM:SS
#$ -l h_vmem=40G
#$ -pe sharedmem 4

module load igmm/apps/samtools/1.16.1
module load roslin/java/18.0.2

cd /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed

# make sure you have bamfiles.txt file in <.../bams/RG/dup_removed> dir
# bamfiles.txt files is attached, essentially it's one bam file per line

samtools mpileup -q 15 -Q 0 -d 8000 -R -A -B \
        -f /exports/eddie/scratch/pdewari/hamour/genome/fEpiCoi_cnag1_curated_primary.no_mt.fa \
        -b ./bamfiles.txt \
        -o hamour_all.mpileup
