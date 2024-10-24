#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=15
#SBATCH --mem=300gb
#SBATCH --time=72:00:00
#SBATCH --qos=mem
#SBATCH --output=run_scpagwas-%j.out
#SBATCH --partition=amem
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hoto7260@colorado.edu


export r_app_version="4.4.1"

echo "Scratch Directory:" $SCRATCHDIR
echo "CURC Container Directory OOD:" $CURC_CONTAINER_DIR_OOD
echo "User:" $USER

echo "Starting Script"
export OPENBLAS_NUM_THREADS=1

apptainer exec --bind /projects,$SCRATCHDIR,$CURC_CONTAINER_DIR_OOD --overlay /projects/$USER/.rstudioserver/rstudio-${r_app_version}/rstudio-server-${r_app_version}_overlay.img:ro $CURC_CONTAINER_DIR_OOD/rstudio-server-${r_app_version}.sif Rscript /path/to/script/run_scpagwas.R > /path/to/e_and_o/run_scpagwas_RA_out.out

echo "Done!"
