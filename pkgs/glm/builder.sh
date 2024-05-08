source $setup

tar -xf $src
mv glm-* glm

cd glm

mkdir build
cd build

cmake-cross ../ -DCMAKE_INSTALL_PREFIX="$out" \
	-DGLM_BUILD_TESTS=OFF \
    -DBUILD_SHARED_LIBS=OFF 

make
make install
