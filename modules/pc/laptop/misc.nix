{
  pkgs,
  ...
}: {
    # Enables direnv
    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    # Sets kernel to zen kernel
    boot.kernelPackages = pkgs.linuxPackages_zen;

    # Configure boot menu
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    programs.steam.enable = true;

    xdg.portal.enable = true;

    swapDevices = [
    {
        device = "/swapfile";
        size = 8 * 1024;
    }
    ];

}
