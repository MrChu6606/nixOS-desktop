{
  config,
  pkgs,
  lib,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in {
  services.greetd = {
    enable = true;
    greeter = pkgs.tuigreet;

    settings = {
      default_session = {
        command = ''
          ${tuigreet} \
          --theme tuigreet
          --time \
          --asterisks \
          --remember \
          --remember-session \
          --greet-align center \
          --window-padding 0 \
          --container-padding 1 \
          --prompt-padding 1 \
          --kb-command 1 \
          --kb-power 2 \
          --power-shutdown "systemctl poweroff" \
          --power-reboot "systemctl reboot" \
          --sessions ${hyprland-session}
        '';
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
