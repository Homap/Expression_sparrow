#!/bin/sh

trimdir='../data/trimm'
genomedir='../data/references/star_index_house_2pass'
reference='../data/references/house_sparrow_genome_assembly-18-11-14.fa'

#mkdir -p ../data/mapping/star/star_house_reference_2pass
outdir='../data/mapping/star/star_house_reference_2pass'

while read -r sampledir                                                          
do
echo ${sampledir}
Read_1=$(find ${trimdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
Read_2=$(find ${trimdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${Read_1} ${Read_2}
mkdir -p ${outdir}/${sampledir}
sbatch star_align_reads.sh $genomedir ${Read_1} ${Read_2} \
${outdir}/${sampledir}/${sampledir}_
done < ../doc/rerun_mapping.txt #../doc/sample_RNAseq.txt
