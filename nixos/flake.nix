{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixvim.url = "path:../nixvim";
    librepods.url = "path:../librepods";
  };

  outputs = { self, nixpkgs, nixvim, librepods }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.lotus = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        ./configuration.nix
        nixvim.nixosModules.default 
      ];

      configuration = {
        environment.systemPackages = with pkgs; [
          neovim
        ];
      };
    };
  };
}
