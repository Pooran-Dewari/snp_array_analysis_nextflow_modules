#!/bin/sh

#$ -V -cwd
#$ -l h_rt=14:00:00 ###HH:MM:SS
#$ -l h_vmem=20G
#$ -pe sharedmem 12

# make sure you are using recent version of samtools to avoid issues with -o option
module load igmm/apps/samtools/1.16.1
module load roslin/java/18.0.2

/exports/eddie/scratch/pdewari/hamour/nextflow run workflow_sortBAM.nf
