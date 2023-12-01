#!/bin/bash

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mGorGor1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Gorilla_gorilla/ -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mPanPan1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Pan_paniscus/ -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mPanTro3.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Pan_troglodytes/ -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mPonAbe1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Pongo_abelii/ -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mPonPyg2.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Pongo_pygmaeus/ -p chr

python3 ./scripts/split_fasta_file.py -f ~/workspace/non-B_gfa/v2/input/mSymSyn1.pri.cur.20231122.fasta -o ~/workspace/non-B_gfa/v2/output/Symphalangus_syndactylus/ -p chr
