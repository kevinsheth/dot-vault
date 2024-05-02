{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./languages/nix.nix
    ./languages/kotlin.nix
    ./languages/ocaml.nix
  ];
}
