{
  pkgs,
  lib,
  ...
}: {
  # Set system kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # Enable virt-manager and virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable UEFI for modern OSes like Windows 11
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  # Enable nested VMs
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  programs.virt-manager.enable = true;
}
