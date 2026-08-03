rule download:
    output:
        genome=OUTDIR + "/{genome}/genome.fa",
        gff=OUTDIR + "/{genome}/annotation.gff3",
        gtf=OUTDIR + "/{genome}/annotation.gtf",
    log:
        OUTDIR + "/{genome}/logs/download.log",
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        genomedir=$(dirname {output.genome})
        mkdir -p $genomedir

        # fetch URLs
        genome=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f2)
        gtf=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f3)
        gff=$(grep "{wildcards.genome}" {config[input]} | cut -d, -f4)

        # download genome and decompress
        wget -O $genomedir/genome.fa.gz $genome > {log} 2>&1
        gunzip $genomedir/genome.fa.gz 2>> {log}

        # download annotations and decompress
        wget -O $genomedir/annotation.gtf.gz $gtf >> {log} 2>&1
        gunzip $genomedir/annotation.gtf.gz 2>> {log}
        wget -O $genomedir/annotation.gff3.gz $gff >> {log} 2>&1
        gunzip $genomedir/annotation.gff3.gz 2>> {log}
        """
