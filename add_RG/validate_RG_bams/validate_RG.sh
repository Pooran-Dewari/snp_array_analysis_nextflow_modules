# run this script from the directory that contains RG-added bam files

module load igmm/apps/samtools/1.16.1
module load igmm/apps/picard/2.25.4
module load roslin/java/18.0.2

ls *bam | while read filename;
do
    samtools view -H $filename | grep "@RG" 
    samtools flagstat $filename > $filename"flagstat"
    picard ValidateSamFile I=$filename MODE=SUMMARY > $filename"_picardSummary"
done
