{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    js.enable = lib.mkEnableOption "enables js stuff";
  };

  config = lib.mkIf config.js.enable {
    home.packages = with pkgs; [
      nodePackages.pnpm
    ];
  };
}
