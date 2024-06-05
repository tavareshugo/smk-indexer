rule salmon_decoy:
    input:
        transcriptome="{genomedir}/transcripts.fa.gz",
        genome="{genomedir}/genome.fa.gz",
    output:
        gentrome="{genomedir}/salmon/gentrome.fa.gz",
        decoys="{genomedir}/salmon/decoys.txt",
    group: "salmon"
    threads: 2
    log:
        "{genomedir}/logs/salmon_decoy.log"
    wrapper:
        "v3.10.2/bio/salmon/decoys"

rule salmon_index:
    input:
        sequences="{genomedir}/salmon/gentrome.fa.gz",
        decoys="{genomedir}/salmon/decoys.txt"
    output:
        multiext(
            "{genomedir}/salmon/",
            "complete_ref_lens.bin",
            "ctable.bin",
            "ctg_offsets.bin",
            "duplicate_clusters.tsv",
            "info.json",
            "mphf.bin",
            "pos.bin",
            "pre_indexing.log",
            "rank.bin",
            "refAccumLengths.bin",
            "ref_indexing.log",
            "reflengths.bin",
            "refseq.bin",
            "seq.bin",
            "versionInfo.json",
        ),
    log:
        "{genomedir}/logs/salmon_index.log",
    threads: 24
    params:
        # optional parameters
        extra="",
    wrapper:
        "v3.10.2/bio/salmon/index"
