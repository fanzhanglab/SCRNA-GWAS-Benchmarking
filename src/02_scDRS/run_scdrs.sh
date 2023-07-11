#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=15
#SBATCH --time=03:20:00 
#SBATCH --output=run_scdrs_pp-%j.out


echo "Activating conda"
conda activate /path/to/env

# # Select top 1,000 genes and use Pvalues
DATA_DIR="path/to/data/directory/" 
SCDRS_OUTPUT_DIR="/path/to/results/directory/for/scdrs"
MAGMA_OUTPUT_DIR="/path/to/MAGMA/pval/file"
SCDRS_DIR="/path/to/scDRS/bin/" 


echo Munge-GS
/usr/bin/time scdrs munge-gs \
    --out-file $SCDRS_OUTPUT_DIR/UCorRA.gs \
    --pval-file $MAGMA_OUTPUT_DIR/UCorRA_pval.tsv \
    --weight zscore \
    --n-max 1000 > $SCDRS_OUTPUT_DIR/scdrs_munge-gs_out_date.txt

echo Compute scDRS scores
/usr/bin/time scdrs compute-score \
    --h5ad-file $DATA_DIR/UCorRA.h5ad\
    --h5ad-species human \
    --gs-file $SCDRS_OUTPUT_DIR/UCorRA.gs \
    --gs-species human \
    --out-folder $SCDRS_OUTPUT_DIR \
    --cov-file $DATA_DIR/SC_data/UCorRA.cov \
    --flag-filter-data True \
    --flag-raw-count False \
    --n-ctrl 1000 \
    --flag-return-ctrl-raw-score True \
    --flag-return-ctrl-norm-score True > $SCDRS_OUTPUT_DIR/scdrs_compute-score_out_scdrs_date.txt
    
echo Perform Downstream Analysis
# This will include --group-analysis (for a given cell group level annotation), 
#   --gene-analysis (Pearson's correlation b/n expression of each gene & the scDRS disease score)

## Change h5ad file according to group level desired (clusters=micro, large cell types=macro)
##  the score file prefix (UC or RA) must be the same trait as used before
/usr/bin/time scdrs perform-downstream \
    --h5ad-file $DATA_DIR/UCorRA.h5ad\
    --score-file $SCDRS_OUTPUT_DIR/UCorRA.full_score.gz \
    --out-folder $SCDRS_OUTPUT_DIR \
    --group-analysis cell_type \
    --gene-analysis\
    --flag-filter-data True\
    --flag-raw-count True
#   --corr-analysis causal_variable,non_causal_variable,covariate\
 
 
echo "== End of Job =="