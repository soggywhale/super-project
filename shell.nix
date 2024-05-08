{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.curl
    pkgs.gcc
    pkgs.jansson
  ];
}