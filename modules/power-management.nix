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
  services.thermald.enable = true;
}
