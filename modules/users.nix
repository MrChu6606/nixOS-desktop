{config, pkgs, lib, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    description = "nic";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
