#!/bin/bash
## This file roughly follows the code from https://github.com/martinjzhang/scDRS/issues/2

MAGMA_DIR="/Users/hopekirby/Downloads/magma_v1.10_mac" #insert path to magma
OUTPUT_DIR="/Users/hopekirby/Desktop/SCRNA-GWAS-Benchmarking/output/MAGMA/UC" 

GENE_FILE="/Users/hopekirby/Desktop/SC_GWAS_Bench/data/MAGMA/NCBI37.3/NCBI37.3.gene.loc"
B_FILE="/Users/hopekirby/Desktop/SC_GWAS_Bench/data/MAGMA/g1000_eur/g1000_eur"
SUM_STATS="../../data/GWAS/04_21_2023_pd_rsidchrposa1a2_EUR_noMHC.txt"
N=97173

## RA
# file used for RA: /rsid_based_files/04_21_2023_pd_rsidchrposa1a2_EUR_noMHC.txt
# N used for RA: 97173

## UC Simile
# file used for UC: /GWAS/UC/Simile_rsid_pval_2023_06_08.txt
# N used for UC: included in file (pval $dsdf ncol='N' use='SNP,Pval')

## UC 2017 (de Lange)
# file used for UC2017: /rsid_based_files/06_20_2023_pd_rsidchrposa1a2_UC2017_noMHC.txt
# N used for UC 2017: 59957

# Make output directory if doesn't already exist
mkdir $OUTPUT_DIR

# ## ======= WINDOW 0bp ==========
# # Make a gene annotation file for MAGMA (using the desired window)
# $MAGMA_DIR/magma \
#    --annotate window=0 \
#    --snp-loc $SUM_STATS \
#    --gene-loc $GENE_FILE \
#    --out $OUTPUT_DIR/Syn_annots0 # name of annotations file
   
   
# # Get the Gene Scores
# $MAGMA_DIR/magma \
#     --bfile $B_FILE \
#     --pval $SUM_STATS use='SNP,Pval' N=$N \
#     --gene-annot $OUTPUT_DIR/Syn_annots0.genes.annot \
#     --out $OUTPUT_DIR/0kb_win
    
# ## ======= WINDOW 5bp ==========
# # Make a gene annotation file for MAGMA (using the desired window)
# $MAGMA_DIR/magma \
#    --annotate window=5 \
#    --snp-loc $SUM_STATS \
#    --gene-loc $GENE_FILE \
#    --out $OUTPUT_DIR/Syn_annots5 # name of annotations file
   
   
# # Get the Gene Scores
# $MAGMA_DIR/magma \
#     --bfile $B_FILE \
#     --pval $SUM_STATS use='SNP,Pval' N=$N \
#     --gene-annot $OUTPUT_DIR/Syn_annots5.genes.annot \
#     --out $OUTPUT_DIR/5kb_win
    
## ======= WINDOW 10bp ==========
# Make a gene annotation file for MAGMA (using the desired window)
$MAGMA_DIR/magma \
   --annotate window=10 \
   --snp-loc $SUM_STATS \
   --gene-loc $GENE_FILE \
   --out $OUTPUT_DIR/Syn_annots10 # name of annotations file
   
   
# make the directory for output if not already made
$MAGMA_DIR/magma \
    --bfile $B_FILE \
    --pval $SUM_STATS use='SNP,Pval' N=$N \
    --gene-annot $OUTPUT_DIR/Syn_annots10.genes.annot \
    --out $OUTPUT_DIR/10kb_win
    
# ## ======= WINDOW 50 35bp ==========
# # Make a gene annotation file for MAGMA (using the desired window)
# $MAGMA_DIR/magma \
#    --annotate window=50,35 \
#    --snp-loc $SUM_STATS \
#    --gene-loc $GENE_FILE \
#    --out $OUTPUT_DIR/Syn_annots5035 # name of annotations file
   
   
# # make the directory for output if not already made
# $MAGMA_DIR/magma \
#     --bfile $B_FILE \
#     --pval $SUM_STATS use='SNP,Pval' N=$N \
#     --gene-annot $OUTPUT_DIR/Syn_annots5035.genes.annot \
#     --out $OUTPUT_DIR/5035kb_win

# ## ======= WINDOW 100bp ==========
# # Make a gene annotation file for MAGMA (using the desired window)
# $MAGMA_DIR/magma \
#    --annotate window=100 \
#    --snp-loc $SUM_STATS \
#    --gene-loc $GENE_FILE \
#    --out $OUTPUT_DIR/Syn_annots100 # name of annotations file
   
   
# # make the directory for output if not already made
# $MAGMA_DIR/magma \
#     --bfile $B_FILE \
#     --pval $SUM_STATS use='SNP,Pval' N=$N \
#     --gene-annot $OUTPUT_DIR/Syn_annots100.genes.annot \
#     --out $OUTPUT_DIR/100kb_win