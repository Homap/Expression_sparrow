#!/bin/sh

hisat_input_bam='../data/mapping/star/star_house_reference_2pass'
mkdir -p ../data/htseq/htseq_house_reference
outdir='../data/htseq/htseq_house_reference'
gff_file='../data/gff/cass.gff'

while read -r sampledir
do
echo ${sampledir}
mkdir -p ${outdir}/${sampledir}
echo ${outdir}/${sampledir}/${sampledir}_htseq_gene.tsv ${hisat_input_bam}/${sampledir}/${sampledir}_Aligned.sortedByCoord.out.bam $gff_file
sbatch htseq.sh ${hisat_input_bam}/${sampledir}/${sampledir}_Aligned.sortedByCoord.out.bam $gff_file ${outdir}/${sampledir}/${sampledir}_htseq_gene.tsv
done < ../doc/samples_rerun.txt #sample_RNAseq.txt

