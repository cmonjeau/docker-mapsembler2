### Import the dockerfile ###

git clone https://github.com/cmonjeau/docker-mapsembler2.git

### To build a dockerfile ###

docker build -t cmonjeau/mapsembler2 .

### To print mapsembler2 help ###

docker run -it --rm cmonjeau/mapsembler2

### To run mapsembler with data (inside /home/user/Mapsembler2 directory)

docker run -it --rm -v /home/user/Mapsembler2:/data cmonjeau/mapsembler2 -s /data/starter.fa -r "/data/reads1.fa /data/reads2.fa" -t 1 -p /data/mapsembler_result



