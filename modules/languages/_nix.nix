{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    _nix.enable = lib.mkEnableOption "enables nix tooling";
  };

  config = lib.mkIf config._nix.enable {
    home.packages = with pkgs; [
      alejandra
      deadnix
      nil
    ];
  };
}
