# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  }: {
    # ↓ this is your host output in the flake schema
    nixosConfigurations."lotus" = nixpkgs.lib.nixosSystem {
      modules = [
        nvf.nixosModules.default # <- this imports the NixOS module that provides the options
        ./configuration.nix # <- your host entrypoint, `programs.nvf.*` may be defined here
      ];
    };
  };
}
