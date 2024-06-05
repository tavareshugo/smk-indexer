rule gffread:
    input:
        # we use uncompressed files - see uncompress.smk
        fasta="{genomedir}/tmp-gffread-genome.fa",
        annotation="{genomedir}/tmp-gffread-annotation.gtf",
    output:
        records=temp("{genomedir}/transcripts.fa"),
    group: "gffread"
    log:
        "{genomedir}/logs/gffread.log",
    params:
        extra="",
    wrapper:
        "v3.10.2/bio/gffread"

rule compress_transcripts:
    input:
        transcripts="{genomedir}/transcripts.fa"
    output:
        transcripts="{genomedir}/transcripts.fa.gz"
    group: "gffread"
    log:
        "{genomedir}/logs/compress.log",
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        # compress with bgzip for samtools compatibility
        bgzip -c {input.transcripts} > {output.transcripts} 2> {log}
        """