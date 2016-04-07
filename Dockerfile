#
# Oracle Java container
#
FROM ubuntu:14.04

MAINTAINER CarlosMecha

LABEL jdk.version="1.8.0_77" jdk.original-filename="jdk-8u77-linux-x64.tar.gz"

# Instalation
ADD jdk.tar.gz /tmp/
RUN ls /tmp/ | grep jdk | xargs -I % mv /tmp/% /opt/java

# Configuration
ENV JAVA_HOME /opt/java
RUN echo "export JAVA_HOME=/opt/java\nexport PATH=$PATH:$JAVA_HOME/bin" > /etc/profile.d/java-env.sh
RUN update-alternatives --install /bin/java java $JAVA_HOME/bin/java 999999
RUN update-alternatives --install /bin/javac javac $JAVA_HOME/bin/javac 999999
RUN update-alternatives --install /bin/jar jar $JAVA_HOME/bin/jar 999999
RUN update-alternatives --install /bin/javadoc javadoc $JAVA_HOME/bin/javadoc 999999
