#!/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=fastqc

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR
mkdir -p fastqc

module add UHTS/Quality_control/fastqc/0.11.9

fastqc -o ./fastqc -f fastq *_clpd_tr.fastq.gz