{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    librepods.url = "path:./librepods";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    librepods,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    unstablePkgs = import nixpkgs-unstable {inherit system;};
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    #Setup nvf and point it to config module
    packages.x86_64-linux.nvf =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.x86_64-linux;
        modules = [./modules/nvf-configuration.nix];
      }).neovim;

    nixosConfigurations.lotus = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        ./modules/config.nix
        ./modules/hardware.nix
        ./modules/misc.nix
        ./modules/users.nix
        ./modules/packages.nix
        ./modules/power-management.nix
        ./modules/networking.nix
        ./modules/bluetooth.nix
        ./modules/hyprland.nix
        ./modules/fonts.nix
        ./modules/shell.nix
        ({unstablePkgs, ...}: {
          environment.systemPackages = [
            self.packages.${pkgs.stdenv.system}.nvf
          ];
        })
      ];
    };
  };
}
