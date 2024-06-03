rule download:
    input:
        config["input"]
    output:
        genome=temp("{genomedir}/genome.fa"),
        gff=temp("{genomedir}/annotation.gff3"),
        gtf=temp("{genomedir}/annotation.gtf"),
    log:
        "logs/{genomedir}/download.log",
    shell:
        """
        # basename matches the name in CSV file
        genome=$(basename {wildcards.genomedir})

        # fetch URLs
        genome=$(grep "$genome" {input} | cut -d, -f2)
        gtf=$(grep "$genome" {input} | cut -d, -f3)
        gff=$(grep "$genome" {input} | cut -d, -f4)

        # download
        wget -O {wildcards.genomedir}/genome.fa.gz $genome > {log} 2>&1
        wget -O {wildcards.genomedir}/annotation.gtf.gz $gtf > {log} 2>&1
        wget -O {wildcards.genomedir}/annotation.gff3.gz $gff > {log} 2>&1

        # uncompress them all (we re-compress at the end with samtools bgzip)
        gunzip {wildcards.genomedir}/genome.fa.gz > {log} 2>&1
        gunzip {wildcards.genomedir}/annotation.gtf.gz > {log} 2>&1
        gunzip {wildcards.genomedir}/annotation.gff3.gz > {log} 2>&1
        """
