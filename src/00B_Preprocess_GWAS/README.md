## 00B Preprocessing GWAS Summary Statistics
This code is contained mostly as a jupyter notebook since the original format of the summary statistics and exact filtering desires can be flexible.

The jupyter notebook explains the steps and some example of output/timing but a summary is here:
1. If your summary statistics do not include RSIDs, Parts 1-4 of the jupyter notebook should be followed:
    1. Make bed files to allow mapping of SNPs to RSID database (**Get_rsid_baseed_sumstats.ipynb** Step 1)
    2. Map the SNPs to the RSID databasee (**get_rsID.sh**)
    3. Get final RSID values while addressing slight mismatches (**Get_rsid_baseed_sumstats.ipynb** Step 3)
    4. Address duplicate RSIDs and multimapped SNPs (**Get_rsid_baseed_sumstats.ipynb** Step 4)
2. Remove MHC region (**Get_rsid_baseed_sumstats.ipynb** Step 5)
3. Pandas sometimes can't register extremely low P-values properly, instead rounding them as 0 which the first step in scDRS will read as an improper P-value. This edge mark is at about 1e-300 so we changed 0 values according to pandas to avoid this problem. (**Get_rsid_baseed_sumstats.ipynb** Step 6)
