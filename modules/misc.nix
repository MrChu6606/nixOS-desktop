{ config, pkgs, lib, ... }:

{
  services.tailscale.enable = true;
  programs.steam.enable = true;

  environment.variables = {
    EDITOR = "nano";
    VISUAL = "nano";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
