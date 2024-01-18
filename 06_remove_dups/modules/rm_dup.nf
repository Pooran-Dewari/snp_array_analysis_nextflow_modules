#!/usr/bin/env nextflow

process REMOVE_DUPS {
  debug true

  publishDir 'results/bams/RG/dup_removed/', mode: 'copy', overwrite: false

  input:
  path bam

  output:
  path "*dup_removed.bam"
  path "*dups_metrics.txt"

  shell:
  '''
  picard MarkDuplicates I=!{bam} \
  REMOVE_DUPLICATES=true \
  VALIDATION_STRINGENCY=LENIENT \
  AS=true \
  METRICS_FILE=!{bam}_dups_metrics.txt \
  OUTPUT=!{bam}_dup_removed.bam \
  TMP_DIR=results/bams/RG
  '''
}
