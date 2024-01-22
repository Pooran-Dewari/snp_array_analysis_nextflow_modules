## while fixing the vcf with py script, the header will go missing. We need to add header manually for grenedalf later

### you can either use `add_header.sh` script to achieve this, or manually as follows

#### first, extract header
 ```
zcat hamour_vcf_biallelic.recode.vcf.gz | grep '#' > header.txt
```
#### now manually, need to replace ##FORMAT=<ID=AD... line with this one below
```
##FORMAT=<ID=AD,Number=R,Type=Integer,Description="Allelic depths for the ref and alt alleles in the order listed">
```
#### concat header file with the vcf
```
cat header.txt hamour_biallelic_fixed.vcf > hamour_biallelic_fixed_withHeader.vcf
```

### we will use <hamour_biallelic_fixed_withHeader.vcf> for grenedalf analysis
