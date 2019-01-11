with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "yamlpp-0.3";
  src = ./.;
  buildInputs = [ ocaml ];

  buildPhase = ''
    ocamllex yamlpp.mll
    ocamlopt -o yamlpp yamlpp.ml
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv yamlpp $out/bin/
  '';
}
