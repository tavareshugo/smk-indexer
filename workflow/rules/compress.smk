rule compress:
    input:
        genome="{genomedir}/genome.fa",
        gff="{genomedir}/annotation.gff3",
        gtf="{genomedir}/annotation.gtf",
        transcripts="{genomedir}/transcripts.fa"
    output:
        genome="{genomedir}/genome.fa.gz",
        gff="{genomedir}/annotation.gff3.gz",
        gtf="{genomedir}/annotation.gtf.gz",
        transcripts="{genomedir}/transcripts.fa.gz"
    log:
        "logs/{genomedir}/compress.log",
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        # compress with bgzip for samtools compatibility
        bgzip -c {input.genome} > {output.genome}
        bgzip -c {input.gff} > {output.genome}
        bgzip -c {input.gtf} > {output.genome}
        bgzip -c {input.transcripts} > {output.genome}
        """
