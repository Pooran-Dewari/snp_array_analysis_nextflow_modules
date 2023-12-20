#!/bin/sh

#$ -V -cwd
#$ -l h_rt=60:00:00 ###HH:MM:SS
#$ -l h_vmem=20G
#$ -pe sharedmem 16
#$ -P roslin_macqueen_lab

module load roslin/nextflow/22.10.7
module load igmm/apps/bwa/0.7.16

/exports/eddie/scratch/pdewari/hamour/nextflow run workflow_align.nf
