{ pkgs, nvfFN, ... }: let
  stable = with pkgs; [
    wget
    git
    fastfetch
    curl
    neovim
    yazi
    wl-clipboard
    sops
    age
  ];
  nvf = nvfFN pkgs.unstable;
in {
  environment.systemPackages = stable ++ [ nvf ];
}
