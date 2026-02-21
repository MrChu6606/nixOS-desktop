{ pkgs, silentSDDM, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    # Theme name
    theme = silentSDDM.pname;

    # Inject the theme + Qt multimedia for SDDM
    extraPackages = [
      silentSDDM
      pkgs.qt6.qtbase
      pkgs.qt6.qtmultimedia
      pkgs.qt6.qtwayland
    ];
  };

  environment.systemPackages = with pkgs; [
    silentSDDM
    silentSDDM.test
  ];
}
