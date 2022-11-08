#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 10
#SBATCH -t 10:00:00
#SBATCH -J STAR_alignment
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools
module load samtools/1.10
module load bowtie2/2.3.5.1
module load star/2.7.2b

genomedir=$1
fasta=$2
gff=$3
SJ=$4

STAR --runMode genomeGenerate --genomeDir $genomedir --genomeFastaFiles $fasta \
--sjdbGTFfile $gff --runThreadN 8 --sjdbOverhang 100 --sjdbFileChrStartEnd $SJ



