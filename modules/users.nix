{config, pkgs, lib, ... }:

{
  users.users.nix = {
    isNormalUser = true;
    description = "nic";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
