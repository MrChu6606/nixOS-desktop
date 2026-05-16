{ nixpkgs }:
{ 
    system, 
    overlays ? [], 
    modules, 
    extraSpecialArgs ? {}
}:

nixpkgs.lib.nixosSystem {
    inherit system modules;

    pkgs = import nixpkgs {
        inherit system overlays;
        config = { allowUnfree = true; };
    };

    specialArgs = {
        loadModules = 
            import ./load-modules.nix {inherit (nixpkgs) lib; };
    } // extraSpecialArgs;
}
