library(scPagwas)
library(Seurat)

sessionInfo()

## PARAMETERS
# use the gwas file that was changed to match their requried format
gwas_file = "/projects/fanzhanglab@xsede.org/AHK_Team_Files/data/amp2_RA/GWAS/scpagwas_format_04_21_2023_pd_rsidchrposa1a2_EUR_noMHC.txt"
sc_dir = "/projects/fanzhanglab@xsede.org/AHK_Team_Files/data/amp2_RA/SC_data/white_only/"

print("STARTING")
##############################
## READ IN THE SEURAT OBJECT ##
##############################
Single_data <- readRDS(paste0(out_dir, "Seurat_object_white_amp2RA_10.18.24.rds"))

###############
## RUN MACRO ##
###############
out_dir="RA"
out_prefix="RA_macro"
cat("\nNow doing Large cell type clusters")
# Have the identies be based on the cell types
Idents(Single_data)<-Single_data$cell_type
# Getting system time and memory
tt <- sum(.Internal(gc(FALSE, TRUE, TRUE))[13:14])
system.time(
  Pagwas_object<-scPagwas_main(Pagwas = NULL,
                             gwas_data =gwas_file, # The GWAS Summary statistics files 
                             Single_data =Single_data,# scRNA-seq data in seruat format with "RNA" assays and normalized.
                             output.prefix=out_prefix, # the prefix name for output files
                             output.dirs=out_dir,# the directory file's name for output
                             block_annotation = block_annotation,# gene position in chromosome is provided by package.
                             assay="RNA", # the assays for scRNA-seq data to use.
                             Pathway_list=Genes_by_pathway_kegg,# pathway list is provided by package, including gene symbols.
                             n.cores=15,
                             marg=10000, 
                             chrom_ld = chrom_ld,# The LD data is provided by package.
                             singlecell=T, # Whether to run the singlecell process.
                             celltype=T# Whether to run the celltype process.
  )
)
sum(.Internal(gc(FALSE, FALSE, TRUE))[13:14]) - tt
print(sum(.Internal(gc(FALSE, FALSE, TRUE))[13:14]) - tt)

saveRDS(Pagwas_object, paste0(out_dir, out_prefix, "_pagwasoutput.rds"))
rm(Pagwas_object)
###############
## RUN MICRO ##
###############
cat("\nNow doing Micro clusters")
out_prefix = "RA_micro"
# GET THE cell clusters
Idents(Single_data)<-Single_data$cluster_name
tt <- sum(.Internal(gc(FALSE, TRUE, TRUE))[13:14])
system.time(
  Pagwas_object<-scPagwas_main(Pagwas = NULL,
                               gwas_data =gwas_file, # The GWAS Summary statistics files 
                               Single_data =Single_data,# scRNA-seq data in seruat format with "RNA" assays and normalized.
                               output.prefix=out_prefix, # the prefix name for output files
                               output.dirs=out_dir,# the directory file's name for output
                               block_annotation = block_annotation,# gene position in chromosome is provided by package.
                               assay="RNA", # the assays for scRNA-seq data to use.
                               Pathway_list=Genes_by_pathway_kegg,# pathway list is provided by package, including gene symbols.
                               n.cores=15,
                               marg=10000, 
                               chrom_ld = chrom_ld,# The LD data is provided by package.
                               singlecell=T, # Whether to run the singlecell process.
                               celltype=T# Whether to run the celltype process.
  )
)
sum(.Internal(gc(FALSE, FALSE, TRUE))[13:14]) - tt
print(sum(.Internal(gc(FALSE, FALSE, TRUE))[13:14]) - tt)
saveRDS(Pagwas_object, paste0(out_dir, out_prefix, "_pagwasoutput.rds"))
