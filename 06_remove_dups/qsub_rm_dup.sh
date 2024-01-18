#!/bin/sh

#$ -V -cwd
#$ -l h_rt=14:00:00 ###HH:MM:SS
#$ -l h_vmem=60G #this process requires high memory to dump temp files; make sure >= 60 Gb
#$ -pe sharedmem 4

module load igmm/apps/picard/2.25.4
module load roslin/java/18.0.2

/exports/eddie/scratch/pdewari/hamour/nextflow run workflow_rm_dup.nf
