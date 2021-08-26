#! /bin/bash -eu
# Copyright 2021 Mitsutoshi Nakano <ItSANgo@gmail.com>
# SPDX-License-Identifier: MIT

altdir='/etc/alternatives'
javadir=${1-/usr/lib/jvm/default-java}
bindir="$javadir/bin"
mandir="$javadir/man/man1"

for e in $(cd "$bindir" && ls)
do
	sudo rm -f "$altdir/$e" && sudo ln -s "$bindir/$e" "$altdir/$e"
done

for m in $(cd "$mandir" && ls)
do
	sudo rm -f "$altdir/$m" && sudo ln -s "$mandir/$m" "$altdir/$m"
done
