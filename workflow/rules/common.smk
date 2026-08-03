import pandas as pd
import os

genomes = pd.read_csv(config["input"], sep=",").set_index(["name"], drop=False)

OUTDIR = config["outdir"].rstrip("/")

def final_outputs(wildcards):
    return OUTDIR + "/nfcore_genomes.config"