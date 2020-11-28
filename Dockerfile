FROM centos:8

RUN yum install -y tar wget git
RUN yum install -y epel-release

RUN yum groupinstall -y "Development Tools"
RUN yum install -y maven ruby ruby-devel python2 python2-devel python2-virtualenv java-1.8.0-openjdk-devel zlib-devel libcurl-devel openssl-devel cyrus-sasl-devel cyrus-sasl-md5 apr-devel subversion-devel apr-util-devel
RUN gem install fpm

WORKDIR /mesos-deb-packaging
CMD ["make"]
