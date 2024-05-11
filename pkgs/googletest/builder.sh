source $setup

tar -xf $src
ls
cd googletest-$version

mkdir build
cd build

cmake-cross .. -DCMAKE_INSTALL_PREFIX=$out
make
make install
