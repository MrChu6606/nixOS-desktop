{
  config,
  pkgs,
  lib,
  ...
}: {
  networking.hostName = "lotus";
  networking.networkmanager.enable = true;
  programs.wireshark.enable = true;
}
