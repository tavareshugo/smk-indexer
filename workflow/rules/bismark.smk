# we create a separate folder with a symlink to the FASTA
# as Bismark is not very flexible and will use any FASTA files in the directory
# this way we avoid indexing transcripts and uncompressed versions of the files
# the ruleorder is needed because of wildcard ambiguity with the `download` rule
ruleorder: bismark_prep_files > download
rule bismark_prep_files:
    input:
        "{genomedir}/genome.fa.gz",
    output: 
        "{genomedir}/bismark/genome.fa.gz"
    group: "bismark"
    log: 
        "{genomedir}/logs/bismark_prep_files.log"
    shell:
        """
        mkdir -p {wildcards.genomedir}/bismark
        ln -s ../genome.fa.gz {output}
        """

rule bismark_genome_preparation_fa_gz:
    input:
        "{genomedir}/bismark/genome.fa.gz"
    output:
        directory("{genomedir}/bismark/Bisulfite_Genome")
    group: "bismark"
    log:
        "{genomedir}/logs/bismark_genome_preparation_fa_gz.log",
    params:
        extra=""  # optional params string
    wrapper:
        "v4.7.2/bio/bismark/bismark_genome_preparation"