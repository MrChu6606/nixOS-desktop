{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ollama
  ];

  services.ollama.enable = true;
}
