#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000M
#SBATCH --job-name=cooccupancy

REFERENCE_DIR=/data/users/tschlatter/Ribosome_profiling/dataset

cd $REFERENCE_DIR
mkdir -p codonoccupancy

../scripts/14_1_Codon_occupancy_cal.sh \
../cleaning/principle_splice_isoform_singleline.fa \
./RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_splice.sam

mv ./Codon_occupancy.txt codonoccupancy/RPF_KO_Rep1_Codon_occupancy.txt

../scripts/14_1_Codon_occupancy_cal.sh \
../cleaning/principle_splice_isoform_singleline.fa \
./RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_splice.sam

mv ./Codon_occupancy.txt codonoccupancy/RPF_KO_Rep2_Codon_occupancy.txt

../scripts/14_1_Codon_occupancy_cal.sh \
../cleaning/principle_splice_isoform_singleline.fa \
./RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_splice.sam

mv ./Codon_occupancy.txt codonoccupancy/RPF_WT_Rep1_Codon_occupancy.txt

../scripts/14_1_Codon_occupancy_cal.sh \
../cleaning/principle_splice_isoform_singleline.fa \
./RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_splice.sam

mv ./Codon_occupancy.txt codonoccupancy/RPF_WT_Rep2_Codon_occupancy.txt