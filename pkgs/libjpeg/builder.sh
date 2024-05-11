source $setup

tar -xf $src
cd libjpeg-libjpeg-turbo-$version 

mkdir build
cd build

cmake -G"Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=$toolchain -DCMAKE_INSTALL_PREFIX=$out ..
make
make install
