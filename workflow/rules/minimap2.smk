rule minimap2_index:
    input:
        target="{genomedir}/tmp-minimap2-genome.fa"
    output:
        "{genomedir}/minimap2/genome.mmi"
    log:
        "{genomedir}/logs/minimap2_index.log"
    params:
        extra=""  # optional additional args
    threads: 24
    wrapper:
        "v7.1.0/bio/minimap2/index"