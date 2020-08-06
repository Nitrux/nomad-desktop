#! /bin/sh

apt -qq update
apt -qq -yy install equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nx-desktop" \
	"Version: 1.4.9.47-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Architecture: amd64" \
	"Description: NX Desktop metapackage for Nitrux."

equivs-build configuration
