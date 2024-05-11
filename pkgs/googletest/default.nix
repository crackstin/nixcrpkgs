{ crossenv }:

crossenv.make_derivation rec {
  name = "googletest-${version}";

  version = "1.14.0";
  src = crossenv.nixpkgs.fetchurl {
    url = "https://github.com/google/googletest/archive/refs/tags/v${version}.tar.gz";
    sha256 = "sha256-itWYxzrXluDYKAsILOvYKmMNc+c808cAV5OKZQG7pdc=";
  };

  builder = ./builder.sh;
}
