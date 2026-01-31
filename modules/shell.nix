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
    };
  };

  environment.systemPackages = with pkgs; [
    pure-prompt
  ];
}
