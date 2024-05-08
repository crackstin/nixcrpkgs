{ crossenv }:

crossenv.make_derivation rec {
  version = "1.0.1";
  name = "glm-${version}";
  src = crossenv.nixpkgs.fetchurl { url = "https://github.com/g-truc/glm/archive/refs/tags/${version}.tar.gz"; hash = "sha256-nzF0Vh/SaQSyPw215WCXHL+bPL2gsoDwTVw3nQO/I0w=";  };
  patches = [];
  builder = ./builder.sh;
}
