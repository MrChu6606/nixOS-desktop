{ config, pkgs, lib, ... }:

{
  services.logind.extraConfig = ''
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
    HandlePowerKey = ignore
  '';

  powerManagement.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 40;
    STOP_CHARGE_THRESH_BAT0  = 90;
  };

  services.thermald.enable = true;
}
