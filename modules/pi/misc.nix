{
  ...
}: {
    # Enables flakes and nix shell
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Configure boot menu
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "America/New_York";

    services.tailscale.enable = true;
    programs.steam.enable = true;

    # Sets default editor
    environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
    };

    # configure swap
    swapDevices = [
    {
        device = "/swapfile";
        size = 8 * 1024;
    }
    ];

    system.stateVersion = "25.05";
}
