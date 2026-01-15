{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprland.xwayland.enable = true;

  services.displayManager.cosmic-greeter.enable = true;
}
