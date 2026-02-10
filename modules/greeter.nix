{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    displayManager.autoLogin = {
      enable = true;
      user = "nic";
    };
  };

  # set wallpaper
  environment.etc."gdm-wallpaper.jpg".source = ../Wallpapers/red-forest.jpg;

  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-theme = "Numix-Cursor";
          icon-theme = "Papirus-Dark";
          font-name = "Cantarell 11";
        };

        "org/gnome/desktop/background" = {
          picture-uri = "files://etc/gdm-wallpaper.jpg";
          picture-uri-dark = "files://etc/gdm-wallpaper.jpg";
        };

        "org/gnome/login-screen" = {
          disable-user-list = true;
        };
      };
    }
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    gnome.adwaita-icon-theme
    gnome-themes-extra
  ];
}
