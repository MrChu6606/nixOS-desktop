{
  pkgs,
  lib,
  ...
}: {
  # Set system kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # Makes shutdown and boot visible for debugging
  boot.kernelParams = ["systemd.show_status=1"];

  # Enable virt-manager and virtualisation
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable UEFI for modern OSes like Windows 11
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  # Enable nested VMs
  boot.extraModprobeConfig = "options kvm_intel nested=1";

  programs.virt-manager.enable = true;
}
