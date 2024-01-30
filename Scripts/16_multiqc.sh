#!/bin/bash


#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=multiqc

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Analysis/MultiQC/1.8

multiqc .


