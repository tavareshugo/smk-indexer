rule cellranger_mkref:
    input:
        fasta="{genomedir}/genome.fa",
        gtf="{genomedir}/annotation.gtf",
    output:
        directory("{genomedir}/cellranger"),
    log:
        "{genomedir}/logs/cellranger_mkref.log",
    singularity:
        "docker://quay.io/nf-core/cellranger:10.0.0"
    threads: 16
    resources:
        mem_gb=50,
    shell:
        """
        set -euo pipefail

        # Resolve file paths to absolute paths before changing directory.
        fasta=$(realpath "{input.fasta}")
        gtf=$(realpath "{input.gtf}")
        log=$(realpath "{log}")
        output=$(realpath "{output}")

        # Create a temporary working directory
        # Cellranger outputs a lot of tmp files and telemetry files we don't want to keep
        tmpdir=$(mktemp -d "{wildcards.genomedir}/.cellranger_smk_tmp.XXXXXXXX")

        # remove the temporary directory upon exit, even if the job fails
        trap 'rm -rf "$tmpdir"' EXIT

        cd "$tmpdir"

        cellranger mkref \
            --genome=cellranger \
            --fasta="$fasta" \
            --genes="$gtf" \
            --nthreads={threads} \
            --memgb={resources.mem_gb} \
            --localcores={threads} \
            --localmem={resources.mem_gb} \
            >"$log" 2>&1

        mv cellranger "$output"
        cd ..
        rm -rf "$tmpdir"
        """
