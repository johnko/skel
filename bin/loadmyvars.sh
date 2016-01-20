#!/bin/sh

# used like this
# . /usr/local/bin/loadmyvars.sh

DEFAULTDIR=/root/perm
LOCALDIR=/root/local

for i in \
    datamnt.conf \
    fqdn.conf \
    iocnet.conf \
    iocpool.conf \
    iocrelease.conf \
    pkgpath.ampache.conf \
    pkgpath.couchbase.conf \
    pkgpath.ffmpeg.conf \
    pkgpath.gitlab.conf \
    pkgpath.i2p.conf \
    pkgpath.lame.conf \
    pkgpath.libaacplus.conf \
    pkgpath.squid.conf \
    pkgpath.vlc.conf \
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
