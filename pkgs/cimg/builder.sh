source $setup

tar -xf $src

cd CImg-$version
mkdir -p $out/include
cp CImg.h $out/include
