
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
ChromosomeNumber = paste0(args[4])
Threshold = as.double(args[5])

sprintf("Genome: %s", Genome)
sprintf("OutFile: %s", OutFile)
sprintf("WindowSize: %s", WindowSize)
sprintf("ChromosomeNumber: %s", ChromosomeNumber)
sprintf("Threshold: %s", Threshold)

# If Genome is a tar file, we are running G4Hunter on a user-provided genome
# Must install the tar file for genome before loading it
if (endsWith(Genome, ".tar")) {
  sprintf("Install user defined genome %s", Genome)
  install.packages(sprintf("/%s", Genome), repos=NULL, type="source")
  Genome=tools::file_path_sans_ext(Genome)

  library(Genome, character.only=TRUE)
  genome <- getBSgenome(Genome)
} else {
  available_genomes <- BSgenome::available.genomes()
  if( !(Genome %in% available_genomes) ){
   stop("Specified genome ", Genome, " not available!", call.=FALSE)
  }

  BiocManager::install(Genome, force = TRUE)
  library(Genome, character.only=TRUE)
  genome <- getBSgenome(Genome)
}

ChrIdx=which(array(seqnames(genome)) == sprintf("chr%s", ChromosomeNumber))
sprintf("ChrIdx %s for ChromosomeNumber %s", ChrIdx, ChromosomeNumber)

toto=G4hunt(i=ChrIdx, k=WindowSize, hl=Threshold, gen=genome, masked=5)
titi=G4huntrefined(toto, gen=genome, i=ChrIdx)
write.table(as.data.frame(titi), OutFile, sep='\t', col.names=NA)

