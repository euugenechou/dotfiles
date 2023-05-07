{ inputs, outputs, lib, config, pkgs, ... }:
let
  nvim = pkgs.fetchFromGitHub {
    owner = "euugenechou";
    repo = "nvim";
    rev = "98c230e";
    sha256 = "sha256-g6t78+mity/mog3OM0632tZx5VXyvFfvA7oyUu2Roms=";
  };
  tmux = pkgs.fetchFromGitHub {
    owner = "euugenechou";
    repo = "tmux";
    rev = "10ef7f9";
    sha256 = "sha256-ze9vT7+7sLl4WJefHldP++ZVMciYhk+GkjtSQEmtmJo=";
  };
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Home setup.
  home.username = "euchou";
  home.homeDirectory = "/home/euchou";
  home.stateVersion = "22.11";

  # Neovim
  programs.neovim.enable = true;
  xdg.configFile.nvim = {
    source = nvim;
    recursive = true;
  };

  # Tmux
  programs.tmux.enable = true;
  xdg.configFile.tmux = {
    source = tmux;
    recursive = true;
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
      sessionVariables = {
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
        PROMPT='%{$fg_bold[red]%}%n%{$reset_color%}%B %b%{$fg_bold[yellow]%}%~%{$reset_color%}$(git_prompt_info)%B''${NEWLINE}$ %b'
        ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold

        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ];
        then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
      '';
    };

  # Git
  programs.git = {
    enable = true;
    userName = "Eugene Chou";
    userEmail = "euchou@ucsc.edu";
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };

  # Bootstrap home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}









