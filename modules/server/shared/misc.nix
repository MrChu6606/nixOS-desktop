_: {

  # Set automatic garbage collection
  # disabled for potential conflict with nh
  nix.gc = {
    automatic = false;
    dates = "weekly";
    options = "--delete-generations +5";
  };

  # Setup automatic optimization for de duplication
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];

  # Enable docker
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      data-root = "/mnt/appdata/docker";
    };
  };
}
