#!/bin/bash

if [ $# -ne 2 ]; then 
    echo "Incorrect number of parameters"
    echo "Specify input file and output file"
    exit
fi

InFile=$1
OutFile=$2
echo "InFile: <$InFile>"
echo "OutFile: <$OutFile>"

cd /G4HunterPaperGit

InFileContent=`cat $InFile`
echo $InFileContent

Rscript -e "install.packages('BiocManager'); BiocManager::install('S4Vectors'); source('function_G4Hunter.r'); sink('$OutFile'); G4Hscore('$InFileContent'); sink()"
