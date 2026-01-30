{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.nic = {
    isNormalUser = true;
    description = "nic";
    extraGroups = ["networkmanager" "wheel" "libvirtd" "kvm"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };
}
