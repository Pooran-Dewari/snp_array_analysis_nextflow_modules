#!/usr/bin/env nextflow
nextflow.enable.dsl=2


params.genome_index = file("$baseDir/genome/fEpiCoi_cnag1_curated_primary.no_mt.fa")

include { TRIM } from './modules/trim.nf'

Channel
  .fromFilePairs("$baseDir/raw_fq/*_{1,2}.fq.gz", checkIfExists:true)
  .set{ paired_reads }

workflow {

    genome = params.genome_index
    TRIM(paired_reads)
}
