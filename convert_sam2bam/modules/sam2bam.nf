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
  samtools view -bS $sam -o ${sam}.bam
  """
}
