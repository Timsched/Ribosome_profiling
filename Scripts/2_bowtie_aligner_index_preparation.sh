#!/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=bowtiealign

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/cleaning

cd $REFERENCE_DIR

module add UHTS/Aligner/bowtie/1.2.0

mkdir -p Indexfiles

#indicies for undesired RNAs
bowtie-build undesired_RNA.fa Indexfiles/undesired_RNA_indicies
echo done
#indicies for genome
bowtie-build Homo_sapiens.GRCh38.dna.primary_assembly.fa Indexfiles/Homo_sapiens.GRCh38.dna.primary_assembly_indicies
echo done2
#indicies for transcriptom (splice isoforms)
bowtie-build principle_splice_isoform.fa Indexfiles/principle_splice_isoform.fa_indicies
echo done3
