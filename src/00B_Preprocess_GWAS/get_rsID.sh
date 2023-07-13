#!/bin/bash
#!/usr/bin/env scGWAS

#open conda environment 
module purge
module load anaconda
export LD_LIBRARY_PATH=/home/krosenberger@xsede.org/.conda/envs/scGWAS/lib
echo "Activating conda"
conda activate /home/krosenberger@xsede.org/.conda/envs/scGWAS

#bedtools --version

# Sort bed files
sort-bed /projects/fanzhanglab@xsede.org/AHK_Team_Files/data/amp2_RA/GWAS/rsID_bed_files/hg19.snp151.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_hg19.snp151.bed

sort-bed /projects/fanzhanglab@xsede.org/AHK_Team_Files/data/simile_UC/GWAS/06_16_2023_UC2017_original_start_pos.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_original_start_pos.bed

sort-bed /projects/fanzhanglab@xsede.org/AHK_Team_Files/data/simile_UC/GWAS/06_16_2023_UC2017_minus_one_start_pos.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_minus_one_start_pos.bed

sort-bed /projects/fanzhanglab@xsede.org/AHK_Team_Files/data/simile_UC/GWAS/06_16_2023_UC2017_plus_one_start_pos.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_plus_one_start_pos.bed

sort-bed /projects/fanzhanglab@xsede.org/AHK_Team_Files/data/simile_UC/GWAS/06_16_2023_UC2017_minus_two_start_pos.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_minus_two_start_pos.bed

#get rs IDs for SNPs
bedmap --echo --echo-map-id --delim '\t' --skip-unmapped /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_original_start_pos.bed /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_hg19.snp151.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/rsID_pos_original.bed

bedmap --echo --echo-map-id --delim '\t' --skip-unmapped /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_minus_one_start_pos.bed /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_hg19.snp151.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/rsID_pos_plus_one.bed

bedmap --echo --echo-map-id --delim '\t' --skip-unmapped /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_plus_one_start_pos.bed /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_hg19.snp151.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/rsID_pos_minus_one.bed 

bedmap --echo --echo-map-id --delim '\t' --skip-unmapped /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_06_19_2023_UC2017_minus_two_start_pos.bed /projects/krosenberger@xsede.org/scGWAS/data/RA/sorted_hg19.snp151.bed > /projects/krosenberger@xsede.org/scGWAS/data/RA/rsID_pos_minus_two.bed 
