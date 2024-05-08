{ crossenv }:

crossenv.make_derivation rec {
  version = "3.4";
  name = "glfw-${version}";
  src = crossenv.nixpkgs.fetchurl { url = "https://github.com/glfw/glfw/archive/refs/tags/3.4.tar.gz"; hash = "sha256-wDjTQgAjTQcfrpNFvEVeSo8vVEq2AVB2XXcE4I89rAE=";  };
  patches = [];
  builder = ./builder.sh;
}
