# Analysis:
This section contains the jupyter notebooks used to generate the figures used in the manuscript. Importantly, many of the aesthetic natures of the figures (ie labels) were added/edited in Inkscape to make them more user friendly for visualization.
## Comparing scGWAS & scDRS
* Folder: 0A_scGWAS_scDRS
### Cell Types
* Folder: CT_Clusters

Cell Type significance analysis (RA):
* File: RA_SCDRS_SCGWAS_Results.ipynb
* Associated Figures: Figure 2, Supplemental Figure 1
* Description of Analysis: Look at the significant cell types/clusters according to scDRS and scGWAS and compare.

Cell Type significance analysis (UC):
* File: UC_SCDRS_SCGWAS_Results.ipynb
* Associated Figures: Figure 2, Supplemental Figure 2
* Description of Analysis: Look at the significant cell types/clusters according to scDRS and scGWAS and compare.

### Genes
* Folder: Genes

Gene comparison analysis: 
* File: Gene_analysis_scGWASscDRS.ipynb
* Purpose of Analysis: Assess how significant scGWAS gene modules and MAGMA genes correlate to scDRS disease scores
* Associated Figures: Supplemental Figure 2, Figure 3, Supplemental Figure 3

Assessing MERTK+ pathway genes & NK-8 scGWAS gene expression:
* File: MERTK+_NK_geneanalysis.ipynb
* Purpose of Analysis: See if the MERTK+ clusters were not identified by scGWAS as having significant gene modules since the significant genes are not found in pathways according to the scGWAS pathway modules file. Also, investigate why scGWAS called NK-8 as having many significant gene modules despite scDRS not calling it as significant.
* Associated Figures: Supplementary Table 4

### Other
scDRS Heterogeneity:
* File: SCDRS_heterogeneity.ipynb
* Purpose of Analysis: See how scDRS disease heterogeneity scores relate to annotated heterogeneity (large scale cell types vs annoated nuanced cell clusters) and potential confounding factors (number of cells & cell type)
* Associated Figurees: Supplemental Figures 4 & 5
-----------------------------------------------------------------------
## Distinguishing pathological cell clusters across similar diseases
* Folder: 0B_Dist_path

Cell Type significance analysis (AS vs RA):
* File: Compare_AS_RA.ipynb
* Purpose of Analysis: Compare scDRS results for AS and RA to see if different significant pathological cell types can distinguish the two. Check results are consistent with different MAGMA window sizes.
* Associated Figures: Figure 4, Supplemental Figure 6

Cell Type significance analysis (CD vs UC):
* File: Compare_UC_CD.ipynb
* Purpose of Analysis: Compare scDRS results for CD and UC to see if different significant pathological cell types can distinguish the two. Check results are consistent with different MAGMA window sizes.
* Associated Figures: Figure 4, Supplemental Figure 7
-----------------------------------------------------------------------
## Impact of preprocessing steps
MAGMA window comparison:
* File:
* Purpose of Analysis: See if scDRS results for RA are consistent across the most commonly used MAGMA window sizes.
* Associated Figures: Figure 5, Supplementary Figure 6

GWAS Power:
* File:
* Purpose of Analysis: Evaluate the consistency of results with different cohorts for RA
* Associated Figures: Supplemental Figure 7

Alternatives to MAGMA:
* File:
* Purpose of Analysis: Assess results when using FUMA (incorporates non-positional methods to link SNPs to genes and get gene-level summary statistics) either in combination with or separate to postitional based methods (MAGMA)
* Associated Figures:
