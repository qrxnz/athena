#!/bin/sh

#NEED ONLY TO EDIT  sourcefiles VARIABLE

pkgname=$(grep "^pkgname=" PKGBUILD | awk -F'=' '{print $2}')
pkgver=$(grep "^pkgver=" PKGBUILD | awk -F'=' '{print $2}')
pkgrel=$(grep "^pkgrel=" PKGBUILD | awk -F'=' '{print $2}')
arch=$(grep "^arch=" PKGBUILD | awk -F"'" '{print $2}')

pkgfile=$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.zst

echo $pkgfile

sed -i -e '/^sha256/d' -e '/^sha512/d' PKGBUILD

makepkg -g >> PKGBUILD
makepkg -si

rm -rf src pkg $pkgfile
