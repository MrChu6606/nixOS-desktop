{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  time.timeZone = "America/New_York";
  time.enableNTP = true;

  services.tailscale.enable = true;
  programs.steam.enable = true;

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

  system.stateVersion = "25.05";
}
