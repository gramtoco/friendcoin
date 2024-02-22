#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PEJECOIND=${PEJECOIND:-$SRCDIR/pejecoind}
PEJECOINCLI=${PEJECOINCLI:-$SRCDIR/pejecoin-cli}
PEJECOINTX=${PEJECOINTX:-$SRCDIR/pejecoin-tx}
PEJECOINQT=${PEJECOINQT:-$SRCDIR/qt/pejecoin-qt}

[ ! -x $PEJECOIND ] && echo "$PEJECOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
PEJEVER=($($PEJECOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for pejecoind if --version-string is not set,
# but has different outcomes for pejecoin-qt and pejecoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$PEJECOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $PEJECOIND $PEJECOINCLI $PEJECOINTX $PEJECOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PEJEVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PEJEVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
