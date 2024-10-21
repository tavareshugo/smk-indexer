# see GenomicRanges docs for the code to generate tx2gene from txdb
# https://bioconductor.org/packages/devel/bioc/vignettes/tximport/inst/doc/tximport.html#Import_transcript-level_estimates
library(GenomicFeatures)

# grab snakemake metadata
# https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#r-and-r-markdown
infile <- snakemake@input[[1]]
outfile <- snakemake@output[[1]]

# extract information from GFF3 file
txdb <- makeTxDbFromGFF(file = infile)
transcripts <- keys(txdb, keytype = "TXNAME")
tx2gene <- select(txdb, transcripts, "GENEID", "TXNAME")
colnames(tx2gene) <- c("transcript", "gene")

# save as CSV
write.csv(tx2gene, outfile, quote = FALSE, row.names = FALSE)
