#!/bin/bash

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/cleaning

cd $REFERENCE_DIR

#converts fasta file with multiple lines of bases to long single lines
awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < principle_splice_isoform.fa > principle_splice_isoform_singleline.fa
