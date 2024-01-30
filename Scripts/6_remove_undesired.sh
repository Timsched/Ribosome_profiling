#!/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=bowtie_remove_undesired

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Aligner/bowtie/0.12.9


#gunzip because bowtie can not deal with zipped fastq files
#-S for printing alignment in sam output format
#-t print time tkaen by each phase
#- \ std input is replaced with pipe (after gunzip)
#--un Write all reads that could not be aligned to a file with name <filename>.
#discards all reads that were able to be aligned.
for file in $(ls -d *tr.fastq.gz); \
do echo ${file}; \
gunzip -cd ${file} | \
bowtie \
-S \
-t \
../cleaning/Indexfiles/undesired_RNA_indicies \
- \
--un $(basename ${file} .fastq.gz)_no_r_t_sno_sn_RNA.fastq 2> $(basename ${file} .fastq.gz)_no_r_t_sno_sn_RNA_log.txt > /dev/null; done