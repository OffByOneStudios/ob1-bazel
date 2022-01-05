FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y build-essential apt-transport-https curl gnupg git

RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
RUN mv bazel.gpg /etc/apt/trusted.gpg.d/
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt update && apt-get -y install bazel

RUN bazel help

ADD ./ /usr/local/src/bazel-ob1/
WORKDIR /usr/local/src/bazel-ob1/