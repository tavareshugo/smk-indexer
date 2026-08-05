rule bismark_genome_preparation:
    input:
        genome="{genomedir}/genome.fa",
    output:
        bismark_genome_dir=directory("{genomedir}/bismark/Bisulfite_Genome"),
    log:
        "{genomedir}/logs/bismark_genome_preparation.log",
    threads: 16  # threads of at least 2 needs to be specified for this rule
    params:
        extra="",  # optional params string
    wrapper:
        "v9.15.0/bio/bismark/bismark_genome_preparation"
