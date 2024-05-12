{ crossenv }:

crossenv.make_derivation rec {
  name = "libjpeg-${version}";

  version = "2.1.0";
  src = crossenv.nixpkgs.fetchurl {
    url = "https://github.com/winlibs/libjpeg/archive/refs/tags/libjpeg-turbo-${version}.tar.gz";
    sha256 = "sha256-O5xO/VSwY9iRNmSA1HsykG57OhX5EmBFhn382PKmUsA=";
  };

  builder = ./builder.sh;
  toolchain = ./toolchain.cmake;
  gcc = crossenv.gcc;
  binutils = crossenv.binutils;
}
