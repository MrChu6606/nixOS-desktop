{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  programs.withUWSM = true;
  programs.hyprland.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock-effects
    hyprpaper
    wofi
    waybar
  ];
}
