#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

FREND=${FREND:-$SRCDIR/frend}
FRENCLI=${FRENCLI:-$SRCDIR/fren-cli}
FRENTX=${FRENTX:-$SRCDIR/fren-tx}
FRENQT=${FRENQT:-$SRCDIR/qt/fren-qt}

[ ! -x $FREND ] && echo "$FREND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
FRENSVER=($($FRENCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for frend if --version-string is not set,
# but has different outcomes for fren-qt and fren-cli.
echo "[COPYRIGHT]" > footer.h2m
$FREND --version | sed -n '1!p' >> footer.h2m

for cmd in $FREND $FRENCLI $FRENTX $FRENQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${FRENSVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${FRENSVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
