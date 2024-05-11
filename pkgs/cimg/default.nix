{ crossenv }:

crossenv.make_derivation rec {
  name = "cimg-${version}";

  version = "v.3.3.5";

  src = crossenv.nixpkgs.fetchurl {
    url = "https://github.com/GreycLab/CImg/archive/refs/tags/${version}.tar.gz";
    sha256 = "sha256-Z0KIRHUAOUqjwNO7uGaKqy0yEn33IQTaXnGWjY95v+Y=";
  };

  builder = ./builder.sh;
}
