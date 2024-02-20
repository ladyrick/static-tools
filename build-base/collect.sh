#!/bin/sh
set -e

log() { echo "[run] $@" && "$@"; }

if [ -n "$1" ]; then
	for target in "$@"; do
		target_name="$(basename "$target")"
		mkdir -p /target/$ARCH
		log cp "$target" "/target/$ARCH/$target_name"
		log chmod +x "/target/$ARCH/$target_name"
		log strip "/target/$ARCH/$target_name" || true
	done
elif [ -n "$(ls /target/)" ]; then
	ownership=$(ls -ld /dist | awk '{print $3":"$4}')
	log ldd /target/*/* || true
	log cp -rf /target/* /dist
	files=$(for f in /target/*/*; do echo -n "/dist/${f#"/target/"} "; done)
	chown -R $ownership /dist/*
	log ls -lh $files
else
	echo 'target not found'
	exit 1
fi
