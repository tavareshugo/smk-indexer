rule hisat2_index:
    input:
        fasta = "{genomedir}/tmp-hisat2-genome.fa"
    output:
        directory("{genomedir}/hisat2")
    params:
        prefix = "{genomedir}/hisat2/genome"
    threads: 24
    log:
        "{genomedir}/logs/hisat2_index.log"
    wrapper:
        "v3.11.0/bio/hisat2/index"
