rule bwa_index:
    input:
        "{genome}.fasta",
    output:
        idx=multiext("{genome}.{alg}", ".amb", ".ann", ".bwt", ".pac", ".sa"),
    log:
        "logs/bwa_index/{genome}.{alg}.log",
    params:
        extra=lambda w: f"-a {w.alg}",
    wrapper:
        "v3.10.2/bio/bwa/index"
