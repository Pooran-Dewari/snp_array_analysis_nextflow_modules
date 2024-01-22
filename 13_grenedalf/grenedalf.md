# Running grenedalf

for some reason, can't compile grenedalf, so using the precompiled version hosted [here](https://github.com/lczech/grenedalf/releases/tag/v0.3.0)
##### download link below:
```
wget -c https://github.com/lczech/grenedalf/releases/download/v0.3.0/grenedalf_v0.3.0_linux_x86_64
```

after the download, make it executable by:
```
chmod 777 grenedalf_v0.3.0_linux_x86_64
```

check if working fine:
```
./grenedalf_v0.3.0_linux_x86_64 frequency
```

Grenedalf is very strict about the lexicographic order of chromosomes, this can be resolved by using the option `--reference-genome-fai-file` to predefine how chromosomes are ordered in the vcf file
