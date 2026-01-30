{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    source $HOME/nixOS-desktop/shell/aliases.sh
    source $HOME/nixOS-desktop/nnn/config.sh
  '';
  #programs.zsh.ohMyZsh.enable = true;
  #programs.zsh.ohMyZsh.theme = "crcandy";
  #programs.zsh.ohMyZsh.plugins = ["sudo" "history" "docker" "rsync"];
}
