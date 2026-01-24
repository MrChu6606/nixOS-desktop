{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ollama
  ];

  services.ollam.enable = true;
}
