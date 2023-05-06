{ inputs, outputs, lib, config, pkgs, ... }:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      # outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  # Home setup.
  home.username = "euchou";
  home.homeDirectory = "/home/euchou";
  home.stateVersion = "22.11";

  # Neovim
  programs.neovim.enable = true;
  xdg.configFile.nvim.source = inputs.nvim;

  # Tmux (not sure why this can't be linked with `xdg`)
  programs.tmux.enable = true;
  home.file."${config.home.homeDirectory}/.tmux.conf" = {
    source = "${inputs.tmux}/.tmux.conf";
  };
  home.file."${config.home.homeDirectory}/.tmux.conf.local" = {
    source = "${inputs.tmux}/.tmux.conf.local";
  };

  # Exa
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  # Zsh
  programs.zsh =
    {
      enable = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
      };
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "a411ef3";
            sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "932e29a";
            sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
        }
        {
          name = "zsh-history-substring-search";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-history-substring-search";
            rev = "0f80b8e";
            sha256 = "sha256-Ptxik1r6anlP7QTqsN1S2Tli5lyRibkgGlVlwWZRG3k=";
          };
        }
      ];
      localVariables = {
        EDITOR = "nvim";
      };
      shellAliases = {
        back = "cd $OLDPWD";
        c = "clear";
        vi = "nvim";
        vim = "nvim";
      };
      initExtra = ''
        bindkey '^F' autosuggest-accept
        bindkey ' ' magic-space

        NEWLINE=$'\n'
        PROMPT='%{$fg_bold[red]%}%n%{$reset_color%}%B %b%{$fg_bold[yellow]%}%~%{$reset_color%}$(git_prompt_info)%B$NEWLINE$ %b'
        ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold

        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
      '';
    };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
