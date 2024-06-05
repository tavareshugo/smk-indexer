# Snakemake workflow: `smk-indexer`

[![Snakemake](https://img.shields.io/badge/snakemake-≥8.12.0-brightgreen.svg)](https://snakemake.github.io)

A Snakemake workflow for generating genome index files for several commonly-used software. 
See workflow [config README](config/README.md) for details of how to run and configure the workflow.


## Setup

Install Snakemake using Mamba:

```bash
mamba create -n snakemake bioconda::snakemake==8.12.0 bioconda::snakemake-executor-plugin-slurm=0.5.1
```
