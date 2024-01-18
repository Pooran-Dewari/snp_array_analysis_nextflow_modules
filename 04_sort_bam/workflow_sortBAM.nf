#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { SORT_BAM } from '/exports/eddie/scratch/pdewari/hamour/modules/sort_bam.nf'

Channel
  .fromPath("$baseDir/results/bams/*bam", checkIfExists:true)
  .set{ bam_file }

workflow {

    SORT_BAM(bam_file)
}
