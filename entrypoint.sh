#!/bin/bash
set -x
if [[ -d /docker-entrypoint-reinit.d && ! -e /var/run/docker-container-creating ]] ; then
	for SCRIPT in /docker-entrypoint-reinit.d/* ; do
		if [[ -f $SCRIPT && -x $SCRIPT ]] ; then
			$SCRIPT 2>&1
		fi
	done
elif [[ -d /docker-entrypoint-init.d && -e /var/run/docker-container-creating ]] ; then
	for SCRIPT in /docker-entrypoint-init.d/* ; do
		if [[ -f $SCRIPT && -x $SCRIPT ]] ; then
			$SCRIPT 2>&1
			rm /var/run/docker-container-creating
		fi
	done
fi
set +x

exec /usr/sbin/httpd -DFOREGROUND
