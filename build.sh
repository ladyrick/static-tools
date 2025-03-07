#!/bin/bash

# set -e

docker run --privileged --rm tonistiigi/binfmt --install arm64

cd "$(dirname "$0")"

rm -rf dist
mkdir -p dist

archs=(amd64 arm64v8)
platforms=(linux/amd64 linux/arm64/v8)
for i in ${!archs[@]}; do
	arch=${archs[i]}
	platform=${platforms[i]}
	# build base image to save some repeated works
	docker build --platform $platform build-base -t static-tools:build-base-$arch --build-arg arch=$arch --build-arg platform=$platform

	for tool in $(ls tools); do
		docker build --platform $platform tools/$tool -t static-tools:$tool-$arch --build-arg arch=$arch --build-arg proxy=$HTTPS_PROXY
		docker run --platform $platform --rm -v "$(pwd)/dist:/dist" static-tools:$tool-$arch /collect.sh
	done
done

# download
docker build --platform linux/amd64 download -t static-tools:download --build-arg proxy=$HTTPS_PROXY
docker run --platform linux/amd64 --rm -v "$(pwd)/dist:/dist" static-tools:download /collect.sh

cd dist

if [[ $1 != "--release" ]]; then
	ldd */* || true
	sha256sum */* >sha256sum
else
	for dir in *; do
		for file in $(ls $dir); do
			mv $dir/$file $file.$dir
		done
		rmdir $dir
	done
	{
		echo '```'
		sha256sum *
		echo '```'
	} >../release.md
fi
