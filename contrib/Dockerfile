FROM amd64/ubuntu:20.04 AS base

#If you found this docker image helpful please donate FRENS to the maintainer
LABEL maintainer="RV9zdNeUTQUToZUcRp9uNF8gwH5LzDFtan"

EXPOSE 4206/tcp
EXPOSE 4207/tcp

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
COPY . /home/fren/build/Frencoin/
WORKDIR /home/fren/build/Frencoin

#build db4 from source
WORKDIR /home/fren/build/Frencoin/contrib
RUN ./install_db4.sh ../../

# build Frencore
WORKDIR /home/fren/build/Frencoin
RUN ./autogen.sh && ./configure --disable-tests BDB_LIBS="-L/home/fren/build/db4/lib -ldb_cxx-4.8" BDB_CFLAGS="-I/home/fren/build/db4/include" --with-gui=no  && make -j4

FROM base AS final

#Add our service account user
RUN useradd -ms /bin/bash fren && \
	mkdir /var/lib/fren && \
	chown fren:fren /var/lib/fren && \
	ln -s /var/lib/fren /home/fren/.fren && \
	chown -h fren:fren /home/fren/.fren

VOLUME /var/lib/fren

#Copy the compiled binaries from the build
COPY --from=build /home/fren/build/Frencoin/src/frend /usr/local/bin/frend
COPY --from=build /home/fren/build/Frencoin/src/fren-cli /usr/local/bin/fren-cli

WORKDIR /home/fren
USER fren

CMD /usr/local/bin/frend -datadir=/var/lib/fren -printtoconsole -onlynet=ipv4
