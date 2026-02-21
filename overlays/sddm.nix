final: prev: let
    unstablePkgs = import ../inputs.nixpks-unstable {inherit system; };
in {
    sddm = unstablePkgs.sddm;
}
