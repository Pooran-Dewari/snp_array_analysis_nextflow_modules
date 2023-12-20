#!/usr/bin/env nextflow

process BWA {
  tag "$sampleId"
  debug true

  publishDir 'results/sams/', mode: 'copy', overwrite: false, pattern: "*"

  input:
  tuple val(sampleId), path(reads)
  val genome

  output:
  path "*.sam"

  script:
  """
  bwa mem $genome $reads -t 5 > ${sampleId}.sam
  """
}
