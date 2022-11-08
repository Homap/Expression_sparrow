#!/bin/bash -l

#SBATCH -A snic2019-3-506
#SBATCH -p core
#SBATCH -n 12
#SBATCH -t 24:00:00
#SBATCH -J STAR_GenomeGenerate_2Pass
#SBATCH --mail-user=homa.papoli_yazdi@biol.lu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools
module load samtools/1.10
module load bowtie2/2.3.5.1
module load star/2.7.2b

genomedir=$1
reference=$2
gff=$3

# generate genome with junctions from the 1st pass
STAR --runMode genomeGenerate --genomeDir $genomedir \
--genomeFastaFiles $reference \
--sjdbGTFfile $gff --sjdbGTFtagExonParentTranscript Parent \
--sjdbOverhang 100 --genomeChrBinNbits 15 --runThreadN 12


