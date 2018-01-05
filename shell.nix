{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.stdenv.mkDerivation {
  name = "recycled-scrap";
  buildInputs = [
    nixpkgs.mlton
  ];
}
