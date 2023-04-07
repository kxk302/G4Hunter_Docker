import argparse
import re
from os import path

CHR="chromosome"

def split_fasta_file(fasta_file, output_dir):
  with open(fasta_file, 'r') as fp:
    fp_w = None

    for line in fp:
      # Extract chromosome idx from line starting with '>' and create a file to save chromosome sequence
      if line.startswith('>'):

        if fp_w is not None:
          # Close file pointer for previous line starting with '>'
          fp_w.close()

        # findall returns a list, of size one for our case. Get the first element of the list
        chr_idx = re.findall(CHR + ' \w{1,2}', line)[0]
        # Split, say, 'chromosome 22' into 'chromosomes' and '22'
        # Split returns a list. Get the second element of the list for chromosome index
        idx = re.split('\s', chr_idx)[1]
        print(f'Chromosome index: {idx}')

        # Create output file full path
        output_file_path = path.join(output_dir, f'chr{idx}.fa')

        # Open file to save chromosome sequence
        fp_w = open(output_file_path, 'w')
        fp_w.write(line)

      else:
        fp_w.write(line)


if __name__ == '__main__':
  argumentParser = argparse.ArgumentParser()
  argumentParser.add_argument('-f', '--fasta_file', help='Path to .fna file', type=str, required=True)
  argumentParser.add_argument('-o', '--output_dir', help='Output files directory', type=str, required=True)
  args = argumentParser.parse_args()

  split_fasta_file(args.fasta_file, args.output_dir)
