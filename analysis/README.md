# Analysis:
This section contains the jupyter notebooks used to generate the figures used in the manuscript. Importantly, many of the aesthetic natures of the figures (ie labels) were added/edited in Inkscape to make them more user friendly for visualization.
## Comparing Tool Results (0A_Tool_Benchmarking)
### Cell Types
* Folder: CT_Clusters

Cell Type significance analysis (RA):
* File: RA_benchmark_comparison.ipynb
* Associated Figures: Figure 2, Supplemental Figures 1, 2, 9, & 10
* Description of Analysis: Look at the significant cell types/clusters according to scDRS, scGWAS, and scPagwas and compare. Also compare the results between scPagwas and scDRS with scPagwas input. Evaluate the connection between z-scores and ribosomal genes being present.

Cell Type significance analysis (UC):
* File: UC_benchmark_comparison.ipynb
* Associated Figures: Figure 2, Supplemental Figures 1, 2, 9, & 10
* Description of Analysis: Look at the significant cell types/clusters according to scDRS and scGWAS and compare. Also compare the results between scPagwas and scDRS with scPagwas input. Evaluate the connection between z-scores and ribosomal genes being present.

### Genes
* Folder: Genes

Gene comparison analysis: 
* File: Gene_analysis_scGWASscDRS.ipynb
* Purpose of Analysis: Assess how significant scGWAS gene modules and MAGMA genes correlate to scDRS disease scores (using 50-35kb MAGMA windows).
* Associated Figures: Supplemental Figures 4 & 5

* File: Gene_comparison.ipynb
* Purpose of Analysis: Assess how significant scGWAS gene modules and MAGMA genes correlate to scDRS and scPagwas disease scores. Compare gene set enrichment or GO analysis. (Using 10-10kb MAGMA windows when applicable)
* Associated Figures: Figure 3A & B, Supplemental Figure 3 

Assessing MERTK+ pathway genes & NK-8 scGWAS gene expression:
* File: MERTK+_NK_geneanalysis.ipynb
* Purpose of Analysis: See if the MERTK+ clusters were not identified by scGWAS as having significant gene modules since the significant genes are not found in pathways according to the scGWAS pathway modules file. Also, investigate why scGWAS called NK-8 as having many significant gene modules despite scDRS not calling it as significant with 50-35kb MAGMA windows.
* Associated Figures: Supplemental Figure 23, Supplemental Table 10

### Sensitivity and Robustness
* Folder: Sensitivity
  
Possible bias of scoring based on diseased state of tissue:
* File: Evaluate_Disease_Bias.ipynb
* Purpose of Analysis: See how the proportion of cells that come from tissue of different disease states (e.g. duration of RA or inflamed/healthy) changes across cell states and if this bias seems to correlate with scPagwas, scGWAS, or scDRS significant cell-state calls and disease scores
* Associated Figures: Supplemental Figures 11, 12, and 13

Impact of Number of MAGMA genes on scDRS results:
* File: GeneNum.ipynb
* Purpose of Analysis: See how the number of top-ranking MAGMA genes impacts scDRS results in terms of individual disease scores and cell-states called
* Associated Figures: Supplemental Figure 22

Impact of scGWAS Pathway Network file on results
* File: scGWAS_path_comparison_RA.ipynb & scGWAS_path_comparison_UC.ipynb
* Purpose of Analysis: See how the pathway file can impact scGWAS results (significant gene modules and cell states) by using pathway files from PathwayCommons v12 and v14.
* Associated Figures: Figure 3C, Supplemental Figures 6, 7 & 8


### Other
scDRS Heterogeneity:
* File: SCDRS_heterogeneity.ipynb
* Purpose of Analysis: See how scDRS disease heterogeneity scores relate to annotated heterogeneity (large scale cell types vs annoated nuanced cell clusters) and potential confounding factors (number of cells & cell type)
* Associated Figurees: Supplemental Figures 14, 15, & 16
-----------------------------------------------------------------------
## Distinguishing pathological cell clusters across similar diseases (OB_Dist_path)

Cell Type significance analysis (AS vs RA):
* File: Compare_AS_RA.ipynb
* Purpose of Analysis: Compare scDRS results for AS and RA to see if different significant pathological cell types can distinguish the two. Check results are consistent with different MAGMA window sizes.
* Associated Figures: Figure 4, Supplemental Figure 17

Cell Type significance analysis (CD vs UC):
* File: Compare_UC_CD.ipynb
* Purpose of Analysis: Compare scDRS results for CD and UC to see if different significant pathological cell types can distinguish the two. Check results are consistent with different MAGMA window sizes.
* Associated Figures: Figure 4, Supplemental Figure 18
-----------------------------------------------------------------------
## Impact of preprocessing steps (OC_Preproc)
MAGMA window comparison:
* File: MAGMA_Window.ipynb
* Purpose of Analysis: See if scDRS results for RA are consistent across the most commonly used MAGMA window sizes.
* Associated Figures: Figure 5, Supplemental Figure 19


Alternatives to MAGMA:
* File: FUMA.ipynb
* Purpose of Analysis: Assess results when using FUMA (incorporates non-positional methods to link SNPs to genes and get gene-level summary statistics) either in combination with or separate to postitional based methods (MAGMA)
* Associated Figures: Supplemental Figures 20 & 21, Supplemental Table 11
