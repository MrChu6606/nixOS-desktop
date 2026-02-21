{
  pkgs,
  silentSDDM,
  ...
}: let
  SilentTheme = silentSDDM;

in {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
      
    theme = SilentTheme.pname;
    extraPackages = [SilentTheme] ++ SilentTheme.propagatedBuildInputs ++ [ pkgs.qt6.qtmultimedia ];
  };

    environment.systemPackages = with pkgs; [
    silentSDDM
    silentSDDM.test
  ];
}
