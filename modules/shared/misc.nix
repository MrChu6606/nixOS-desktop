{
  ...
}: {
    # Enables flakes and nix shell
    nix.settings.experimental-features = ["nix-command" "flakes"];

    time.timeZone = "America/New_York";

    services.tailscale.enable = true;

    # Sets default editor
    environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
    };

    system.stateVersion = "25.05";
}
