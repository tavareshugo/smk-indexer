rule star_index:
    input:
        fasta="{genomedir}/genome.fa",
        gft="{genomedir}/annotation.gtf"
    output:
        directory("{genomedir}/star"),
    threads: 48
    params:
        extra="",
    log:
        "{genomedir}/logs/star_index.log",
    wrapper:
        "v7.1.0/bio/star/index"
