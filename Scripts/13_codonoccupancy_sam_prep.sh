#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=cooccupancy

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Aligner/bowtie/1.2.0

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
--norc \
../cleaning/Indexfiles/principle_splice_isoform.fa_indicies \
-q ${x} \
-S $(basename ${x} .fastq)_splice.sam 2> $(basename ${x} .fastq)_splice_log.txt; done