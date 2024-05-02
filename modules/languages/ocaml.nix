{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    ocaml.enable = lib.mkEnableOption "enables ocaml";
  };

  config = lib.mkIf config.ocaml.enable {
    home.packages = with pkgs; [
      ocaml
    ];
  };
}
