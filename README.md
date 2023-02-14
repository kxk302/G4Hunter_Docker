# G4Hunter

G4Hunter [1] is a powerful and widely used tool for G4 prediction which takes into account G-richness and G-skewness of a DNA or
RNA sequence and provides a quadruplex propensity score. G4Hunter is written in R programming language. The source code is
available at https://github.com/LacroixLaurent/G4HunterPaperGit.

Running G4Hunter requires installation of a specific version of R, and specific versions of several R packages as depenecies. These
steps take some time and are different for different operating systems. In this project, we Dockerize G4Hunter to avoid repeating
these configuration steps everytime a user wants to run G4Hunter. A text file called a Dockerfile is used to specify all the
configuration steps. A Docker engine creates a Docker image from the Dockerfile. Docker engine runs containers created off of the
docker image. Container technologies such as Docker also offer other benefits such as portability, performance, agility, isolation,
and scalability [2].

In order to run the Dockerized version of G4Hunter, you need to have the Docker engine installed on your box. Please refer to
instructions at https://docs.docker.com/engine/install/. You also need the G4Hunter Docker image. You can either get the G4Hunter
Docker image from Docker Hub, or you can build the image locally. If you are getting the image from the Docker Hub (preferred),
you can skip the instructions for building/pushing the image, and go to the instructions for running G4Hunter Docker container.

# Getting the G4Hunter Docker Image

To pull the G4Hunter Docker image from your Docker Hub repository:
> docker pull kxk302/g4hunter:1.0.0

To view the pulled image:
> docker images -f "reference=kxk302/g4hunter:1.0.0"

# Building/Pushing the G4Hunter Docker Image

All the commands are run in the same directory, say, /Users/kxk302/workspace/

Clone G4Hunter_Docker repository (This creates a folder called G4Hunter_Docker):
> git clone https://github.com/kxk302/G4Hunter_Docker.git

Change your directory to G4Hunter_Docker folder:
> cd ./G4Hunter_Docker

To create a Docker image:
> docker build --progress=plain -t kxk302/g4hunter:1.0.0 .

To view the created image:
> docker images -f "reference=kxk302/g4hunter:1.0.0"

To push the created image to your Docker Hub repository (You need to regsitered at https://hub.docker.com/):
> docker login\
> docker push kxk302/g4hunter:1.0.0

# Running the G4Hunter Docker Container

Suppose you want to run G4Hunter on a .fasta file located at '/Users/kxk302/workspace/G4Hunter_Docker/input/test.fasta' folder.
The input file name is 'test.fasta', the input file folder is '/Users/kxk302/workspace/G4Hunter_Docker/input/', and absolute path
to input file name is '/Users/kxk302/workspace/G4Hunter_Docker/input/test.fasta'.

Suppose you want G4Hunter to save the output file at '/Users/kxk302/workspace/G4Hunter_Docker/output/test_out.txt'. The output file
name is 'test_out.txt', the output file folder is '/Users/kxk302/workspace/G4Hunter_Docker/output/', and absolute path
to output file name is '/Users/kxk302/workspace/G4Hunter_Docker/output/test_out.txt'.

To run the containerized version of G4Hunter, run the following command:
> ./scripts/run_g4hunter.sh <InputFileAbsolutePath> <OutputFileAbsolutePath>

For example:

> ./scripts/run_g4hunter.sh  /Users/kxk302/workspace/G4Hunter_Docker/input/test.fasta /Users/kxk302/workspace/G4Hunter_Docker/output/test_out.txt

# References

1. Václav Brázda, Jan Kolomazník, Jiří Lýsek, Martin Bartas, Miroslav Fojta, Jiří Šťastný, Jean-Louis Mergny, G4Hunter web
   application: a web server for G-quadruplex prediction, Bioinformatics, Volume 35, Issue 18, September 2019, Pages 3493–3495,
   https://doi.org/10.1093/bioinformatics/btz087

2. https://www.microfocus.com/documentation/visual-cobol/vc60/EclUNIX/GUID-F5BDACC7-6F0E-4EBB-9F62-E0046D8CCF1B.html
