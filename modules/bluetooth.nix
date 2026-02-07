{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General.Experimental = true;
    Policy.AutoEnable = true;
  };
  # Enable support for xbox controllers
  #hardware.xpadneo.enable = true;

  services.blueman.enable = true;
}
