#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { REMOVE_DUPS } from '/exports/eddie/scratch/pdewari/hamour/modules/rm_dup.nf'

Channel
  .fromPath("$baseDir/results/bams/RG/*sortedRG.bam", checkIfExists:true)
  .set{ bam_file }

workflow {

    REMOVE_DUPS(bam_file)
}
