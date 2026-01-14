{
  description = "My NixOS system flake";

  inputs = {
    # NixOS official package source, using the nixos-25.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "/home/${USER}/dotfiles/nixvim/flake.nix";
    # Importing non-flake github repo
    librepods = {
      url = "https://github.com/kavishdevar/librepods.git";
      # Optional: pin to a commit
      rev = "a01e16792a73deb34c5bd0c4aa019c496642ee71"
    };
  };

  outputs = { self, nixpkgs, nixvim, myProject }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # Wrap a non-flake GitHub project as a package
    librepodsPkg = import (builtins.fetchGit {
      url = "https://github.com/kavishdevar/librepods.git";
      rev = "a01e16792a73deb34c5bd0c4aa019c496642ee71";
    }) { inherit pkgs; };
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
	  librepodsPkg
	];
      };
    };
  };
}

