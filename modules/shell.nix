{ config, pkgs, lib, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    source /home/nic/dotfiles/shell/aliases.sh
  '';
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "crcandy";
  programs.zsh.ohMyZsh.plugins = [ "sudo" "history" "docker" "rsync" ];
}
