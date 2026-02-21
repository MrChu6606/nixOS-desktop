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
    extraPackages = SilentTheme.propagatedBuildInputs;
  };

    environment.systemPackages = with pkgs; [
    silentSDDM
    silentSDDM.test
  ];
}
