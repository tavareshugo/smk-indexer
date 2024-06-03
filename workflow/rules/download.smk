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
        wget -O {wildcards.genomedir}/genome.fa.gz $genome
        wget -O {wildcards.genomedir}/annotation.gtf.gz $gtf
        wget -O {wildcards.genomedir}/annotation.gff3.gz $gff

        # uncompress them all (we re-compress at the end)
        gunzip {wildcards.genomedir}/genome.fa.gz
        gunzip {wildcards.genomedir}/annotation.gtf.gz
        gunzip {wildcards.genomedir}/annotation.gff3.gz
        """
