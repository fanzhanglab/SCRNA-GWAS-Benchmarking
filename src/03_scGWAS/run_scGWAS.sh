#!/bin/bash
#!/usr/bin/env scGWAS

#SBATCH --nodes=1 
#SBATCH --ntasks=30     
#SBATCH --time=04:00:00 

#open conda environment 
module purge
module load anaconda
module load jdk
export LD_LIBRARY_PATH=/home/.conda/envs/scGWAS/lib
conda activate /home/.conda/envs/scGWAS

java -jar ../software/scGWAS_r1.jar ../code/config.txt > ../results/scGWAS_out

