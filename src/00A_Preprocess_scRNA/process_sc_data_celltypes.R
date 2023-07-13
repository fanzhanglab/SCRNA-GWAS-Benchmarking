#Script adapted from scGWAS GitHub repository: https://github.com/bsml320/scGWAS/tree/main

#!/usr/bin/env Rscript 	
sessionInfo()

library(Matrix)

#Load data 
#*add your specific paths here*
path_to_scRNAseq = ""
path_to_metadata = ""
sc_data_norm = readRDS(path_to_scRNAseq)
sc_metadata = readRDS(path_to_metadata)
#Subset sc data to match metadata (if required)
sc_data_norm = sc_data_norm[,sc_metadata$cell]

#Check if cells are in the same order from metadata to scRNA-seq data 
res = sum(sc_metadata$cell == colnames(sc_data_norm))
res == length(sc_metadata$cell)
res == length(colnames(sc_data_norm))

#check cluster names 
colnames(sc_metadata)
#cluster_name for RA
unique(sc_metadata$cell_type)

#Change column names in data from cell ID to the associated cell types 
#Now the data is in the format of genes=rows, columns=cell types 
colnames(sc_data_norm) = c(sc_metadata$cell_type)

#Filter genes by threshold:
apply(sc_data_norm, 1, function(u)sum(u==0)/length(u)) -> rowCheck
sc_data_norm = sc_data_norm[which(rowCheck < 0.95),]

#Now we need the data in the format of:
#row=gene, column=ONE cell type
#So we need to calculate the avg expression of each gene for each UNIQUE cell type
#average log-transformed CPM for each gene in each cell type
#(average across all cells assigned to the corresponding cell type)

#Getting a list of the unique cell types 
cell_types = sort(unique(colnames(sc_data_norm)))

#Creating a matrix to store the new results 
avg_log_cpm = matrix(0, nrow=nrow(sc_data_norm), ncol=length(cell_types))
colnames(avg_log_cpm) = c(cell_types)

#Calculate average expression for each gene for each cell type  
for(k in 1:nrow(sc_data_norm)){
  tapply(sc_data_norm[k, ], sc_metadata$cell_type, mean) -> u
  avg_log_cpm[k, ] = u[cell_types]
}
rownames(avg_log_cpm) = rownames(sc_data_norm)

qua.cell_types = setdiff(colnames(avg_log_cpm), "NA" )
avg_log_cpm = avg_log_cpm[, qua.cell_types]

#Write path to where you want to save your data
path_to_save = ""
write.table(cbind(gene=rownames(avg_log_cpm), avg_log_cpm), file=path_to_save, row.names=F, quote=F, sep="\t")
