#!/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=cutadapt

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Quality_control/cutadapt/2.5

# Clip 3' adapter with CTGTAGGCACCATCAAT sequence, discards any seq that didnt contain an adapter
for file in $(ls -d *.fastq.gz); do echo ${file}; \
cutadapt \
-j 0 \
-a CTGTAGGCACCATCAAT \
-q 25 \
--minimum-length 25 \
--discard-untrimmed \
-o $(basename ${file} .fastq.gz)_clpd.fastq.gz \
${file} 1> $(basename ${file} .fastq.gz)_clpd_log.txt; done


# Trim 4 nt (randomized bases) from the 3' end
for file in $(ls -d *_clpd.fastq.gz); do echo ${file}; \
cutadapt \
-j 0 \
-q 25 \
--cut -4 \
--minimum-length 25 \
-o $(basename ${file} .fastq.gz)_tr.fastq.gz \
${file} 1> $(basename ${file} .fastq.gz)_tr_log.txt; done
