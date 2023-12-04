#!/bin/bash

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mGorGor1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Gorilla_gorilla/seqs_srcdir -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mPanPan1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Pan_paniscus/seqs_srcdir -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mPanTro3.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Pan_troglodytes/seqs_srcdir -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mPonAbe1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Pongo_abelii/seqs_srcdir -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mPonPyg2.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Pongo_pygmaeus/seqs_srcdir -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/aggregate_fasta_files/mSymSyn1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/input/Symphalangus_syndactylus/seqs_srcdir -p chr
