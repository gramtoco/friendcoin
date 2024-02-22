FROM amd64/ubuntu:20.04 AS base

#If you found this docker image helpful please donate PEJE to the maintainer
LABEL maintainer="RV9zdNeUTQUToZUcRp9uNF8gwH5LzDFtan"

EXPOSE 9766/tcp
EXPOSE 2024/tcp

ENV DEBIAN_FRONTEND=noninteractive

#Install runtime dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	bash wget net-tools libminiupnpc17 \
	libevent-2.1 libevent-pthreads-2.1 \
	libboost-system1.71 libboost-filesystem1.71 libboost-chrono1.71 \
	libboost-program-options1.71 libboost-thread1.71 \
	libzmq5 && \
	apt-get clean

FROM base AS build

#Install build dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	bash net-tools build-essential libtool autotools-dev automake \
	pkg-config libssl-dev libevent-dev bsdmainutils python3 \
	libboost-system1.71-dev libboost-filesystem1.71-dev libboost-chrono1.71-dev \
	libboost-program-options1.71-dev libboost-test1.71-dev libboost-thread1.71-dev \
	libzmq3-dev libminiupnpc-dev && \
	apt-get clean

#Copy source dir
COPY . /home/pejecoin/build/Pejecoin/
WORKDIR /home/pejecoin/build/Pejecoin

#build db4 from source
WORKDIR /home/pejecoin/build/Pejecoin/contrib
RUN ./install_db4.sh ../../

# build Pejecoincore
WORKDIR /home/pejecoin/build/Pejecoin
RUN ./autogen.sh && ./configure --disable-tests BDB_LIBS="-L/home/pejecoin/build/db4/lib -ldb_cxx-4.8" BDB_CFLAGS="-I/home/pejecoin/build/db4/include" --with-gui=no  && make -j4

FROM base AS final

#Add our service account user
RUN useradd -ms /bin/bash pejecoin && \
	mkdir /var/lib/pejecoin && \
	chown pejecoin:pejecoin /var/lib/pejecoin && \
	ln -s /var/lib/pejecoin /home/pejecoin/.pejecoin && \
	chown -h pejecoin:pejecoin /home/pejecoin/.pejecoin

VOLUME /var/lib/pejecoin

#Copy the compiled binaries from the build
COPY --from=build /home/pejecoin/build/Pejecoin/src/pejecoind /usr/local/bin/pejecoind
COPY --from=build /home/pejecoin/build/Pejecoin/src/pejecoin-cli /usr/local/bin/pejecoin-cli

WORKDIR /home/pejecoin
USER pejecoin

CMD /usr/local/bin/pejecoind -datadir=/var/lib/pejecoin -printtoconsole -onlynet=ipv4
