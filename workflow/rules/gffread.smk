rule gffread:
    input:
        # genome.fa.fai must exist before gffread runs (produced by samtools_index)
        fasta="{genomedir}/genome.fa",
        fai="{genomedir}/genome.fa.fai",
        annotation="{genomedir}/annotation.gtf",
    output:
        records="{genomedir}/transcripts.fa",
    group: "gffread"
    log:
        "{genomedir}/logs/gffread.log",
    params:
        extra="",
    wrapper:
        "v3.10.2/bio/gffread"