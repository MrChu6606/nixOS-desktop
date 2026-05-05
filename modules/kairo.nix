{ pkgs, ... }:

let
  kairo = pkgs.buildGoModule {
    pname = "kairo";
    version = "unstable-2026-05-05";

    src = pkgs.fetchFromGitHub {
      owner = "programmersd21";
      repo = "kairo";
      rev = "main";
      hash = "0rvdn144n4bgf5wmmpax7774wqdwp81z7qz4bwfs1fyni55f326n";
    };

    vendorHash = null;
  };
in
{
  # Add Kairo to system packages
  environment.systemPackages = [ kairo ];
}
