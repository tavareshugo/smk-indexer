rule download:
    output:
        genome="{outdir}/{genome}/genome.fa",
        gff="{outdir}/{genome}/annotation.gff3",
        gtf="{outdir}/{genome}/annotation.gtf",
    log:
        "{outdir}/{genome}/logs/download.log",
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        mkdir -p {wildcards.outdir}/{wildcards.genome}

        # fetch URLs
        genome=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f2)
        gtf=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f3)
        gff=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f4)

        # download genome and decompress
        wget -O {wildcards.outdir}/{wildcards.genome}/genome.fa.gz $genome > {log} 2>&1
        gunzip {wildcards.outdir}/{wildcards.genome}/genome.fa.gz 2>> {log}

        # download annotations and decompress
        wget -O {wildcards.outdir}/{wildcards.genome}/annotation.gtf.gz $gtf >> {log} 2>&1
        gunzip {wildcards.outdir}/{wildcards.genome}/annotation.gtf.gz 2>> {log}
        wget -O {wildcards.outdir}/{wildcards.genome}/annotation.gff3.gz $gff >> {log} 2>&1
        gunzip {wildcards.outdir}/{wildcards.genome}/annotation.gff3.gz 2>> {log}
        """
