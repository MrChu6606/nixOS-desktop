{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprland.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    swaylock-effects
    hyprpaper
    wofi
    waybar
  ];
}
