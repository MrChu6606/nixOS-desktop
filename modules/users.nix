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
    packages = with pkgs; [];
  };
}
