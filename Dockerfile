FROM ubuntu:14.04

# Refresh the list of packages available to the image, and install 
# build-essential package
RUN apt-get -y update
RUN apt-get install -y build-essential

# Oracle Java 8 installation
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
# Enable silent install (without having to explicitly accept the LA)
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
# Install Java 8 and make sure environment variables are set
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y oracle-java8-set-default

# Gradle installation
RUN apt-get install -y gradle

# MySQL 5.5 installation
# Install MySQL Server in a Non-Interactive mode. Default root password will be 'root'
RUN echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y mysql-server-5.5

CMD ["/bin/bash"]
