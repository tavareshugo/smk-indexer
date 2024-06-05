rule samtools_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        "{genomedir}/genome.fa.fai",
    log:
        "{genomedir}/logs/samtools.log",
    params:
        extra="",  # optional params string
    threads: 24
    wrapper:
        "v3.10.2/bio/samtools/faidx"
