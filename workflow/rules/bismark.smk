# we create a separate folder with a symlink to the FASTA
# as Bismark is not very flexible and will use any FASTA files in the directory
# this way we avoid indexing transcripts and other files
# the ruleorder is needed because of wildcard ambiguity with the `download` rule
ruleorder: bismark_prep_files > download
rule bismark_prep_files:
    input:
        "{genomedir}/genome.fa",
    output: 
        "{genomedir}/bismark/genome.fa"
    group: "bismark"
    log: 
        "{genomedir}/logs/bismark_prep_files.log"
    shell:
        """
        mkdir -p {wildcards.genomedir}/bismark
        ln -s ../genome.fa {output}
        """

rule bismark_genome_preparation:
    input:
        "{genomedir}/bismark/genome.fa"
    output:
        directory("{genomedir}/bismark/Bisulfite_Genome")
    group: "bismark"
    log:
        "{genomedir}/logs/bismark_genome_preparation.log",
    params:
        extra=""  # optional params string
    wrapper:
        "v4.7.2/bio/bismark/bismark_genome_preparation"