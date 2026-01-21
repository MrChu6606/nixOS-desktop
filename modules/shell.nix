{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    source /home/nic/dotfiles/shell/aliases.sh
    source /home/nic/dotfiles/nnn/config.sh
  '';
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "crcandy";
  programs.zsh.ohMyZsh.plugins = ["sudo" "history" "docker" "rsync"];
}
