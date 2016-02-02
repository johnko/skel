#!/bin/sh

# used like this
# . /usr/local/bin/loadmyvars.sh

DEFAULTDIR=/root/perm
LOCALDIR=/root/local

PKGPATHFILES=$( ls -1 ${DEFAULTDIR}/pkgpath.*.conf ${LOCALDIR}/pkgpath.*.conf | sed "s;${DEFAULTDIR}/;;" | sed "s;${LOCALDIR}/;;" | sort -u )

for i in \
    datamnt.conf \
    fqdn.conf \
    email.conf \
    iocnet.conf \
    iocpool.conf \
    iocrelease.conf \
    ${PKGPATHFILES} \
    reposrc.conf \
    squid.conf \
    ; do
    if [ -e ${DEFAULTDIR}/$i ]; then
        . ${DEFAULTDIR}/$i
    fi
    if [ -e ${LOCALDIR}/$i ]; then
        . ${LOCALDIR}/$i
    fi
done

HTTP_PROXY=http://${SQUID}
