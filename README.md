### Mapsembler2 description ###

Mapsembler2 is a targeted assembly software. It takes as input any number of NGS raw read set(s) (fasta or fastq, gzipped or not) and a set of input sequences (starters). For each starter, Mapsembler2 outputs its sequence neighborhood as a linear sequence or as a graph, depending on the user choice. Mapsembler2 may be used for (not limited to): · Validate an assembled sequence (input as starter), e.g. from a de Bruijn graph assembly where read-coherence was not enforced. Checks if a known enzyme is present in a metagenomic NGS read set. · Enrich unmappable reads by extending them, possibly making them mappable · Checks what happens at the extremities of a contig · Check the presence / absence and quantify RNA seq splicing events. Check the presence/absence of SNPs or structural variants, …


### Import the dockerfile ###

git clone https://github.com/cmonjeau/docker-mapsembler2.git

### Build the dockerfile ###

docker build -t cmonjeau/mapsembler2 .

### Print mapsembler2 help ###

docker run -it --rm cmonjeau/mapsembler2

### Run mapsembler2 with data (inside /home/user/Mapsembler2 directory)

docker run -it --rm -v /home/user/Mapsembler2:/data cmonjeau/mapsembler2 -s /data/starter.fa -r "/data/reads1.fa /data/reads2.fa" -t 1 -p /data/mapsembler_result


