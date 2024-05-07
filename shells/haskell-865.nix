# Shell env for working with 865 compiler - assumes you have nvim stuff ready to go in global/user
{pkgs ? import <nixpkgs> {}}: let
  all-hls = pkgs.fetchFromGitHub {
    owner = "masaeedu";
    repo = "all-hls";
    rev = "155e57d7ca9f79ce293360f98895e9bd68d12355";
    sha256 = "04s3mrxjdr7gmd901l1z23qglqmn8i39v7sdf2fv4zbv6hz24ydb";
  };
  hls = import all-hls {ghc = "8.6.5";};
in
  pkgs.mkShell {
    buildInputs = [
      pkgs.haskell.compiler.ghc865Binary
      pkgs.vimPlugins.haskell-tools-nvim
      pkgs.haskellPackages.fourmolu
      hls
      pkgs.cabal-install
      pkgs.zlib
    ];
  }
