#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J htseq_raw_count
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools samtools htseq/0.9.1

hisat2_input_bam=$1            
gff_file=$2                                                                                          
htseq_output_gene_abundance_tsv=$3

htseq-count --format bam --order pos -s reverse --type gene --idattr ID -m union $hisat2_input_bam $gff_file > $htseq_output_gene_abundance_tsv
