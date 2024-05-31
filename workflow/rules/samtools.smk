rule samtools_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        "{genomedir}/genome.fa.fai",
    log:
        "logs/{genomedir}/samtools.log",
    params:
        extra="",  # optional params string
    wrapper:
        "v3.10.2/bio/samtools/faidx"
