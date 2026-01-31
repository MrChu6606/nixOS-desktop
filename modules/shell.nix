{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      source $HOME/nixOS-desktop/shell/aliases.sh
      source $HOME/nixOS-desktop/nnn/config.sh
    '';

    promptInit = ''
      autoload -U promptinit; promptinit
      prompt pure
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "extract"
        "autoenv"
        "git"
        "history-substring-search"
      ];
      customPlugins = [
        {
          name = "zsh-nix-shell";
          src = pkgs.zsh-nix-shell;
        }
        {
          name = "zsh-you-should-use";
          src = pkgs.zsh-you-should-use;
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.zsh-syntax-highlighting;
        }
        {
          name = "zsh-completions";
          src = pkgs.zsh-completions;
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    pure-prompt
  ];
}
