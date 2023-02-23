#!/bin/bash

if [ $# -ne 5 ]; then
    echo "Incorrect number of parameters"
    echo "Specify the genome, output file, window size, chromosome number, and the threshold"
    exit
fi

Genome=$1
OutFile=$2
WindowSize=$3
ChromosomeNumber=$4
Threshold=$5

echo "Genome: <$Genome>"
echo "OutFile: <$OutFile>"
echo "WindowSize: <WindowSize>"
echo "ChromosomeNumber: <ChromosomeNumber>"
echo "Threshold: <Threshold>"

cd ./scripts
Rscript run_g4hunter.R $Genome $OutFile $WindowSize $ChromosomeNumber $Threshold
