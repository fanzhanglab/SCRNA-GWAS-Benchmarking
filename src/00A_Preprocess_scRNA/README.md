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

## scPagwas
scPagwas requires input in Seurat format (v5). Due to the high computational burden of scPagwas, we removed a small subset cell states that were not found significant by literature searches, scDRS, or scGWAS. The following R code indicates how we did this.
```
##### RA #####
counts <- readRDS("/projects/fanzhanglab@xsede.org/data/amp_phase2_ra/qc_mRNA_count_matrix.rds")
# read in the metadata for just the White individuals
meta <- readRDS(paste0(sc_dir, "white_amp2RA_metadata_04_24_23.rds"))
rownames(meta) <- meta$cell
# only keep the data for counts that are found in the metadata
counts <- counts[,meta$cell]
Single_data<-Seurat::CreateSeuratObject(
  counts,
  assay = "RNA",
  meta.data=meta
)
# Normalize and Scale Counts
Single_data <- Seurat::NormalizeData(Single_data, normalization.method = "LogNormalize", scale.factor = 10000)
# Filter out some cell states
idx <- which(!Single_data$cell_type %in% "Endothelial")
unique(Single_data$cell_type)
Single_data = Single_data[,idx]
dim(Single_data)
idx <- which(!Single_data$cluster_name %in% c("F-0: PRG4+ CLIC5+ lining", "F-1: PRG4+ lining", 
                                              "F-4: DKK3+ sublining", "F-3: POSTN+ sublining", 
                                              "F-8: RSPO3+ intermediate", "F-6: CXCL12+ SFRP1+ sublining", 
                                              "Mu-0: Mural", "F-5: CD74-hi sublining"))
Single_data = Single_data[,idx]
dim(Single_data)
saveRDS(Single_data, "/scratch/alpine/htownsend@xsede.org/scpagwas/Seurat_object_white_noEndFib_amp2RA_10.18.24.rds")

##### UC #####
counts <- readRDS("/projects/fanzhanglab@xsede.org/data/Ulcerative_Colitis_Smillie_2019/count_qc_ulcerative_colitis_gut.rds")
## read in the metadata for just the White individuals
meta <- as.data.frame(readRDS(paste0(sc_dir, "meta_qc_ulcerative_colitis_gut_celltypes_covariates_2023_06_08.rds")))
rownames(meta) <- meta$cell
# Filter out some cell states
meta <- meta[!meta$macro %in% c("Glia", "Endothelial"),]
meta <- meta[!meta$cluster %in% c("Macrophages", "TA 1", "TA 2"),]
# only keep the data for counts that are found in the metadata
counts <- counts[,meta$cell]

Single_data<-Seurat::CreateSeuratObject(
  counts,
  assay = "RNA",
  meta.data=meta
)
Single_data <- Seurat::NormalizeData(Single_data, normalization.method = "LogNormalize", scale.factor = 10000)
saveRDS(Single_data, "/scratch/alpine/htownsend@xsede.org/scpagwas/Seurat_object_Smillie2017_10.22.24.rds")
```

## scGWAS
scGWAS preprocessing involves pseudobulking and transforming gene expression based on predefined groups. This can be done using the script [].
