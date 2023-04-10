#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Incorrect number of parameters"
    echo "Specify the path for g4hunter output file, and the output bed file's directory"
    exit
fi

G4HunterOutput=$1
BedFileDir=$2

echo ":G4HunterOutput <$G4HunterOutput>"
echo "BedFileDir: <$BedFileDir>"

G4HunterDir=`dirname $G4HunterOutput`
G4HunterFileName=`basename $G4HunterOutput`
G4HunterFileNameWithoutExtension="${G4HunterFileName%.*}"

BedExtension=".bed"
BedFilePath="$BedFileDir/$G4HunterFileNameWithoutExtension$BedExtension"
echo "BedFilePath: <$BedFilePath>"

awk 'NR>1{gsub(/"/,"",$2); gsub(/"/,"",$6); print $2 "\t" $3-1 "\t" $4-1 "\t" $7 "\t" $6 "\t" $5}' $G4HunterOutput > $BedFilePath
