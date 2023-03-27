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
echo "WindowSize: <$WindowSize>"
echo "ChromosomeNumber: <$ChromosomeNumber>"
echo "Threshold: <$Threshold>"

OutDir=`dirname $OutFile`
OutFileName=`basename $OutFile`

# If Genome is a tar file, we are running G4Hunter on a user-provided genome
# Must make the tar file on host available in the container
if [[ $Genome == *tar ]]
then
  GenomeTarFilePath=$Genome
  GenomeTarFileName=`basename $GenomeTarFilePath`
  DOCKER_CMD="docker run -v $OutDir:/output -v $GenomeTarFilePath:/$GenomeTarFileName kxk302/g4hunter:1.0.0 $GenomeTarFileName /output/$OutFileName $WindowSize $ChromosomeNumber $Threshold"
else
  DOCKER_CMD="docker run -v $OutDir:/output kxk302/g4hunter:1.0.0 $Genome /output/$OutFileName $WindowSize $ChromosomeNumber $Threshold"
fi

echo $DOCKER_CMD
$DOCKER_CMD
