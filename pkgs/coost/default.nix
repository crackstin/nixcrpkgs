{ crossenv }:

crossenv.make_derivation rec {
  version = "v3.0.2";
  name = "coost-${version}";
  src = crossenv.nixpkgs.fetchurl { url = "https://github.com/idealvin/coost/archive/refs/tags/${version}.tar.gz"; hash = "sha256-kiuiH7mpIshPaks71WjtOzRjzLGukGzXxJ2Qx/A1myQ=";  };
  patches = [ ./cross-compiling-fixed.patch ];
  builder = ./builder.sh;
}
