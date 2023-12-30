
library(ape)
library(phytools)
library(dendextend)
library(viridis)
library(dplyr)
library(phylogram)

tree1 <- read.tree(file = "file name - newick format")
#tree1 <- midpoint.root(tree1)
tree2 <- read.tree(file = "file name")
plot(tree2)
#tree2 <- midpoint.root(tree2)
tree1 <- compute.brlen(tree1)
tree2 <- compute.brlen(tree2)
tree1 <- as.dendrogram(tree1)
tree1
tree2 <- as.dendrogram(tree2)
tree2

#Had to detach "phytools" because it also has an untangle function
detach("package:phytools")

dndlist <- dendextend::dendlist(tree1, tree2)%>% untangle(method= "step2side")
dendextend::tanglegram(dndlist, fast = TRUE, margin_inner = 1.8, lab.cex = 0.3, lwd = 
                         0.5, edge.lwd = 0.5, type = "r")

#print tanglegram
dev.copy(pdf, 'Tanglegram_untangled.pdf', width = 10, height = 11)
dev.off()