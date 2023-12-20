#!/bin/sh

#$ -V -cwd
#$ -l h_rt=60:00:00 ###HH:MM:SS
#$ -l h_vmem=20G
#$ -pe sharedmem 16
#$ -P roslin_macqueen_lab

module load igmm/apps/TrimGalore/0.6.6
module load igmm/apps/cutadapt/1.16
module load igmm/apps/FastQC/0.11.9

./nextflow run workflow_trim.nf
