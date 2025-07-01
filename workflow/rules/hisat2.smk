rule hisat2_index:
    input:
        fasta = "{genomedir}/tmp-hisat2-genome.fa"
    output:
        multiext(
            "{genomedir}/hisat2/genome",
            ".1.ht2l",
            ".2.ht2l",
            ".3.ht2l",
            ".4.ht2l",
            ".5.ht2l",
            ".6.ht2l",
            ".7.ht2l",
            ".8.ht2l",
        ),
    params:
        extra = "--large-index"
    threads: 24
    log:
        "{genomedir}/logs/hisat2_index.log"
    wrapper:
        "v7.1.0/bio/hisat2/index"
