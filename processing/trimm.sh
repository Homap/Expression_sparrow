#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 05:00:00
#SBATCH -J trimm
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools trimmomatic/0.36

F_IN=$1
R_IN=$2
F_PAIR_OUT=$3
F_UNPAIR_OUT=$4
R_PAIR_OUT=$5
R_UNPAIR_OUT=$6
ADAPT_FAST=$7
STAT=$8

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -threads 16 \
$F_IN $R_IN $F_PAIR_OUT $F_UNPAIR_OUT $R_PAIR_OUT $R_UNPAIR_OUT \
ILLUMINACLIP:${ADAPT_FAST}:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50 |& tee $STAT


