# Steps to align trimmed RNA-seq reads against the reference genome of House sparrow

Create genome index <br>
Command script: `1_star_g_generate.sh`
Run script: `bash star_g_generate_run.sh`

Align reads against the genome <br>
Command script: `2_star_align_reads.sh`
Run script: `bash star_align_reads_run.sh`

Use the splice junctions output from round 1 and create genome index again
Command script: `3_star_g_generate_2pass.sh`
Run script: `bash star_g_generate_2pass_run.sh`

Redo the alignment
Run command: `bash star_align_reads_2pass_run.sh`

