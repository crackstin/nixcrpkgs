source $stdenv/setup

cp -r $src/samples .
cp -r $src/util .

mkdir include
cp -r $src/samples/sample_util/* include/

mkdir build
cd build
mkdir bin

#ls "$angle_util/lib" "$angle/lib"; exit 3 # tmphax
#grep -r SwapBuffersWithDamage "$angle_util/lib" "$angle/lib"; exit 2 # tmphax

# TODO: add -O2 option here after things are working

exe_suffix=.exe  # TODO: this should come from crossenv

CFLAGS="-I../include -I$angle_util/include -I$angle/include"
CFLAGS="$CFLAGS -DGL_APICALL= -DANGLE_EXPORT= -DGL_GLEXT_PROTOTYPES"
LDFLAGS="-L$angle_util/lib -L$angle/lib"
LIBS="-langle_util -lEGL_static -lGLESv2_static -lANGLE -ltranslator -lpreprocessor -langle_image_util -langle_common -ld3d9 -lgdi32"

echo "compiling texture_wrap"
$host-g++ -g $CFLAGS $LDFLAGS \
  ../samples/texture_wrap/TextureWrap.cpp \
  ../samples/sample_util/texture_utils.cpp \
  ../samples/sample_util/SampleApplication.cpp \
  $LIBS -o bin/texture_wrap${exe_suffix}

echo "compiling simple_texture_2d"
$host-g++ -g $CFLAGS $LDFLAGS \
  ../samples/simple_texture_2d/SimpleTexture2D.cpp \
  ../samples/sample_util/texture_utils.cpp \
  ../samples/sample_util/SampleApplication.cpp \
  $LIBS -o bin/simple_texture_2d${exe_suffix}

echo "compiling particle_system"
$host-g++ -g $CFLAGS $LDFLAGS \
  ../samples/particle_system/ParticleSystem.cpp \
  ../samples/sample_util/tga_utils.cpp \
  ../samples/sample_util/SampleApplication.cpp \
  $LIBS -o bin/particle_system${exe_suffix}
cp ../samples/particle_system/smoke.tga bin/

echo "compiling hello_triangle"
$host-g++ -g $CFLAGS $LDFLAGS \
  ../samples/hello_triangle/HelloTriangle.cpp \
  ../samples/sample_util/SampleApplication.cpp \
  $LIBS -o bin/hello_triangle${exe_suffix}

echo "compiling window_test"
$host-g++ -g $CFLAGS $LDFLAGS \
  ../samples/WindowTest/WindowTest.cpp \
  $LIBS -o bin/window_test${exe_suffix}

mkdir -p $out/license
cp $src/LICENSE $out/license/
cp -r bin $out/