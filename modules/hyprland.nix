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
          gtkgreet \
            --background $HOME/nixOS-desktop/Wallpapers/orange-mountains.jpg
            --cmd Hyprland \
        '';
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.gtkgreet
    swaylock-effects
    hyprpaper
    wofi
    waybar
    grim
  ];
}
