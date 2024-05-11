source $setup

tar -xf $src
cd zlib-$version
make PREFIX=i686-w64-mingw32- -fwin32/Makefile.gcc
make INCLUDE_PATH=$out/include LIBRARY_PATH=$out/lib BINARY_PATH=$out/bin install -fwin32/Makefile.gcc
