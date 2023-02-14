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

InFileName=`basename $InFile`
OutDir=`dirname $OutFile`
OutFileName=`basename $OutFile`

DOCKER_CMD="docker run -v $InFile:/$InFileName -v $OutDir:/output kxk302/g4hunter:1.0.0 /$InFileName /output/$OutFileName"
echo $DOCKER_CMD
$DOCKER_CMD
