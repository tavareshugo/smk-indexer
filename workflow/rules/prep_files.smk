rule prep_files:
    input:
        "",
    output:
        genome="{genomedir}/genome.fa.gz",
        gff="{genomedir}/genome.gff3.gz",
        gtf="{genomedir}/genome.gtf.gz",
        idx="{genomedir}/genome.fai",
        transcriptome="{genomedir}/transcriptome.fa.gz"
    log:
        "logs/prep_files/{name}.log",
    shell:
        """
        # TODO
        """
