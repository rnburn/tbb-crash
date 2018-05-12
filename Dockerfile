FROM ubuntu:17.10
ADD . /src
RUN set -x \
# (777 to ensure APT's "_apt" user can access it too)
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
              build-essential \
              cmake \
              curl \
              git \
              ca-certificates \
              golang \
              realpath \
              wget \
              automake \
              autogen \
              autoconf \
              libtool \
              m4 \
# Install bazel
  && apt-get install --no-install-recommends --no-install-suggests -y \
              openjdk-8-jdk \
  && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
  && curl https://bazel.build/bazel-release.pub.gpg | apt-key add - \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
              bazel \
  && apt-get upgrade -y bazel \
# Build
  && cd src 
  # \
  # && bazel build //... \
  # && bazel-bin/fib 25
