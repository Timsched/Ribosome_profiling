#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=3000M
#SBATCH --job-name=bowtie_map_genome


REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR

module add UHTS/Aligner/bowtie/0.12.9
module add UHTS/Analysis/samtools/1.8


#-S for printing alignment in sam output format
#-t print time taken by each phase
#-p cpu count
#-v 1 Report alignments with at most 1 mismatch
#-m 1 Suppress all alignments for a particular read or pair if more than 1 reportable alignments exist for it. We only care about mapping it to genome once i think (?). High -m makes code slow
#--best Make Bowtie guarantee that reported singleton alignments are “best” in terms of stratum and in terms of the quality values at the mismatched position(s).
#--strata report only those alignments that fall into the best stratum. By default, Bowtie reports all reportable alignments regardless of whether they fall into multiple strata.
#-q input files

for file in $(ls -d *RNA.fastq); \
do echo ${file}; \
bowtie \
-S \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
../cleaning/Indexfiles/Homo_sapiens.GRCh38.dna.primary_assembly_indicies \ 
-q ${file} \
2> $(basename ${file} .fastq)_GRCh38_log.txt | \
samtools view \
-h \
-F 4 \
-b > $(basename ${file} .fastq)_GRCh38.bam; done
#piped into samtools view, converts sam to bam
#-h include header in output
#-F Do not output alignments with any bits set in FLAG present in the FLAG field. FLAG in this case = 4
#-b output in bam format


# Sort the BAM file
# Sort alignments by leftmost coordinates by default
#-@ Set number of sorting and compression threads, cpu (?)
for file in $(ls -d *.bam); \
do echo ${file}; \
samtools sort \
-@ 4 \
${file} \
-o $(basename ${file} .bam)_sorted.bam; done

# Remove the unsorted BAM file
rm *GRCh38.bam