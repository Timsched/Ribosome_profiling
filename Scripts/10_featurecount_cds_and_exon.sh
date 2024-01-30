#!/bin/bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=featurecounts

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR
mkdir -p featurecount
module load UHTS/Analysis/subread/2.0.1
# Count reads on CDS

featureCounts \
-T 8 \
-t CDS \
-g gene_id \
-a ../cleaning/Homo_sapiens.GRCh38.108.gtf \
-o featurecount/CDS_counts_rawfile.txt *_GRCh38_sorted.bam

# Extract GeneID and Sample columns
cut -f 1,7-10 featurecount/CDS_counts_rawfile.txt > featurecount/CDS_counts_processed.txt

featureCounts \
-T 8 \
-t exon \
-g gene_biotype \
-a ../cleaning/Homo_sapiens.GRCh38.108.gtf \
-o featurecount/biotype_counts_rawfile.txt *_GRCh38_sorted.bam

# Extract Biotype and Sample columns

cut -f 1,7-10 featurecount/biotype_counts_rawfile.txt > featurecount/biotype_counts_processed.txt