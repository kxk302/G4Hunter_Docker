
source('../G4HunterPaperGit/function_G4Hunter.r')

# Process command line arguments
args = commandArgs(trailingOnly=TRUE)
argsLen <- length(args);
if (argsLen != 5) {
  stop("Specify the genome, output file, window size, chromosome number, and the threshold", call.=FALSE)
}

Genome = paste0(args[1])
OutFile = paste0(args[2])
WindowSize = as.integer(args[3])
ChromosomeNumber = as.integer(args[4])
Threshold = as.double(args[5])

sprintf("Genome: %s", Genome)
sprintf("OutFile: %s", OutFile)
sprintf("WindowSize: %s", WindowSize)
sprintf("ChromosomeNumber: %s", ChromosomeNumber)
sprintf("Threshold: %s", Threshold)

available_genomes <- BSgenome::available.genomes()
if( !(Genome %in% available_genomes) ){
 stop("Specified genome ", Genome, " not available!", call.=FALSE)
}

BiocManager::install(Genome)
library(Genome, character.only=TRUE)
genome <- getBSgenome(Genome)

toto=G4hunt(i=ChromosomeNumber, k=WindowSize, hl=Threshold, gen=genome, masked=5)
titi=G4huntrefined(toto, gen=genome, i=ChromosomeNumber)
write.table(as.data.frame(titi), OutFile, sep='\t', col.names=NA)

