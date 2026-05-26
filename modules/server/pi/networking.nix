_: {
  
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 22 80 81 443 ];
    allowedUDPPorts = [ ];
  };

  # Configure hostname
  networking.hostName = "juniper";
}
