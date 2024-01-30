#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=samtool_index

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Analysis/samtools/1.8

#creat bai files for corresponding bam files, -b bai output, -@ for threads
for file in $(ls -d *sorted.bam); \
do echo ${file}; \
samtools index \
-b \
-@ 4 \
${file} \
$(basename ${file} .bam).bai; done