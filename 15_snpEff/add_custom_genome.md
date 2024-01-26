## snpEff analysis

### download, install, configure genome etc
```
#Download the latest version of snpeff
wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip

#unzip file
unzip snpEff_latest_core.zip
```
Copy genome fasta and gff3/gtf files.
```
cd snpEff/data
mkdir fEpiCoi_cnag1
cd fEpiCoi_cnag1f1
cp <path/to/genome/fasta/file> sequences.fa #this is your genome file fasta format
cp <paht/to/gff3/file> genes.gff3

# directory structure should be like this
data/
└── fEpiCoi_cnag1
    ├── genes.gff3
    └── sequences.fa
```

Configure and build custom genome
```
nano  nano snpEff.config
# to go to the end of file, run these two commands
Ctrl + _
Ctrl + v

#now append the following two lines and save the config file

# hamour
fEpiCoi_cnag1.genome: fEpiCoi_cnag1

# once you have edited the config file, build the genome using command below
java -jar snpEff.jar build -gff3 -v fEpiCoi_cnag1
```

log file for the install should look something like this
```
00:00:00 SnpEff version SnpEff 5.2a (build 2023-10-24 14:24), by Pablo Cingolani
00:00:00 Command: 'build'
00:00:00 Building database for 'fEpiCoi_cnag1'
00:00:00 Reading configuration file 'snpEff.config'. Genome: 'fEpiCoi_cnag1'
00:00:00 Reading config file: /exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/snpEff.config
00:00:01 done
00:00:01 Reading GFF3 data file  : '/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/./data/fEpiCoi_cnag1/genes.gff'
00:00:01 Reading file '/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/./data/fEpiCoi_cnag1/genes.gff'
java.lang.RuntimeException: File not found '/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/./data/fEpiCoi_cnag1/genes.gff'
        at org.snpeff.util.Gpr.reader(Gpr.java:513)
        at org.snpeff.util.Gpr.reader(Gpr.java:484)
        at org.snpeff.snpEffect.factory.SnpEffPredictorFactoryGff.readGff(SnpEffPredictorFactoryGff.java:513)
        at org.snpeff.snpEffect.factory.SnpEffPredictorFactoryGff.create(SnpEffPredictorFactoryGff.java:345)
        at org.snpeff.snpEffect.commandLine.SnpEffCmdBuild.run(SnpEffCmdBuild.java:414)
        at org.snpeff.SnpEff.run(SnpEff.java:1173)
        at org.snpeff.SnpEff.main(SnpEff.java:163)
java.lang.RuntimeException: Error reading file '/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/./data/fEpiCoi_cnag1/genes.gff'
java.lang.RuntimeException: File not found '/exports/eddie/scratch/pdewari/hamour/results/bams/RG/dup_removed/snpEff/snpEff/./data/fEpiCoi_cnag1/genes.gff'
        at org.snpeff.snpEffect.factory.SnpEffPredictorFactoryGff.create(SnpEffPredictorFactoryGff.java:362)
        at org.snpeff.snpEffect.commandLine.SnpEffCmdBuild.run(SnpEffCmdBuild.java:414)
        at org.snpeff.SnpEff.run(SnpEff.java:1173)
        at org.snpeff.SnpEff.main(SnpEff.java:163)
00:00:01 Logging
00:00:02 Checking for updates...
00:00:04 Done.
```
