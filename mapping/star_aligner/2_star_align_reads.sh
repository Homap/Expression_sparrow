#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 24:00:00
#SBATCH -J STAR_alignment
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools
module load samtools/1.10
module load bowtie2/2.3.5.1
module load star/2.7.2b

genomedir=$1
pair1=$2
pair2=$3
out_prefix=$4

STAR --runMode alignReads --genomeDir $genomedir --readFilesCommand zcat \
--readFilesIn $pair1 $pair2 \
--outFileNamePrefix $out_prefix --outSAMtype BAM SortedByCoordinate --runThreadN 8
