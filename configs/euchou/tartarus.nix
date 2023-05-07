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
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      autocd = false;
      plugins = [ ];
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
        # -- key bindings -----------------------------------------------------
        bindkey '^F' autosuggest-accept
        bindkey ' ' magic-space

        # -- prompt -----------------------------------------------------------
        NEWLINE=$'\n'
        PROMPT='%{$fg_bold[red]%}%n%{$reset_color%}%B %b%{$fg_bold[yellow]%}%~%{$reset_color%}$(git_prompt_info)%B''${NEWLINE}$ %b'
        ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

        # -- styling -----------------------------------------------------------
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold

        # -- sources -----------------------------------------------------------
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









