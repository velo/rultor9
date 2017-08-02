# Copyright (c) 2009-2016, rultor.com
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met: 1) Redistributions of source code must retain the above
# copyright notice, this list of conditions and the following
# disclaimer. 2) Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following
# disclaimer in the documentation and/or other materials provided
# with the distribution. 3) Neither the name of the rultor.com nor
# the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
# NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
# THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

FROM yegor256/rultor
MAINTAINER Marvin Froeder <velobr@gmail.com>
LABEL Description="This is a Rultor.com image with java 9"

# Java Version
ENV  JAVA_VERSION=9 \
     JAVA_UPDATE=ea \
     JAVA_BUILD=178  \
     JAVA_HOME=/usr/lib/jvm/current-java

RUN set -x && \
  cd /tmp && \
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.java.net/java/jdk9/archive/${JAVA_BUILD}/binaries/jre-${JAVA_VERSION}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
  tar xzf "jre-${JAVA_VERSION}+${JAVA_BUILD}_linux-x64_bin.tar.gz" && \
  mkdir -p /usr/lib/jvm && mv "/tmp/jre-${JAVA_VERSION}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle"  && \
  ln -s "java-${JAVA_VERSION}-oracle" $JAVA_HOME && \
  rm /usr/bin/java && \
  ln -s $JAVA_HOME/bin/java /usr/bin/java && \
  rm -rf $JAVA_HOME/*.txt && \
  rm -rf $JAVA_HOME/*.html && \
  java -version

RUN mvn -v
