#!/usr/bin/env nextflow

process SORT_BAM {
  debug true

  publishDir 'results/bams/sorted', mode: 'copy', overwrite: false

  input:
  path bam

  output:
  path "${bam}_sorted.bam"
  path "${bam}_sorted.bam.bai"

  script:
  """
  samtools sort -@3 $bam -o ${bam}_sorted.bam
  samtools index -@3 ${bam}_sorted.bam
  """
}
