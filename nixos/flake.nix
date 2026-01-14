{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "path:../nixvim";
    librepods.url = "path:../librepods";
  };

  outputs = { self, nixpkgs, nixvim, librepods }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.lotus = pkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        nixvim.nixosModule
      ];

      configuration = {
        environment.systemPackages = [
          librepods.packages.${system}.librepods
        ];
      };
    };
  };
}

