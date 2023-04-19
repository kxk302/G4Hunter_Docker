#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Incorrect number of parameters"
    echo "Specify the output directory, window size, and the threshold"
    exit
fi

OutDir=$1
WindowSize=$2
Threshold=$3

echo "OutDir: <$OutDir>"
echo "WindowSize: <$WindowSize>"
echo "Threshold: <$Threshold>"

cwd=`pwd`
echo "cwd: <$cwd>"

for i in {1..22}
do
  OutFile="${OutDir}/g4hunter_hsapiens_${WindowSize}_${i}_${Threshold}.txt" 
  echo "$OutFile"
  ./scripts/run_g4hunter.sh "${cwd}/genomes/BSgenome.Hsapiens.NCBI.T2TCHM13v20.tar" $OutFile $WindowSize $i $Threshold
done

OutFile="${OutDir}/g4hunter_hsapiens_${WindowSize}_X_${Threshold}.txt" 
echo "OutFile: <$OutFile>"
./scripts/run_g4hunter.sh "${cwd}/genomes/BSgenome.Hsapiens.NCBI.T2TCHM13v20.tar" $OutFile $WindowSize X $Threshold

OutFile="${OutDir}/g4hunter_hsapiens_${WindowSize}_Y_${Threshold}.txt" 
echo "$OutFile"
./scripts/run_g4hunter.sh "${cwd}/genomes/BSgenome.Hsapiens.NCBI.T2TCHM13v20.tar" $OutFile $WindowSize Y $Threshold
