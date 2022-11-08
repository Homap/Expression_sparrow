#!/usr/bin/bash

reference='../data/references/house_sparrow_genome_assembly-18-11-14.fa'

mkdir -p ../data/references/star_index_house_2pass

sbatch star_g_generate_2pass.sh ../data/references/star_index_house_2pass $reference \
../data/gff/cass.gff ../data/mapping/star/star_1pass_SJ/star_1pass_SJ_cat.txt
