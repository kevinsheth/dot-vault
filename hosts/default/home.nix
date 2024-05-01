
{ secrets, config, pkgs, ... }:
{
  nixpkgs = { config = { allowUnfree = true; allowUnfreePredicate = (_: true); };};
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
    jq
    eza
    git
    coreutils
    unzip
    zoxide
    gcc
    ripgrep
    gcc
    curl
    jq
    tmux
    tree-sitter
    fd
    gnumake
    codeium
    _1password
    _1password-gui    
    git-crypt
    lf
    # langs

    python3
    nodejs
    lua
    go
    rustup
    typescript
    kotlin

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/lvim/config.lua".source = ../../dotfiles/.config/lvim/config.lua;
    ".codeium/config.json".text = "{\"apiKey\":\"${secrets.codeium.api_key}\"}";
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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
    EDITOR = "nvim";
    SHELL = "/etc/profiles/per-user/kevins/bin/zsh";
  };

  
  programs = {
    home-manager.enable = true;

    zoxide.enable = true;
    zoxide.enableZshIntegration = true;

		
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
		  #   "https://oauth2:${secrets.gitlab_token}@gitlab.com" = {
		  #     insteadOf = "https://gitlab.com";
		  #   };
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
