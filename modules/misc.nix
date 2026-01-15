{ config, pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  services.tailscale.enable = true;
  programs.steam.enable = true;

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  system.stateVersion = "25.05";
}
