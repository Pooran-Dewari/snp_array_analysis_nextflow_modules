#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { ADD_RG } from '/exports/eddie/scratch/pdewari/hamour/modules/add_RG.nf'

Channel
  .fromPath("$baseDir/results/bams/sorted/*sorted.bam", checkIfExists:true)
  .set{ sorted_bam }

workflow {

    ADD_RG(sorted_bam)
}
