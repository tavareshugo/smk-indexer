## Genome sheet

The main input is a CSV file specifying the source of the genome files, with the following columns:

- `name`: will be used as the output directory name; we use `<species>-<genome>-<source>-<release/version>` as a convention (see naming details below).
- `genome`: url to genome file.
- `gtf`: url to gtf annotation file.
- `gff`: url to gff annotation file.

For consistency, we name our genome directories as `<species>-<genome>-<source>-<release/version>`, where: 

- `organism` is the first letter of the genus followed by species scientific name.
- `genome` is the name of the genome in the respective database.
- `source` is the source of the genome. For example `ensembl`, `gencode`, `ncbi`, `flybase`, etc. 
- `release/version` is the release or version number of the genome release on the respective database. If no version number is available use YYYYMMDD of the genome file being downloaded.

Here's some examples: 

- `hsapiens-GRCh38-ensembl-112` human genome using ENSEMBL release 112 ([source](https://www.ensembl.org/Homo_sapiens/Info/Index))
- `hsapiens-GRCh38-gencode-45` effectively the same assembly as above, but using GENCODE release 45 ([source](https://www.gencodegenes.org/human/))
- `hsapiens-GRCh37-gencode-45` the same GENCODE release, but for an earlier version of the human genome ([source](https://www.gencodegenes.org/human/release_45lift37.html))
- `mmusculus-A_J_v1-ensembl-112` mouse reference genome for strain A/J on ENSEMBL release 112 ([source](https://www.ensembl.org/Mus_musculus_A_J/Info/Index))
- `dmelanogaster-BDGP6-ensembl-112` _Drosophila melanogaster_ genome, using the genome name given in ENSEMBL release 112 ([source](https://www.ensembl.org/Drosophila_melanogaster/Info/Index))
- `dsimulans-dsim-flybase-r2.02` _Drosophila simulans_ genome from flybase, release r2.02 ([source](http://ftp.flybase.net/releases/FB2024_02/))


## Configuration

The `config.yml` can be used to configure some of the workflow options, namely the parent output directory (the specific genome directory named as above will be created within this by the workflow). 


## Running the workflow

The workflow can be run with the following command:

```bash
snakemake --use-conda --slurm --default-resources slurm_account=<YOUR SLURM ACCOUNT> slurm_partition=<YOUR SLURM PARTITION>
```

On Cambridge CSD3 we recommend running this from a `tmux`/`screen` session.
Snakemake should then submit jobs to SLURM automatically.

For a **dry-run** (i.e. indicate which steps would be run without actually doing anything) do:

```bash
snakemake -np
```


## Adding a new genome

To add a new genome, edit the `genomes.csv` file, adding a new row with the name and links for the new genome.
Re-run the workflow as above, which should run only the steps necessary to index the new genome.

Always do a dry-run first, to check everything looks right (`snakemake -np`)


## Using the genomes in your analysis

Within each genome directory, the following files can be found: 

- `genome.fa.gz`: compressed reference genome in FASTA format.
- `genome.fai`: samtools index file for the FASTA file.
- `annotation.gtf.gz`: compressed reference annotation in GTF format.
- `annotation.gff3.gz`: compressed reference annotation in GFF3 format.

And the following directories, containing index files for the respective software tools:

- `salmon`
- `star`
- `bowtie2`
- `bwa`
