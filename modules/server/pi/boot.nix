{ pkgs, ... }: {
    boot.loader.generic-extlinux-compatible.enable = true;

    # Raspi boot support
    boot.kernelPackages = pkgs.linuxPackages_rpi4;
}
