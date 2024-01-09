# make sure script is run from the base directory where RG-added bam files are located

ls *bam | while read filename;
do
    samtools view -H $filename | grep "@RG" 
done
