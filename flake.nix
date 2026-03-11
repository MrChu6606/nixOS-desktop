{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    silentSDDM = {
            url="github:uiriansan/SilentSDDM";
            inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nvf,
    silentSDDM,
    nix-flatpak,
    ...
  }: let
    system = "x86_64-linux";

    # pkgs nixosSystem uses
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };

      overlays = [
        (import ./overlays/flameshot.nix)
        (import ./overlays/qutebrowser.nix)
        (import ./overlays/steam.nix)
      ];
    };

    # unstable nixpkgs
    unstablePkgs = import nixpkgs-unstable {
      inherit system;
    };

    # pass nvf as part of the system packages
    nvfPkg =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.x86_64-linux;
        modules = [./modules/nvf-configuration.nix];
      }).neovim;

    #silentSDDM = silentSDDMFlake.packages.${system}.default;
  in {
    # setup nvf and point it to config module
    packages.x86_64-linux.nvf = nvfPkg;

    nixosConfigurations.lotus = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = { inherit inputs; };

      modules = [
        ./modules/hardware.nix
        ./modules/misc.nix
        ./modules/users.nix
        ./modules/packages.nix
        ./modules/power-management.nix
        ./modules/networking.nix
        ./modules/bluetooth.nix
        ./modules/hypr.nix
        ./modules/greeter.nix
        ./modules/fonts.nix
        ./modules/shell.nix
        ./modules/niri.nix
        nix-flatpak.nixosModules.nix-flatpak
        {
          _module.args = {inherit unstablePkgs nvfPkg;};
        }
      ];
    };
  };
}
