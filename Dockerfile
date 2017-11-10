FROM centos:7

RUN yum install -y yum-utils epel-release

RUN mkdir /rpms

ENTRYPOINT ["yumdownloader", "--destdir=/rpms/", "--resolve"]
