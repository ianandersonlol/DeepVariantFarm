# DeepVariantFarm Documentation

This script runs DeepVariant, a genomic variant caller, using GPU acceleration. The script is designed to be submitted to a SLURM cluster, and assumes the user has access to Singularity and a GPU.

## Table of Contents
1. [Requirements](#requirements)
2. [Usage](#usage)
3. [Input Parameters](#input-parameters)
4. [Output Files](#output-files)

## Requirements

- Access to a FARM cluster, and be on the Monroe Lab group. Currently there are only permissions for myself and the group. 
- If you are another lab that wants to use it reach out and I will set it up on your group. 
- Update the script with your output paths and email.
## Usage

To use this script, submit it to the SLURM scheduler with the `sbatch` command followed by the required input parameters:

```
sbatch deepvariant_gpu.sh <model_type> <ref_genome> <reads_file> <output_vcf> <output_gvcf> <num_shards>
```

## Input Parameters

| Parameter   | Description                                                  |
| ----------- | ------------------------------------------------------------ |
| model_type  | The type of model to use for variant calling. Options: `WGS`, `WES`, `PACBIO`, or `ONT`. |
| ref_genome  | Path to the reference genome FASTA file.                    |
| reads_file  | Path to the input reads file (BAM, CRAM, or FASTQ format).  |
| output_vcf  | Path to the output VCF file.                                 |
| output_gvcf | Path to the output gVCF file.                                |
| num_shards  | The number of shards to process the input reads file in parallel. |

## Output Files

The script will generate two output files:

1. A VCF file containing the called variants.
2. A gVCF file containing both variant and non-variant sites.
