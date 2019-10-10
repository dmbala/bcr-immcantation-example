# Load required packages
library(alakazam)
library(dplyr)
library(scales)

# Subset example data
data(ExampleDb)

gene <- countGenes(ExampleDb, gene="v_call", groups="sample", mode="gene")

# Assign sorted levels and subset to IGHV1
ighv1 <- gene %>%
    mutate(GENE=factor(GENE, levels=sortGenes(unique(GENE), method="name"))) %>%
    filter(getFamily(GENE) == "IGHV1")

# Plot V gene usage in the IGHV1 family by sample
g1 <- ggplot(ighv1, aes(x=GENE, y=SEQ_FREQ)) +
    theme_bw() +
    ggtitle("IGHV1 Usage") +
    theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1)) +
    ylab("Percent of repertoire") +
    xlab("") +
    scale_y_continuous(labels=percent) +
    scale_color_brewer(palette="Set1") +
    geom_point(aes(color=sample), size=5, alpha=0.8)
jpeg('alakazam-test.jpg')
plot(g1)
dev.off()
