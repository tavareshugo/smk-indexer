rule gffread:
    input:
        fasta="{genomedir}/genome.fa",
        annotation="{genomedir}/annotation.gtf",
        faidx="{genomedir}/genome.fa.fai",
        # ids="",  # Optional path to records to keep
        # nids="",  # Optional path to records to drop
        # seq_info="",  # Optional path to sequence information
        # sort_by="",  # Optional path to the ordered list of reference sequences
        # attr="",  # Optional annotation attributes to keep.
        # chr_replace="",  # Optional path to <original_ref_ID> <new_ref_ID>
    output:
        records="{genomedir}/transcripts.fa",
        # dupinfo="",  # Optional path to clustering/merging information
    threads: 1
    log:
        "logs/{genomedir}/gffread.log",
    params:
        extra="",
    wrapper:
        "v3.10.2/bio/gffread"
