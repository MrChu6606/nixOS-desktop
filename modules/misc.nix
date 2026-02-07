{
  config,
  pkgs,
  lib,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  # enables fwupd to flash update bios
  services.fwupd.enable = true;

  # Configure boot menue
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/New_York";

  services.tailscale.enable = true;
  programs.steam.enable = true;

  # Sets default editor
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Sets default browser
  #  environment.sessionVariables = {
  #    BROWSER = "librewolf";
  #  };
  #  xdg.mime.defaultApplications = {
  #    "text/html" = ["librewolf.desktop"];
  #    "x-scheme-handler/http" = ["librewolf.desktop"];
  #    "x-scheme-handler/https" = ["librewolf.desktop"];
  #    "x-scheme-handler/about" = ["librewolf.desktop"];
  #    "x-scheme-handler/unknown" = ["librewolf.desktop"];
  #  };

  xdg.portal.enable = true;

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024;
    }
  ];

  system.stateVersion = "25.05";
}
