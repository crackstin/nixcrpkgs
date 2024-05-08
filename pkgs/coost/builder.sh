source $setup

tar -xf $src
mv coost-* coost

cd coost
for patch in $patches; do
  echo applying patch $patch
  patch -p1 -i $patch
done
cd ..

mkdir build
cd build

cmake-cross ../coost -DCMAKE_INSTALL_PREFIX="$out"

make install
