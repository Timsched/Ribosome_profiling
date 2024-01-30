#!/bin/bash


#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=fastqc

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Quality_control/fastqc/0.11.9

## perform fastqc across all zipped fastq files.
fastqc -o ./fastqc -f fastq *.fastq.gz