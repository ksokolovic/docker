# Pull base image
FROM ubuntu:14.04

LABEL maintainer "Kemal Sokolovic <kemal.sokolovic@gmail.com>"

# Refresh the list of packages available to the image, and install
# build-essential package
RUN apt-get -y update
RUN apt-get install -y build-essential

# Oracle Java 8 installation
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
# Enable silent install (without having to explicitly accept the LA)
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
    debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    debconf-set-selections
# Install Java 8 and make sure environment variables are set
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y oracle-java8-set-default
# Add a symbolic link, just in case some scripts (like gradle) try to export
# their own JAVA_HOME
RUN ln -s /usr/lib/jvm/java-8-oracle /usr/lib/jvm/default-java

# SDKMan installation
RUN apt-get install -y curl zip

RUN curl -s "https://get.sdkman.io" | bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle 2.14.1 && \
    sdk install maven

# MySQL 5.5 installation
# Install MySQL Server in a Non-Interactive mode. Default root password will be 'root'
RUN echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y mysql-server-5.5

CMD ["/bin/bash"]
