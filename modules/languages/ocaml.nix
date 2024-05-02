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
      opam
      ocamlPackages.ocaml-lsp
    ];

    programs.opam.enable = true;
  };
}
