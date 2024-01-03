#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { SAM_TO_BAM } from '/exports/eddie/scratch/pdewari/hamour/modules/sam2bam.nf'

Channel
  .fromPath("$baseDir/results/sams/*sam", checkIfExists:true)
  .set{ sam_file }

workflow {

    SAM_TO_BAM(sam_file)
}

