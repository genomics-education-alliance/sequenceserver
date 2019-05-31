FROM debian:stretch-backports

LABEL Description="Intuitive local web frontend for the BLAST bioinformatics tool"
LABEL MailingList="https://groups.google.com/forum/#!forum/sequenceserver"
LABEL Website="http://www.sequenceserver.com"
LABEL Version="1.0.11 stable GEA"

RUN apt-get update  && apt-get install -y --no-install-recommends \
        build-essential \
        ruby ruby-dev \
        curl wget \
        gnupg \
        git \
        ncbi-blast+ \
        zlib1g-dev \
    && dpkg -r ncbi-blast+ \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && curl -SL ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.9.0/ncbi-blast-2.9.0+-x64-linux.tar.gz \
        | tar -xzC /usr/local \
    && ln -sf /usr/local/ncbi-blast-2.9.0+/bin/* /usr/bin/

COPY blast* tblat* /usr/local/bin/
RUN gem install sequenceserver

VOLUME ["/db"]
EXPOSE 4567

ENTRYPOINT ["sequenceserver", "-D", "-d", "/db", "--bin", "/usr/local/bin"]

