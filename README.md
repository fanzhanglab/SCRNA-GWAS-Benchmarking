# SCRNA-GWAS-Benchmarking
This repository contains the work/pipeline done in ... to benchmark two recent methods for integrating single cell transcriptomics (RNA-seq) and GWAS summary statistics to identify pathogenically relevant cell clusters and the genetically linked genes underlying them.

## Repository Structure: 
The pipeline code used can be found in **src directory** and includes:
1. 00A: Preprocess scRNA-seq
2. 00B: Preprocess summary statistics (GWAS)
3. 01: MAGMA & Gene Alias Matching
4. 02: scDRS
5. 03: scGWAS
6. 04: scPagwas

Data and Output used for references of format and to rerun our analysis can be found in **data** and **output** directories.

Jupyter notebooks with the analysis used to generate figures and results are found in the **analysis directory**

## Dependencies:
- If having problems with dependencies, we'd recommend you look at the original Githubs (listed below) regarding the problem step as those would be most up to date. The general dependencies to run our pipeline include data.table, ggplot2, tidyverse (R) and python >3.1

## Other Resources
- scDRS Github: https://github.com/martinjzhang/scDRS
- scGWAS Github: https://github.com/ElkonLab/scGWAS
- scPagwas Github: https://github.com/sulab-wmu/scPagwas
- MAGMA Documentation and Software: https://ctg.cncr.nl/software/magma
- FUMA Website: https://fuma.ctglab.nl/

## Citations
This work is currently available on [BioRxiv](https://www.biorxiv.org/content/10.1101/2024.06.17.599349v1) and can be cited as "Townsend, H. A., Rosenberger, K., Vanderlinden, L., Inamo, J., & Zhang, F. (2024). Single-cell based integrative analysis of transcriptomics and genetics reveals robust associations and complexities for inflammatory diseases. bioRxiv. https://doi.org/https://doi.org/10.1101/2024.06.17.599349." 

[scDRS](https://www.nature.com/articles/s41588-022-01167-z) can be cited with "Zhang*, Hou*, et al. "Polygenic enrichment distinguishes disease associations of individual cells in single-cell RNA-seq data", Nature Genetics, 2022."

[scGWAS](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-022-02785-w) can be cited with "Jia, Hu, et al. "scGWAS: landscape of trait-cell type associations by integrating single-cell transcriptomics-wide and genome-wide association studies", Genome Biol, 2022"

[MAGMA](http://journals.plos.org/ploscompbiol/article?id=10.1371%2Fjournal.pcbi.1004219) can be cited with "de Leeuw C, Mooij J, Heskes T, Posthuma D (2015): MAGMA: Generalized gene-set analysis of GWAS data. PLoS Comput Biol 11(4): e1004219. doi:10.1371/journal.pcbi.1004219"

[FUMA](https://doi.org/10.1038/s41467-017-01261-5) can be cited with "Watanabe, K., Taskesen, E., van Bochoven, A. et al. Functional mapping and annotation of genetic associations with FUMA. Nat Commun 8, 1826 (2017). https://doi.org/10.1038/s41467-017-01261-5"




