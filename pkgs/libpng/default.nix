{ crossenv, zlib }:

crossenv.make_derivation rec {
  name = "libpng-${version}";

  version = "1.6.43";
  src = crossenv.nixpkgs.fetchurl {
    url = "https://github.com/pnggroup/libpng/archive/refs/tags/v${version}.tar.gz";
    sha256 = "sha256-/syVtGzwXo4/yKQUdQ4LparQDYnp/fF16U/wQcrxoDo=";
  };

  builder = ./builder.sh;
  cross_inputs = [ zlib ];
}
