genomes = pd.read_csv(config["input"], dtype=str, sep=",").set_index(["name"], drop=False)

def all_outputs(wildcards):
  final_outputs = []
  
  for genome in genomes.index:
    final_outputs.extend(
      [
        "{outdir}/{genome}/genome.fa.gz",
        "{outdir}/{genome}/genome.fai",
        "{outdir}/{genome}/annotation.gff3.gz",
        "{outdir}/{genome}/annotation.gtf.gz",
        # "{outdir}/{genome}/salmon",
        # "{outdir}/{genome}/star",
        # "{outdir}/{genome}/bowtie2",
        # "{outdir}/{genome}/bwa"
      ],
      outdir=config["outdir"],
      genome=genome
    )
