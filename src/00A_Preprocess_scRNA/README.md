## QC
Both single-cell datasets were quality checked and filtered using the same methods as described in [Cellular deconstruction of inflamed synovium defines diverse inflammatory phenotypes in rheumatoid arthritis. Zhang, F et al. bioRxiv. 2022](https://www.biorxiv.org/content/10.1101/2022.02.25.481990v1)

## scDRS
scDRS requires input in AnnData format (.h5ad). The following code illustrates how these files were created using R based AnnData, and qc-based normalized expression. Cell types used included "macro" (large-scale cell types) and "micro" (fine-scaled clusters) for the purposes of our work.

```
adata_macro <- AnnData(
    X= exp_norm_t)
# add the anems of the cells and genes
adata_macro$obs_names = rownames(exp_norm_t) # cells
adata_macro$var_names = colnames(exp_norm_t) # genes

# add the meta data for cells (cell types)
adata_macro$obs["cell_type"] = meta_data$macro

write_h5ad(adata_macro, paste0(dir,"macro_ct_qc_simile_2023_06_08.h5ad"))
```

For downstream analysis of group heterogeneity of scDRS, it requires the h5ad to include the results from scanpy.pp.neighbors. Therefore, the following code was run for in python for all h5ad files used for scDRS:

```
data_file = "/path/to/h5ad/file"
adata = scanpy.read(data_file)
scanpy.pp.neighbors(adata)
adata.write(data_file)
```
scDRS will also take single-cell level covariates to consider in their analysis. The covariate files used for this work can be found in ../data/SC_data.

## scGWAS
scGWAS preprocessing involves pseudobulking and transforming gene expression based on predefined groups. This can be done using the script [].
