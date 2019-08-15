FROM registry.centos.org/centos:latest

ENV JAVA_VERSION 11

RUN yum -y install java-11-openjdk-devel \
    yum -y install wget curl unzip dos2unix rpm-build rpmdevtools git openssh-clients epel-release https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi && \
    yum -y install vips vips-devel make gcc-c++.x86_64 && \
    yum clean all && \
    export JAVA_LIBDIR=/usr/share/java && \
    export JNI_LIBDIR=/usr/lib/java && \
    export JVM_ROOT=/usr/lib/jvm && \
    export JAVA_HOME=$JVM_ROOT/java && \
    export PATH=$PATH:$JAVA_HOME/bin && \
    export CLASSPATH=$JAVA_HOME/lib
