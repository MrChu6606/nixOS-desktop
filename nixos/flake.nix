{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixvim.url = "path:../nixvim";
    librepods.url = "path:../librepods";
  };

  outputs = { self, nixpkgs, nixvim, librepods }: {
    nixosConfigurations = {
      lotus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
	 ./configuration.nix
	];
        configuration.environment.systemPackages = with pkgs; [
          neovim
        ];
      };
    };
  };
}
