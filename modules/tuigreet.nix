{
  config,
  pkgs,
  lib,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in {
  # System wide theme for tuigreet
  environment.etc."tuigreet/themes/tuigreet.theme".source = ../greetd/themes/tuigreet.theme;

  # Configure tuigreet
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${tuigreet} --theme-path /etc/tuigreet/themes --theme tuigreet --sessions ${hyprland-session}";
        user = "greeter";
      };
    };
  };

  # prevents error and bootlog spam on screen
  # credit sjcobb2022 on github
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journa";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
