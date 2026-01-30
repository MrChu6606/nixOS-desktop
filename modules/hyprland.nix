{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprland.xwayland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = ''
          wlgreet \
            --cmd Hyprland \
            --background $HOME/nixOS-desktop/Wallpapers/orange-mountains.jpg
        '';
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wlgreet
    swaylock-effects
    hyprpaper
    wofi
    waybar
  ];
}
