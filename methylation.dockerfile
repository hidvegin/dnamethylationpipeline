#debian from dockerhub
FROM ubuntu:24.10

#metadata
LABEL base.image="ubuntu:24.10"
LABEL software="bismark"
LABEL software.version="0.24.2"
LABEL dockerfile.version="1"
LABEL description="DNA methylation pipeline"
LABEL website="https://github.com/FelixKrueger/Bismark"
LABEL license="https://github.com/FelixKrueger/Bismark/blob/master/license.txt"

WORKDIR /

#update debian
RUN apt update && \
	apt upgrade -y && \
	apt install -y wget vim bzip2 && \
	apt clean -y && \
    rm -rf /var/lib/apt/lists/*

#install miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py311_23.5.2-0-Linux-x86_64.sh -O ~/miniconda.sh && \
 bash ~/miniconda.sh -b -u -p /opt/conda && \
 rm -rf /opt/conda/miniconda.sh

#set environment
ENV PATH="/opt/conda/bin:$PATH"

#update conda
RUN conda update conda -y

#install conda packages
RUN conda install --yes -c bioconda \
samtools \
trim-galore \
fastqc \
bowtie2 \
hisat2 \
minimap2 \
multiqc
RUN conda clean --all --yes
