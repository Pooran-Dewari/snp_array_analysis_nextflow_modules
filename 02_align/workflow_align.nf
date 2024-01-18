#!/usr/bin/env nextflow
nextflow.enable.dsl=2


params.genome_index = file("$baseDir/genome/fEpiCoi_cnag1_curated_primary.no_mt.fa")

include { BWA } from './modules/bwa.nf'

Channel
  .fromFilePairs("$baseDir/trimmed/*{1,2}_val_{1,2}.fq.gz", checkIfExists:true)
  .set{ paired_reads }

workflow {

    genome = params.genome_index
    BWA(paired_reads, genome)
}
