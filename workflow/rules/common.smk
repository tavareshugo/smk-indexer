import pandas as pd
import os

genomes = pd.read_csv(config["input"], sep=",").set_index(["name"], drop=False)

def final_outputs(wildcards):
    basenames = ["genome.fa.gz", "genome.fa.fai", "annotation.gff3.gz", "annotation.gtf.gz", "star"]
    basenames.extend(multiext("bowtie2/genome", ".1.bt2", ".2.bt2", ".3.bt2", ".4.bt2", ".rev.1.bt2", ".rev.2.bt2"))
    basenames.extend(multiext("bwa/genome", ".amb", ".ann", ".bwt", ".pac", ".sa"))
    basenames.extend(multiext("salmon/", "complete_ref_lens.bin", "ctable.bin", "ctg_offsets.bin", "duplicate_clusters.tsv", "info.json", "mphf.bin", "pos.bin", "pre_indexing.log", "rank.bin", "refAccumLengths.bin", "ref_indexing.log", "reflengths.bin", "refseq.bin", "seq.bin", "versionInfo.json"))

    # add outdir and genome directories to path
    final_outputs = []
    for genome in genomes.index:
        for i in range(len(basenames)):
            final_outputs.append("{outdir}/{genome}/{basename}".format(outdir=config["outdir"].rstrip("/"), genome=genome, basename=basenames[i]))
    
    return final_outputs