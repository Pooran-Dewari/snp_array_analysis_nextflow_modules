#!/usr/bin/env nextflow

process SAM_TO_BAM {
  debug true

  publishDir 'results_test/bams/', mode: 'copy', overwrite: false

  input:
  path sam

  output:
  path "*.bam"

  script:
  """
  samtools view -bS -@3 $sam -o ${sam}.bam
  """
}
