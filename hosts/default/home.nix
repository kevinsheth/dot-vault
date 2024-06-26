{
  secrets,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/languages.nix
    ../../modules/apps/firefox.nix
  ];

  # language modules

  _nix.enable = true;
  js.enable = true;
  kotlin.enable = true;

  nixpkgs = {
    overlays = [inputs.nur.overlay];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kevins";
  home.homeDirectory = "/home/kevins";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # utils
    bat
    git
    coreutils
    unzip
    zoxide
    gcc
    ripgrep
    gcc
    curl
    tree-sitter
    fd
    gnumake
    _1password-gui
    git-crypt
    warp-terminal
    bottom
    gh

    # langs

    python3
    nodejs
    lua
    go
    rustup
    typescript

    # formatters and linters
    stylua
    lua52Packages.luacheck

    # fun
    discord
    obsidian
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".ideavimrc".source = ../../dotfiles/.ideavimrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kevins/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    SHELL = "/etc/profiles/per-user/kevins/bin/zsh";
  };

  programs = {
    home-manager.enable = true;

    zoxide.enable = true;
    zoxide.enableZshIntegration = true;

    zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      defaultKeymap = "emacs";
      history.size = 10000;
      history.save = 10000;
      history.expireDuplicatesFirst = true;
      history.ignoreDups = true;
      history.ignoreSpace = true;
      historySubstringSearch.enable = true;

      plugins = [
        {
          name = "fast-syntax-highlighting";
          src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.5.0";
            sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
          };
        }
      ];

      shellAliases = {
        nixvim = "${config.home.homeDirectory}/nixvim/result/bin/nvim";
        cd = "z";
        bat = "cat";
        refresh = "source ${config.home.homeDirectory}/.zshrc";
        rbd = "sudo nixos-rebuild switch --flake ~/configuration#default";
      };
      envExtra = ''
        export PATH=$PATH:$HOME/.local/bin
      '';
    };

    starship.enable = true;
    starship.settings = {
      aws.disabled = true;
      gcloud.disabled = true;
      kubernetes.disabled = false;
      git_branch.style = "242";
      directory.style = "blue";
      directory.truncate_to_repo = false;
      directory.truncation_length = 8;
      python.disabled = true;
      ruby.disabled = true;
      hostname.ssh_only = false;
      hostname.style = "bold green";
    };

    git = {
      enable = true;
      delta.enable = true;
      delta.options = {
        line-numbers = true;
        side-by-side = true;
        navigate = true;
      };
      userEmail = "kevinsheth25@gmail.com";
      userName = "Kevin Sheth";
      extraConfig = {
        url = {
          "https://oauth2:${secrets.github.oauth_token}@github.com" = {
            insteadOf = "https://github.com";
          };
        };
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        merge = {
          conflictstyle = "diff3";
        };
        diff = {
          colorMoved = "default";
        };
      };
    };
  };
}
