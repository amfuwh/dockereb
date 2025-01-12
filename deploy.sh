#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�1�^bdeploy.sh }R�j1��WƄ�E;B>�]H�MLmC�L���F+m%m�	����!	ِ�j�ͼ�73���ZQ₺_R
�p^H��A�����U�.V��p�s*��5�zָ����'S�N��SĽI��+���f�s�}��1�e��f�����p V4.Kq�+��[�v�"T �������'=���^�+@Ԁ�$��!`FM��c�''�R{�M� h�.Mar�&���0��{&�S,S�<��|�Xl/��vى��8&gK�*�/>6.��O��3�z����[.`�j��xg,�?����O%L�����QF��6��>�W��6#�b������4E-j���C~[�%���<z��,p�f/^m����wol}�cI�*NV�W��r�@��/��D�m4  