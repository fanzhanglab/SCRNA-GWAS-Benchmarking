## 01 Running MAGMA and fixing unmatched Gene Aliases

**run_magma.sh** indicates the files and code used to run MAGMA at window sizes 0-0kb, 5-5kb, 10-10kb, 50-35kb, and 100kb.

Both scDRS and scGWAS connect GWAS and sc-RNA seq data at the Gene Level which requires that the same annotation and gene aliases be used.
Due to the influx of new annotations and the common use of the hg19 assembly in GWAS makes the likelihood of disrepancies between these datasets in gene names very high. 
Therefore, the **match_aliases.ipynb** script replaces any genes produced by MAGMA not found in the gene list used by the scRNA-seq dataset with the appropriate alias. 
Aliases are first identified by NCBI's Homo_sapiens.gene_info and then by a hand-curated dictionary which can be added to.
The notebook's output is what can be used as direct input for scDRS and scGWAS.

