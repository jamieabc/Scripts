#!/usr/bin/env bash

configure_opts=(
	CFLAGS="-Ofast -march=native -pipe -falign-functions=64 -fomit-frame-pointer -funit-at-a-time -fforce-addr -mfpmath=sse -ffast-math -fno-finite-math-only -fstack-check -I/usr/local/opt/libxml2/include/libxml2"
	LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib -L/usr/local/opt/libffi/lib"
	CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/libffi/include"
	PKG_CONFIG_PATH="PKG_CONFIG_PATH:/usr/local/opt/gnutls/lib/pkgconfig:/usr/local/opt/nettle/lib/pkgconfig:/usr/local/opt/libtasn1/lib/pkgconfig:/usr/local/opt/p11-kit/lib/pkgconfig:/usr/local/opt/imagemagick/lib/pkgconfig"
)

emacs_configure_opts=(
	--config-cache
	--without-pop
	--with-ns
	--disable-ns-self-contained
	--with-cairo
	--with-imagemagick
	--with-modules
	# --program-transform-name='s/^ctags$/ctags.emacs/'
	"${configure_opts[@]}"
)

make distclean
./autogen.sh
./configure "${emacs_configure_opts[@]}"
make -j4
