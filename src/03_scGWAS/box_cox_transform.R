#Script adapted from scGWAS GitHub repository: https://github.com/bsml320/scGWAS/tree/main

### Box-Cox transformation of Magma results
library(MASS)

### gene_info file, which can be downloaded from NCBI, includes mapping information between gene ID and symbol
path_to_gene_info = "" #*add path here*
gene_info = read.delim(path_to_gene_info, as.is=T)

path_to_MAGMA = "" #Path to MAGMA results
gwas_magma = read.table(path_to_MAGMA, as.is=T, header=T)
#output = strsplit(gwasfile[k], split="\\.")[[1]][1]

cat("Raw gwas genes: ", nrow(gwas_magma), "\n", sep="")
match(gwas_magma[,1], gene_info[,3]) -> ii
gwas_magma$Symbol = gene_info[ii, "Symbol"]
gwas_magma = gwas_magma[!is.na(gwas_magma$Symbol), ]
cat("GWAS genes, after match gene_info: ", nrow(gwas_magma), "\n", sep="")

p = -log10(gwas_magma[,"P"])
hist(p, main="Raw -log10(P)")  ###

### Box-Cox transformation using -log10(p)
Box = boxcox(p ~ 1, lambda=seq(-2,2,0.05))
Cox = data.frame(Box$x, Box$y)
Cox2 = Cox[with(Cox, order(-Cox$Box.y)),]

lambda = Cox2[1, "Box.x"]
if(lambda == 0){
  lambda = Cox2[2, "Box.x"]
}
title(main=paste("lambda = ", lambda, sep=""))
zb = (p ^ lambda - 1)/lambda
names(zb) = gwas_magma[,"Symbol"]

shift.factor = abs(median(p)-median(zb))
zb = zb + shift.factor

#hist(p,  main=gsub(".genes.out","",gwasfile[k])  )
#qqnorm(p,  main=gsub(".genes.out","",gwasfile[k]), pch=20); qqline(p, col="red")
#hist(zb, main=gsub(".genes.out","",gwasfile[k])  )
#qqnorm(zb, main=gsub(".genes.out","",gwasfile[k]), pch=20); qqline(zb, col="red")

#SAve results
path_to_save = ""
write.table(cbind(names(zb), zb), file=path_to_save, row.names=F, col.names=F, quote=F, sep="\t")
