{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nix.enable = lib.mkEnableOption "enables nix";
  };

  config = lib.mkIf config.ocaml.enable {
    home.packages = with pkgs; [
      alejandra
      deadnix
      nil
    ];
  };
}
