{
  config,
  pkgs,
  lib,
  ...
}: {
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "lock";
    HandlePowerKey = "ignore";
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
    START_CHARGE_THRESH_BAT0 = 40;
    STOP_CHARGE_THRESH_BAT0 = 90;
    USB_AUTOSUSPEND = 0;
  };

  services.thermald.enable = true;
}
