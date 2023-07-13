## scGWAS  
Steps to run scGWAS  

1. Preprocess scRNA-seq data according to the preprocessing steps in the script src/00A_Preprocess_scRNA/process_sc_data_celltypes, or the script found on author's [GitHub repository](https://github.com/bsml320/scGWAS/blob/main/analysis/0_1.prepare_scRNAseq.R). This step pseudobulks the scRNAseq data, to get the average gene expression per celltype.  
2. Run MAGMA according to the script src/01_MAGMA_Gene_Alias/run_magma.sh   
3. Transform MAGMA results using the Box cox transformation, from the authors GitHub repository, or the script found src/03_scGWAS/box_cox_transform.R
4. Next, run scGWAS using the generic script src/03_scGWAS/run_scGWAS.sh. Be sure to modify file path names. scGWAS is run using a configure file, and more detail can be found at the author's  [GitHub repository](https://github.com/bsml320/scGWAS/blob/main/analysis/explanation_configure.md). Another example configure file can be found at src/03_scGWAS/config.txt
5. Finally, define significance by using the script src/03_scGWAS/define_sig.R 