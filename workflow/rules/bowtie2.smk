rule bowtie2_build:
    input:
        ref="{genomedir}/genome.fa",
    output:
        multiext(
            "{genomedir}/bowtie2/genome",
            ".1.bt2",
            ".2.bt2",
            ".3.bt2",
            ".4.bt2",
            ".rev.1.bt2",
            ".rev.2.bt2",
        ),
    log:
        "logs/{genomedir}/bowtie2_build.log",
    params:
        extra="",  # optional parameters
    threads: 8
    wrapper:
        "v3.10.2/bio/bowtie2/build"
