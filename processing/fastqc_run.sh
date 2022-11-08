#!/bin/sh                                                                
                                                                         
# This is a script to loop over the RNAseq files and submit              
# jobs for Fastqc analysis.                                              
                                                                         
workdir='../data/trimm'

while read -r sampledir                                                  
do                                                                       
echo ${sampledir}     
fastq1=$(find ${workdir}/${sampledir} -type f -name "*R1*_trim_pair.fastq.gz") 
fastq2=$(find ${workdir}/${sampledir} -type f -name "*R2*_trim_pair.fastq.gz")
echo ${fastq1} ${fastq2} ${workdir}/${sampledir}
sbatch fastqc.sh ${fastq1} ${fastq2} ${workdir}/${sampledir}
done < ../doc/sample_RNAseq.txt
