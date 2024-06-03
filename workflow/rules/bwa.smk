rule bwa_index:
    input:
        "{genomedir}/genome.fa",
    output:
        idx=multiext("{genomedir}/bwa/genome", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log:
        "logs/{genomedir}/bwa_index.log",
    threads: 1
    params:
        extra="",
    wrapper:
        "v3.10.2/bio/bwa/index"
