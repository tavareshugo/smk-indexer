rule star_index:
    input:
        fasta="{genomedir}/genome.fa",
    output:
        directory("{genomedir}/star"),
    threads: 1
    params:
        extra="",
    log:
        "logs/{genomedir}/star_index.log",
    wrapper:
        "v3.10.2/bio/star/index"
