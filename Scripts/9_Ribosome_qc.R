
setwd("C:\\Users\\Tim\\Desktop\\Bioinformatics_master\\RNA_SEQ\\Datasets")

#install.packages("devtools")
#install.packages("RiboseQC_0.99.0.tar.gz", repos = NULL, type="source")
library("devtools")
library(RiboseQC)

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = "C:\\Users\\Tim\\Desktop\\Bioinformatics_master\\RNA_SEQ\\Datasets",
                         twobit_file = "Homo_sapiens.GRCh38.dna_rm.primary_assembly.2bit",
                         gtf_file = "Homo_sapiens.GRCh38.108.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files

genome_bam <- c("RPF_WT_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "RPF_WT_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "RPF_KO_Rep1_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam",
                "RPF_KO_Rep2_clpd_tr_no_r_t_sno_sn_RNA_GRCh38_sorted.bam")

load_annotation("Homo_sapiens.GRCh38.108.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="Homo_sapiens.GRCh38.108.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "RPF_samples_QC.html",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)



