## snpEff analysis

On Eddie, this requires a node to run the latest version of java
```
qlogin -l h_vmem=20G
module load roslin/java/18.0.2
```
### download, install, configure genome etc
#### download snpEff
```
#Download the latest version of snpeff
wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip

#unzip file
unzip snpEff_latest_core.zip

#this will create a dir snpEff with the following structure, only dirs are shown below
tree snpEff -d
```

tree structure of the snpEff dir
snpEff \
├── data \
│   └── fEpiCoi_cnag1 \
├── examples  \
├── exec \
├── galaxy \
│   └── tool-data  \
└── scripts  \
    └── gsa  \
8 directories 

#### Copy genome fasta and gff3/gtf files.
```
cd snpEff/data
mkdir fEpiCoi_cnag1
cd fEpiCoi_cnag1f1
cp <path/to/genome/fasta/file> sequences.fa #this is your genome file fasta format
cp <paht/to/gff3/file> genes.gff3

# directory structure should be like this
# data/
# └── fEpiCoi_cnag1
#    ├── genes.gff3
#    └── sequences.fa
```

#### Configure and build custom genome
```
nano  nano snpEff.config
# to go to the end of file, run these two commands
Ctrl + _
Ctrl + v

#now append the following two lines and save the config file

# hamour
fEpiCoi_cnag1.genome: fEpiCoi_cnag1

# once you have edited the config file, build the genome using command below
cd snpEff
java -jar snpEff.jar build -gff3 -v fEpiCoi_cnag1
```

