rule star_index:
    input:
        # we use uncompressed files - see uncompress.smk
        fasta="{genomedir}/tmp-star-genome.fa",
        gft="{genomedir}/tmp-star-annotation.gtf"
    output:
        directory("{genomedir}/star"),
    threads: 48
    params:
        extra="",
    log:
        "{genomedir}/logs/star_index.log",
    wrapper:
        "v3.10.2/bio/star/index"
