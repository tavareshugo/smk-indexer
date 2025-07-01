rule bwa_mem_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        multiext("{genomedir}/bwa-mem/genome", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log:
        "{genomedir}/logs/bwa-mem_index.log",
    threads: 24
    params:
        bwa="bwa-mem",
    wrapper:
        "v7.1.0/bio/bwa-memx/index"

rule bwa_mem2_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        multiext("{genomedir}/bwa-mem2/genome", ".0123", ".amb", ".ann", ".bwt.2bit.64", ".pac"),
    log:
        "{genomedir}/logs/bwa-mem2_index.log",
    threads: 24
    params:
        bwa="bwa-mem2",
    wrapper:
        "v7.1.0/bio/bwa-memx/index"

rule bwa_meme_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        multiext(
            "{genomedir}/bwa-meme/genome",
            ".0123",
            ".amb",
            ".ann",
            ".pac",
            ".pos_packed",
            ".suffixarray_uint64",
            ".suffixarray_uint64_L0_PARAMETERS",
            ".suffixarray_uint64_L1_PARAMETERS",
            ".suffixarray_uint64_L2_PARAMETERS",
        ),
    log:
        "{genomedir}/logs/bwa-meme_index.log",
    threads: 24
    params:
        bwa="bwa-meme"
    wrapper:
        "v7.1.0/bio/bwa-memx/index"