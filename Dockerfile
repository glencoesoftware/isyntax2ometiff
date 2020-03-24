FROM ubuntu:18.04
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    libblosc-dev \
    libcurl4 \
    libegl1-mesa \
    libgles2-mesa \
    libjpeg-turbo8 \
    libpng16-16 \
    libtinyxml2.6.2v5 \
    python3 \
    python3-setuptools \
    unzip \
    python3-dev \
    openjdk-11-jdk-headless \
    g++
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
RUN python3 /tmp/get-pip.py
COPY philips-pathologysdk-*.zip /tmp
COPY convert.sh /opt
RUN unzip /tmp/philips*.zip -d /tmp
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-modules/philips-pathologysdk-pixelengine*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-modules/philips-pathologysdk-softwarerenderer*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python36-modules/philips-pathologysdk-python3-pixelengine*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python36-modules/philips-pathologysdk-python3-softwarerendercontext*.deb
RUN dpkg -i /tmp/philips-pathologysdk-*/pathologysdk-python36-modules/philips-pathologysdk-python3-softwarerenderbackend*.deb
RUN rm -rf /tmp/philips*
COPY isyntax2raw*.whl /tmp
RUN pip install /tmp/isyntax2raw*.whl
RUN rm -rf /tmp/isyntax2raw*
COPY raw2ometiff*.zip /tmp
RUN unzip /tmp/raw2ometiff*.zip -d /opt
RUN rm -rf /tmp/raw2ometiff*
RUN ln -s /opt/raw2ometiff*/bin/raw2ometiff /usr/bin/raw2ometiff

USER nobody
ENTRYPOINT ["/opt/convert.sh"]
