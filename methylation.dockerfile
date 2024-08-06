FROM mambaorg/micromamba:latest
RUN micromamba install --yes --name base -c bioconda -c conda-forge \
 python=3.12.4 \
 samtools \
 trim-galore \
 fastqc \
 bowtie2 \
 hisat2 \
 minimap2 \
 bismark \
 multiqc
RUN micromamba clean --all --yes

#if you need to run pip install in the same environment, uncomment the following lines
#ARG MAMBA_DOCKERFILE_ACTIVATE=1
#RUN pip install --no-cache myPythonPackage
