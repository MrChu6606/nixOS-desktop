{
  description = "Wrapper flake for librepods";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_linux"; };
    librepods = import (builtins.fetchGit {
      url = "https://github.com/kavishdevar/librepods.git";
      erv = "main" ; #pin a commit for stability
    }) { inherit pkgs; };
  in
  {
    packages.x86_64-linux.librepods = librepods;
  };
}
