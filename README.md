# SCRNA-GWAS-Benchmarking
This repository contains the work/pipeline done in ... to benchmark two recent methods for integrating single cell transcriptomics (RNA-seq) and GWAS summary statistics to identify pathogenically relevant cell clusters and the genetically linked genes underlying them.

## Repository Structure: 
The pipeline code used can be found in **src directory** and includes:
1. 00A: Preprocess scRNA-seq
2. 00B: Preprocess summary statistics (GWAS)
3. 01: MAGMA & Gene Alias Matching
4. 02: scDRS
5. 03: scGWAS

Data and Output used for references of format and to rerun our analysis can be found in **data** and **output** directories.

## Dependencies:
- If having problems with dependencies, we'd recommend you look at the original Githubs (listed below) regarding the problem step as those would be most up to date. The general dependencies to run our pipeline include data.table, ggplot2, tidyverse...

## Other Resources
- scDRS Github: https://github.com/martinjzhang/scDRS
- scGWAS Github: https://github.com/ElkonLab/scGWAS
- MAGMA Documentation and Software: https://ctg.cncr.nl/software/magma

## Citations
scDRS can be cited with [Zhang*, Hou*, et al. "Polygenic enrichment distinguishes disease associations of individual cells in single-cell RNA-seq data", Nature Genetics, 2022.](https://www.nature.com/articles/s41588-022-01167-z)

scGWAS can be cited with [Jia, Hu, et al. "scGWAS: landscape of trait-cell type associations by integrating single-cell transcriptomics-wide and genome-wide association studies", Genome Biol, 2022](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-022-02785-w)

MAGMA can be cited with [de Leeuw C, Mooij J, Heskes T, Posthuma D (2015): MAGMA: Generalized gene-set analysis of GWAS data. PLoS Comput Biol 11(4): e1004219. doi:10.1371/journal.pcbi.1004219](http://journals.plos.org/ploscompbiol/article?id=10.1371%2Fjournal.pcbi.1004219)



