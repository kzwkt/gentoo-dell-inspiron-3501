GDK=$(ldconfig -p | awk '/libgdk-3.so.0/{print $NF; exit}')
comm -23 \
  <(nm -D --undefined-only /home/k/opt/firefox/libxul.so | awk '{print $2}' | grep -E '^(gdk|gtk)_x11' | sort -u) \
  <(nm -D --defined-only "$GDK" | awk '{print $3}' | sort -u) \
  | tee missing.txt
{
  echo 'typedef unsigned long GType;'
  while read -r s; do
    echo "void *$s() { return 0; }"
  done < missing.txt
} > shim-x11.c

gcc -shared -fPIC -O1 -o shim-x11.so shim-x11.c
