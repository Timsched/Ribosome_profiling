# Ribosome_profiling

Project for the course RNA Sequencing following the ribosome prfiling tutorial by Puneet Sharma.

The code that was executed can be found in the scripts folder. An altered verrsion of the R package RiboseQC (https://github.com/ohlerlab/RiboseQC) is included that was used.
The datasets used were provided by Punet Sharma and are not public. Instructions on how to generate reference fasta files according to the tutorial are copied below.

## “Undesired RNA” annotation
Organism of interest: Homo sapiens (Human)

A FASTA file containing rRNA, snRNA and snoRNA sequences can be generated from Ensembl biomart by clicking-on/selecting the following options in order:

Database: Ensembl Genes (Version)  
Dataset: Human genes (Version)  
Click “Filters”  
Expand the “Gene” tab  
Select Transcript type: rRNA, snRNA, snoRNA  
Click “Attributes”  
Select “Sequences” (Radio button) and expand the “Sequences” tab  
Select “Unspliced (gene)”  
Expand the “Header information” tab  
Select “Gene stable ID”  
Click “Count”  
Click “Results”  
Download the FASTA file  

tRNA FASTA sequences can be obtained from Genomic tRNA database

Under “Links to Most Viewed Genomes”, select “Homo sapiens (GRCh38/hg38)”  
On the left hand side, select “FASTA Seqs”  
Download “High confidence tRNA sequences: hg38-tRNAs.fa”  

Use NCBI Nucleotide module to procure 45S, 28S, 18S, 5.8S, 5S rRNA sequences.

Search: biomol_rRNA[prop] AND “Homo sapiens”[Organism].  
On the top right, click “Send to”  
Select “File”  
Select Format: FASTA  
Click “Create File”  

## Genome annotation
The reference genome annotation can be procured from Ensembl by clicking on the DNA(FASTA) of Homo sapiens. From the Ensembl FTP server where you will encounter a bunch of files. The file you are interested in will be named “Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz”

Also download the relevant GTF file from Ensembl under “Gene sets” named Homo_sapiens.GRCh38.108.gtf.gz (at the time of writing).

## Transcriptome annotation
A FASTA file containing sequences of principle splice isoforms that are extended by 18 nt in 5’- and 3’- ends can be generated from Ensembl biomart by clicking-on/selecting the following options in order:

Database: Ensembl Genes (Version)  
Dataset: Human genes (Version)  
Click “Filters”  
Expand the “Gene” tab  
Select Transcript type: protein_coding  
Check APPRIS annotation  
Click “Attributes”  
Select “Sequences” (Radio button) and expand the “Sequences” tab  
Select “Coding sequence”  
Check Upstream flank and provide the value “18”  
Check the Downstream flank and provide the value “18”  
Expand the “Header information” tab  
Select “Transcript stable ID” and “Gene name”  
Click “Count”  
Click “Results”  
Download the FASTA file (called GRCh38_APPRIS_CDS_18.fa in this module)  
