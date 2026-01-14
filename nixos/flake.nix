{
  description = "My NixOS system flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "path:../nixvim/flake.nix";
    librepods.url = "path:../librepods/flake.nix";
  };

  outputs = { self, nixpkgs, nixvim, librepods }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
    {
      nixosConfigurations.lotus = pkgs.lib.nixosSystem {
        inherit system;

	modules = [
	  ./configuration.nix
	  nixvim.nixosModule
	];
      
      # Optional: make GitHub project available as a package
      configuration = {
        environment.systemPackages = [
	  librepods.packages.${system}.librepods
	];
      };
    };
  };
}

