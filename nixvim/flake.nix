{
  description = "nixvim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nixvim = import (builtings.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "nixos-25.05"
  });
  in
  {
    packages.${system}.nixvim = nixvim;

    # Provide a NixOS module so it can be imported directly
    nixosModule = {
      options = {};
      config = {
        programs.neovim.enable = true;
	programs.neovim.extraConfig = nixvim.configuration;
      };
    };
  };
}
