############################################################
# Dockerfile to build Mapsembler2 tool container image
# Based on debian wheezy
############################################################

# Set the base image to debian wheezy
FROM debian:wheezy

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive
ENV PACKAGES wget make cmake gcc g++ zlib1g-dev unzip

ENV ZIP http://www.irisa.fr/symbiose/people/ppeterlongo/mapsembler2_2.2.3.zip
ENV SOURCE mapsembler2_pipeline
ENV DIR /opt

################## DEPENDENCIES INSTALLATION ######################

RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

################## MAPSEMBLER2 INSTALLATION ######################

WORKDIR ${DIR}
ADD ${ZIP} tmp.zip
RUN unzip tmp.zip && rm tmp.zip
WORKDIR ${DIR}/${SOURCE}
RUN /bin/bash compile_all_tools.sh

ENTRYPOINT ["./run_mapsembler2_pipeline.sh"]
CMD ["-h"]

##################### Maintainer #####################

MAINTAINER Monjeaud Cyril <Cyril.Monjeaud@irisa.fr>

#################### Example ########################
# docker run -it --rm cmonjeau/mapsembler2
# docker run -it --rm -v /home/user/Mapsembler2:/data cmonjeau/mapsembler2 -s /data/starter.fa -r "/data/reads1.fa /data/reads2.fa" -t 1 -p /data/mapsembler_result

