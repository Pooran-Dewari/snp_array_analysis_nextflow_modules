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

we also need a modified fai file as a reference to lexicographic order of chromosomes, this can be created using the indexed genome fai file
```
cat genome/fEpiCoi_cnag1_curated_primary.no_mt.fa.fai  | LC_ALL=C sort > genome/fEpiCoi_cnag1_curated_primary.no_mt.lexic.fai
```

use the new lexicographic fai file as a parameter for the option `--reference-genome-fai-file`
