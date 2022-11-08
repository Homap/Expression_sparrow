#!/bin/sh
 
# set path to the adpater sequence 
ADAPT_FAST='../doc/TruSeq3-PE-2.fa' 
workdir='../../Data/RNA_raw_data/171013_K00253.A.Project_Guldvag-RNA-2017-05-11'
OUTDIR='../data/trimm'

while read -r sampledir                                                          
do                                                                                                                                     
echo ${sampledir}        
F_IN=$(find ${workdir}/${sampledir} -type f -name "*R1*.fastq.gz") 
R_IN=$(find ${workdir}/${sampledir} -type f -name "*R2*.fastq.gz")                                                          
echo ${F_IN} ${R_IN}                                                          
mkdir -p $OUTDIR/${sampledir}
F_PAIR_OUT=$OUTDIR/${sampledir}/$(basename $F_IN .fastq.gz)_trim_pair.fastq.gz
R_PAIR_OUT=$OUTDIR/${sampledir}/$(basename $R_IN .fastq.gz)_trim_pair.fastq.gz
F_UNPAIR_OUT=$OUTDIR/${sampledir}/$(basename $F_IN .fastq.gz)_trim_unpair.fastq.gz
R_UNPAIR_OUT=$OUTDIR/${sampledir}/$(basename $R_IN .fastq.gz)_trim_unpair.fastq.gz
STAT=$OUTDIR/${sampledir}/$(basename $F_IN _R1_001.fastq.gz).stats
echo $F_PAIR_OUT $R_PAIR_OUT $F_UNPAIR_OUT $R_UNPAIR_OUT $STAT
echo "submitting trimmomatic job"
sbatch trimm.sh $F_IN $R_IN $F_PAIR_OUT $F_UNPAIR_OUT $R_PAIR_OUT $R_UNPAIR_OUT $ADAPT_FAST $STAT
done < ../doc/sample_RNAseq.txt
