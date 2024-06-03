rule salmon_decoy:
    input:
        transcriptome="{genomedir}/transcripts.fa",
        genome="{genomedir}/genome.fa",
    output:
        gentrome=temp("{genomedir}/salmon/gentrome.fa"),
        decoys=temp("{genomedir}/salmon/decoys.txt"),
    threads: 2
    log:
        "logs/{genomedir}/salmon_decoy.log"
    wrapper:
        "v3.10.2/bio/salmon/decoys"

rule salmon_index:
    input:
        sequences="{genomedir}/transcripts.fa",
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
        "logs/{genomedir}/salmon_index.log",
    threads: 2
    params:
        # optional parameters
        extra="",
    wrapper:
        "v3.10.2/bio/salmon/index"
