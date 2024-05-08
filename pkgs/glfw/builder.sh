source $setup

tar -xf $src
mv glfw-* glfw

cd glfw

mkdir build
cd build

cmake-cross ../ -DCMAKE_INSTALL_PREFIX="$out"

make
make install
