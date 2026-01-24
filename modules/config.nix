{
  pkgs,
  lib,
  ...
}: {
  # Set system kernel
  boot.kernelPackages = pkgs.linuxPackages;

  # Configure system to not turn off touchpad
  boot.kernelParams = [
    "i915.enable_psr=0"
    "acpi_osi="
    "pcie_aspm=off"
    "intel_idle.max_cstate=2"
  ];

  boot.kernelModules = [
    "i2c_hid"
    "i2c_hid_acpi"
    "hid_multitouch"
  ]

  services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="on"
      ACTION=="add", SUBSYSTEM=="i2c", TEST=="power/contol", ATTR{power/control}="on"
    '';

  # Enable virt-manager and virtualisation
  #virtualisation.libvirtd.enable = true;
  #virtualisation.spiceUSBRedirection.enable = true;

  # Enable UEFI for modern OSes like Windows 11
  #virtualisation.libvirtd.qemu.ovmf.enable = true;

  # Enable nested VMs
  #boot.extraModprobeConfig = "options kvm_intel nested=1";

  #programs.virt-manager.enable = true;
}
