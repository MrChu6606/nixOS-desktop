{
  config,
  pkgs,
  lib,
  ...
}: {
  networking.hostName = "lotus";
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}
