{
  pkgs,
  lib,
  ...
}: {
  # Switch to Zen kernel for better desktop performance
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Enable virt-manager and virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable UEFI for modern OSes like Windows 11
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  # Enable nested VMs
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  programs.virt-manager.enable = true;
  users.users.nix.extraGroups = ["libvirtd" "kvm"];
}
