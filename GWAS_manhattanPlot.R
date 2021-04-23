# title: "GWAS Manhattan plot example"
# author: "Mikołaj Buchwald"
# date: "Created on 15 Apr, 2021. Last modified on 22 Apr, 2021."
# desc: I created this simple example based on the documentation of the Sushi
# package from R Bioconductor. Then I moved this code to RMarkdown notebook
# and provided better comments and description of the code there. The current
# script was left as a bare-bones minimal example to produce a Manhattan plot.

# Load the Sushhi -- An R/Bioconductor package for visualizing genomic data
# https://www.bioconductor.org/packages/release/bioc/vignettes/Sushi/inst/doc/Sushi.pdf
library('Sushi')

# Load the data
data(Sushi_hg18_genome)
data(Sushi_GWAS.bed)

print("Number of base pairs per chromosome, see: https://www.ncbi.nlm.nih.gov/books/NBK22266/")
data.frame(Sushi_hg18_genome$V1, Sushi_hg18_genome$V2/1000000)

# Names of the columns
names(Sushi_GWAS.bed)

# Sushi_GWAS.bed[,5] are "pval.GC.DBP" column
# A "genome" parameter is required to set how many base pairs there are in each
# chromosome, which also is represented in the graph in how many space
# particular chromosome takes.
plotManhattan(bedfile=Sushi_GWAS.bed,
              pvalues=Sushi_GWAS.bed[,5],
              col=SushiColors(6),
              genome=Sushi_hg18_genome,
              cex=0.75)

labelgenome(genome=Sushi_hg18_genome,n=4,scale="Mb",
           edgeblankfraction=0.20,cex.axis=.5)

axis(side=2,las=2,tcl=.2)
mtext("log10(P)",side=2,line=1.75,cex=1,font=2)
mtext("chromosome",side=1,line=1.75,cex=1,font=2)