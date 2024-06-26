{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kotlin.enable = lib.mkEnableOption "enables kotlin";
  };

  config = lib.mkIf config.kotlin.enable {
    home.packages = with pkgs; [
      kotlin
      gradle
      kotlin-language-server
      ktlint
      jetbrains.idea-ultimate
    ];
  };
}
