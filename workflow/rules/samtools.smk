rule samtools_index:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        "{genomedir}/genome.fa.gz.fai",
        "{genomedir}/genome.fa.gz.gzi",
    log:
        "{genomedir}/logs/samtools.log",
    params:
        extra="",  # optional params string
    threads: 24
    wrapper:
        "v3.10.2/bio/samtools/faidx"

rule create_dict:
    input:
        "{genomedir}/genome.fa.gz",
    output:
        "{genomedir}/genome.fa.gz.dict",
    log:
        "{genomedir}/logs/create_dict.log",
    params:
        extra="",
    # optional specification of memory usage of the JVM that snakemake will respect with global
    # resource restrictions (https://snakemake.readthedocs.io/en/latest/snakefiles/rules.html#resources)
    # and which can be used to request RAM during cluster job submission as `{resources.mem_mb}`:
    # https://snakemake.readthedocs.io/en/latest/executing/cluster.html#job-properties
    threads: 12
    wrapper:
        "v3.11.0/bio/picard/createsequencedictionary"