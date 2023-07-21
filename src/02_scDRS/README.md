## scDRS

Details of installation and the code used can be found at the original [Github repository](https://github.com/martinjzhang/scDRS), specifically following the documentation found [here](https://martinjzhang.github.io/scDRS/index.html#installation) for installation and [here](https://martinjzhang.github.io/scDRS/reference_cli.html) for using the CLI. We used v1.0.2 for our analysis using the git clone installation method.

All code to produce the necessary covariates and .h5ad files can be found in the 00A_Preprocess_scRNA folder. An example covariates file can be found in the data/SC_data folder. Similarly, alll code necessary to produce the pval-file used can be found in the 00B_Preprocess_GWAS folder.

1. scdrs munge-gs:
  - select the top 1000 genes using zscore weights.
  - *Important Note*: We used p-values but if a user wants to use zscores as the statistic, make sure to use --zscore-file rather than --pval-file.

2. scdrs compute-score
  - The gs-file used should be the same as that produced in the previous step
  - This will produce the files indicating the disease scores of indvidual cells, the .score.gz is used for easy visualization while the full.score.gz is required for downstream analysis
  - *Important Note:* This only needs to be run once per cell type annoation. For example, if wanting to look at large scale cell groups and smaller scale cell clusters, you need two separate .h5ad files only for the downstream analysis as the individual cell scores should be identical.

3. scdrs perform-downstream
  - We chose to just do group-analysis and gene-analysis
  - *Importante Note:* If wanting to look at different levels of cell groups (e.g. cell types vs smaller scale cell clusters), this will need to be run multiple times depending on the different levels of groups (e.g. twice for the previous example) with the appropriate .h5ad files. 
  - *Important Note:* The gene-analysis looks at the correlation gene expression with disease score across ALL cells provided in the .h5ad file. Therefore, if you only want to look at these relationships within a certain cluster or group of cells, you will need an .h5ad file with just those cells. The same score file can be used.
