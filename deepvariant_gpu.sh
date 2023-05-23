#!/bin/bash -l
#SBATCH -o [ENTER YOUR OWN PATH]
#SBATCH -e [ENTER YOUR OWN PATH]
#SBATCH -J DeepVariantGPU
#SBATCH -t 48:00:00
#SBATCH -c 16
#SBATCH --mem 128G
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu-a100-h
#SBATCH --mail-type=ALL
#SBATCH --mail-user=[ENTER YOUR OWN EMAIL]

module load apptainersingularity

# Command-line arguments
model_type=$1
ref_genome=$2
reads_file=$3
output_vcf=$4
output_gvcf=$5
num_shards=$6

singularity exec --nv /home/icanders/deepvariant_gpu.sif run_deepvariant \
   --model_type=$model_type \
   --ref=$ref_genome \
   --reads=$reads_file \
   --output_vcf=$output_vcf \
   --output_gvcf=$output_gvcf \
   --num_shards=$num_shards
