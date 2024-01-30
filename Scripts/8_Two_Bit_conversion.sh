#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=faToTwoBit

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/cleaning

cd $REFERENCE_DIR

module add SequenceAnalysis/blat/36

faToTwoBit Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa Homo_sapiens.GRCh38.dna_rm.primary_assembly.2bit