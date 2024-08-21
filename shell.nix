{
  pkgs ? import <nixpkgs> { },
}:
with pkgs;
(mkShell.override { stdenv = pkgs.stdenvNoCC; }) {
  name = "AnDS-1";
  packages = [ jdk21_headless ];
}
