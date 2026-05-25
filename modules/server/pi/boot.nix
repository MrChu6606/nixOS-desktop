{ lib, pkgs, ... }: {
    boot.loader.generic-extlinux-compatible.enable = true;

    # Raspi boot support
    boot.kernelPackages = pkgs.linuxPackages_rpi4;

    # Force grub off please
    boot.loader.grub.enable = lib.mkForce false;
}
