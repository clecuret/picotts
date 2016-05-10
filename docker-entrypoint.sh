#!/bin/bash
set -e

if [ "$1" = 'picotts' ]; then
	uid=${UID:-1000}
	gid=${GID:-1000}
  lang=${LANG:-fr-FR}
	# create user group
	if ! getent group developer >/dev/null; then
		groupadd -f -g ${gid} developer
	fi

	# create user with uid and gid matching that of the host user
	if ! getent passwd developer >/dev/null; then
		adduser --uid ${uid} --gid ${gid} --disabled-login --gecos 'Developer' developer
	fi

	exec su developer -c "pico2wave -l ${lang} -w /tmp/test.wav $2 ; aplay -q /tmp/test.wav" 
fi

exec "$@"
