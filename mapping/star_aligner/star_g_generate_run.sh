#!/usr/bin/bash

reference='../data/references/house_sparrow_genome_assembly-18-11-14.fa'

mkdir -p ../data/references/star_index_house

sbatch star_g_generate.sh ../data/references/star_index_house $reference ../data/gff/cass.gff
