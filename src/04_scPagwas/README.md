## scPagwas

### Preprocessing
* Preprocessing of scRNA-seq data can be found in 00A_Preprocess_scRNA
* GWAS summary statistics were reformatted with the column names rsid, chrom, pos, A1, A2, beta, se, and Pval. Although not provided in the summary statistics, a maf column was also added with a fixed number of 0.8 since this is used as an initial filtering column (0.8 was set so no SNPs are filtered out).

### Running scPagwas
1. R script run_scPagwas.R gives the general code to run scPagwas that we used (paths are nonspecific). We used all default settings.
2. run_scpagwas.sh gives the sbatch script used to run this R script on a cluster.

### Additional Details
* Well documented scPagwas vignettes can be found at their [website](https://dengchunyu.github.io/about/) with DataPrepare category detailing the preprocessing steps and example usage and analysis being available with the RoutineUse and FlexibleUse categories.
