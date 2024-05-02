{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kotlin.enable = lib.mkEnableOption "enables kotlin";
  };

  config = lib.mkIf config.ocaml.enable {
    home.packages = with pkgs; [
      kotlin
      gradle
      kotlin-language-server
      ktlint
      jetbrains.idea-community
    ];
  };
}
