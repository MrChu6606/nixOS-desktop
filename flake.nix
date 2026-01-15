{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixvim.url = "path:./nixvim";
    librepods.url = "path:./librepods";
  };

  outputs = { self, nixpkgs, nixvim, librepods }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system;
    };
  in {
    nixosConfigurations.lotus = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        { nixpkgs.config.allowUnfree = true; }
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

        #./nixvim.nixosModules.default 
      ];
    };
  };
}
