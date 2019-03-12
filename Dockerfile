FROM centos:6

RUN yum install -y bacula-storage bacula-client bacula-console bacula-director \
    perl-JSON perl-YAML-Tiny make \
	&& yum clean all
RUN yum localinstall -y https://centos6.iuscommunity.org/ius-release.rpm \
	&& yum install -y --enablerepo=ius git2u \
	&& yum clean all
RUN /usr/libexec/bacula/create_bacula_database
RUN /usr/libexec/bacula/make_bacula_tables

CMD ["/bin/sh"]
