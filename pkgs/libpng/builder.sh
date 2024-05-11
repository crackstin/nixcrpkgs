source $setup

tar -xf $src
cd libpng-$version 

mkdir build
cd build

cmake-cross .. -DCMAKE_INSTALL_PREFIX=$out
make
make install
